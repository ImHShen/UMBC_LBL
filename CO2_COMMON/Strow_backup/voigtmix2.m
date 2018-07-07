function [voimix]=voigtmix2(freqq,f,ymix,jq,temperature,w_forq,w_selfq,... 
                     strenqt,stuff,amt,NIF,birn); 
%NIF  = L for lorentz
%       V  for voigt actually vanHuber
%birn = y for include birnbaum
%       n otherwise
frequency_shift=stuff.frequency_shift;
density=stuff.density; 
pressure_self=stuff.pressure_self; 
pressure_for=stuff.pressure_for; 
pressure_ref=stuff.pressure_ref; 
temperature_ref=stuff.temperature_ref; 
path_length=stuff.path_length; 
bsm=stuff.bsm; 
mass=stuff.mass_CO2;

mass=44;
if (stuff.band == 648)  
  mass=45; 
elseif (stuff.band == 662)  
  mass=46; 
elseif (stuff.band == 2351)
  mass=45;
elseif (stuff.band == 2352)
  mass=46;
elseif (stuff.band == 2311)
  mass=45;
elseif (stuff.band == 2312)
  mass=46;
elseif (stuff.band == 2321)
  mass=45;
elseif (stuff.band == 2322)
  mass=46;
  end  

duration=stuff.duration;

%c do the doppler widths first 
k=1.380658e-23;
c_light=2.99792458e8;        %ms-1
amu=1.6605402e-27;            %nucleon mass/kg

%c alpha_doppler=v0*sqrt(2*log(2)*k*T/mass/c_light/c_light)
%c r2=2*log(2)*k/amu
r2=11526.218;

K_voigt_mixing=density*pressure_self/pressure_ref*temperature_ref*... 
        path_length/temperature;  %%%%%%%NOTE no factor of pi 
K_lorentz_mixing=density*pressure_self/pressure_ref*temperature_ref*... 
        path_length/temperature/pi;  %%%%%%%NOTE factor of pi 
%%%%%thus there is a factor of pi difference in defn of voigt vs lorentz
%%%%% also see Dave Tobin's voigter.m and GENLN2 manual eqn 4.8, bott pg 32
no_lines=length(freqq); no_pts=length(f); 
k=zeros(no_pts,1); 
 
%%%%%%%%%%%%%%%%%% Compute Kvoi %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
voimix=zeros(length(f),1);

c2 = 1.4387863;        %K/ cm-1  from Genln2 manual
freqq_shift=freqq+frequency_shift/100;

w_tot=(pressure_self*w_selfq+pressure_for*w_forq)/pressure_ref;

NIFNIF=1;
if ((NIF == 'V') | (NIF == 'v'))
  NIFNIF=1;
elseif ((NIF == 'B') | (NIF == 'b'))
  NIFNIF=1;
elseif ((NIF == 'L') | (NIF == 'l'))
  NIFNIF=-1;
  end

birnbirn=0;
if ((birn == 'b') | (birn == 'B') ) 
   birnbirn=1;
elseif ((birn == 'c') | (birn == 'C') )  
  birnbirn=-1;
  end

summm=sum(abs(ymix));  %see if the ymix coeffs are nonzero
if ((summm > 1.0e-6) & ((birn == 'c') | (birn == 'C')) )
  error('cannot have mixing AND cousin!!!')
  end

% this is a call to a Mex file
% if y1s.m has resorted stuff according to freqs, then THIS has to be resorted
% according to freqs as well
freqq_shift0 = freqq_shift;
w_tot0        = w_tot;
strenqt0      = strenqt;

[freqq_shift,ii]= sort(freqq_shift);
w_tot           = w_tot(ii);
strenqt         = strenqt(ii);

%disp('dumbass in voigmix2')
%plot(f); title('f'); pause; 
%plot(freqq_shift,w_tot); title('w-tot'); pause; 
%plot(freqq_shift,strenqt); title('stren'); pause; 
%plot(freqq_shift,ymix); title('ymix'); pause; 
%format short e
%[K_voigt_mixing K_lorentz_mixing]
%[duration pressure_for pressure_self mass]
%bsm
%birnbirn
%NIFNIF
%format
%pause
%format long e;
%popo = [freqq_shift'; ymix]; popo = popo'
%format
voimix=doVmix(f,freqq_shift,w_tot,temperature,duration,...
              pressure_for,pressure_self,mass,strenqt,ymix,...
              K_voigt_mixing,K_lorentz_mixing,bsm,birnbirn,NIFNIF);

freqq_shift = freqq_shift0;
w_tot        = w_tot0;
strenqt      = strenqt0;
