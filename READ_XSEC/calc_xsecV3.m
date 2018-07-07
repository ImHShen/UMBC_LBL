function [absc, vgrid] = calc_xsec(gf, v1, v2, dv, tp, pL, db);

% function [absc, vgrid] = calc_xsec(gf, v1, v2, dv, tp, pL, db);
%
% calc_xsec returns IR absorptions calculated by
% interpolation or extrapolation of HITRAN tabulated
% IR cross-section data
%
% inputs
%   gf  - gas id or file
%   v1  - lower wavenumber
%   v2  - upper wavenumber
%   dv  - wavenumber increment
%   tp  - temperature profile
%   pL  - pressure levels for tp
%   db  - plot figure number (default is no plot)
%
% implicit inputs
%   nvpts = (v2-v1)/dv + 1, number of wavenumber points
%   nplev = length(pL), number of pressure levels
%
% outputs
%   absc  - nvpts x nplev array of layer absorptions, kmoles/cm^2
%   vgrid - nvpts vector of output frequencies
%

% Original Version:
% - H. Motteler, 15 Dec 98
% Revisions:
% - interpolation bug fix; fancier plotting; removed xsec data 
%   directory param; renamed "calc_xsec"; HM, 4 Apr 00

% physical extrapolation parameter, Ke = Km*(Tm/Te)^C1, where 
%   - Km is measured absorption at temperature Tm, and 
%   - Ke is estimated absorption at temperature Te.
%
C1 = 0.75;

% Set weights for interpolation and extrapolation 
% 
% If dt and dp are temperature and pressure distances from a
% tabulated point to a desired new temperature and presssure
% point, the "general extrapolation weight" for the tabulated 
% point is  ts/(ts+tn*dt) + pw*ps/(ps+pn*dp), where

tn = 1/100;	  % temperature normalization
pn = 1/1000;	  % pressure normalization
ts = 0.01;	  % temperature distance scaling
ps = 0.01;	  % pressure distance scaling
pw = 10;	  % pressure relative weight

% The values tn and pn are normalization factors and scale dt and
% dp to lie within a roughly [0,1] interval.  The parameters ts and
% ps are control the extent to which closer points will be favored;
% values of .05 to .5 are reasonable, with smaller values weighing
% closer tabulation points relatively more.  
% 
% The parameter pw controls the extent to which close pressure
% values are treated as more significant that similarly close
% temperature values.  Since we can extrapolate temperature
% to some extent, the pressure info is more significant and so
% is given greater weight.
% 
% As a sanity check, calc_xsec" can produce a plot to show the
% resultant normalized weights.  


% input defaults
if nargin == 6, 
  db = 0; 
end
if (nargin < 6 | 7 < nargin)
  error('wrong number of arguments')
end

% read_xsec() returns a structure with xsec data for this gas
xs = read_xsec(gf);
[nrec,nband] = size(xs);

% initializations
nvpts = 1 + round((v2-v1)/dv);  % points in output grid
vgrid = v1 + (0:nvpts-1) * dv;  % output wavenumber grid
v2 = vgrid(nvpts);              % make v2 a multiple of dv
nplev = length(pL); 	        % number of pressure levels
wc = zeros(nplev, nrec);        % "combination" weights
we = zeros(nplev, nrec);        % physical extrapolation weights
absc = zeros(nvpts, nplev);     % return zeros by default

for b = 1:nband

  % find intersection of xsec and requested wavenumber ranges
  % (note xsec band edges may vary somewhat from record to record)
  % v1Cind and v2Cind are indices into the output wavenumber grid
  % for the interval where there is tabulated data

  xv1 = max([xs(:,b).v1]); % max tabulated lower band edge
  xv2 = min([xs(:,b).v2]); % min tabulated upper band edge
  v1Cind = min(find( xv1 <= vgrid ));
  v2Cind = max(find( vgrid <= xv2 ));
  v1C = vgrid(v1Cind);
  v2C = vgrid(v2Cind);

  % see if the band is non-empty
  if v1C < v2C
  
    % initalize intermediate absorption arrays
    % because xsec data may be tabulated at varying points even within 
    % a nominal band, we must first interpolate xsec data to the output 
    % grid spacing before taking weighted combinations
    absbuf = zeros(1+v2Cind-v1Cind, nrec);

    % loop on records and build interpolation weights
    for r = 1:nrec
  
      if isempty(xs(r,b).v1), break, end
  
      % xsec record wavenumber grid
      xdv = (xs(r,b).v2 - xs(r,b).v1) / (xs(r,b).npts - 1);
      xvgrid = xs(r,b).v1 + (0:xs(r,b).npts - 1) * xdv;
  
      % interpolate to output array spacing
      absbuf(:,r) = interp1(xvgrid, xs(r,b).absc, ...
			    vgrid(v1Cind:v2Cind)', '*linear');
  
      % compute weights for this record, for each pressure level
      for L = 1:nplev
  
	% plug in an arbitrary value of 100 if we have a zero
	% (actually, an unknown) tabulation pressure
	if xs(r,b).pres == 0
	  xs(r,b).pres = 100;
	end

        dt = abs(xs(r,b).temp - tp(L));  % temperature distance
        dp = abs(xs(r,b).pres - pL(L));  % pressure distance

	% set general extrapolation weight
	wc(L,r) =  ts/(ts+tn*dt) + pw*ps/(ps+pn*dp);  
  
	% set temperature extrapolation weight
        we(L,r) = (xs(r,b).temp/tp(L))^C1;  
  
      end % pressure loop
  
    end % record loop
  
    % normalize combination weights, for each level
    for L = 1:nplev  
       wc(L,:) = wc(L,:) / sum(wc(L,:));
    end
  
    % combine absorptions, for each xsec record 
    for r = 1:nrec
      if isempty(xs(r,b).v1), break, end
      for L = 1:nplev  
  
        absc(v1Cind:v2Cind, L) = absc(v1Cind:v2Cind, L) + ...
  			     absbuf(:,r) * we(L,r) * wc(L,r);
      end
    end
  
    if db
      % option to visualize extrapolation weights
      figure(db)
      for L = 1:nplev
        clf
        stem3([xs(:,b).temp], [xs(:,b).pres], [wc(L,:)])
        hold on
        stem3(tp(L), pL(L), 0, 'r');
        xlabel('temperature');
        ylabel('pressure');
        if isnumeric(gf)
          spstr = '%s (gid %d)  extrapolation weights for %.0f K, %.0f mb';
          title(sprintf(spstr, xs(1,b).gstr, gf, tp, pL));
        else
          spstr = '%s extrapolation weights for %.0f K, %.0f mb';
          title(sprintf(spstr, xs(1,b).gstr, tp, pL));
        end
        hold off
        if L < nplev
          fprintf(1, '<return> for next extrapolation point\n');
          pause
        end
      end
    end % if db

  end % if v1C < v2C
  
end % band loop

