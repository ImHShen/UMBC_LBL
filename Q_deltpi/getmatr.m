function [matr]=getmatr(band,prb,freqq)
%this function get the appropriate matrix for us to use kfull/klor

%done from findratio.m
if (band == 668) 
   matr=[...
   6.5000e+02   4.8323e-01   4.7987e-01   4.7857e-01   4.7775e-01   4.7710e-01   4.7653e-01   4.7599e-01;
   6.6000e+02   4.8353e-01   4.8012e-01   4.7886e-01   4.7814e-01   4.7760e-01   4.7717e-01   4.7678e-01;
   6.8000e+02   4.8311e-01   4.7985e-01   4.7859e-01   4.7778e-01   4.7715e-01   4.7661e-01   4.7614e-01;
   7.0000e+02   4.8308e-01   4.7978e-01   4.7847e-01   4.7761e-01   4.7689e-01   4.7625e-01   4.7563e-01];
elseif (band == 740)
   matr=[...
   7.0000e+02   4.9580e-01   4.8849e-01   4.8300e-01   4.7903e-01   4.7615e-01   4.7410e-01   4.7266e-01;
   7.2000e+02   4.9587e-01   4.8854e-01   4.8306e-01   4.7913e-01   4.7631e-01   4.7435e-01   4.7302e-01;
   7.5000e+02   4.9581e-01   4.8871e-01   4.8338e-01   4.7952e-01   4.7670e-01   4.7469e-01   4.7326e-01;
   7.7000e+02   4.9572e-01   4.8849e-01   4.8302e-01   4.7904e-01   4.7613e-01   4.7401e-01   4.7250e-01];
elseif (band == 2093)
   matr=[...
   2.0750e+03   8.3723e-01   7.4782e-01   6.5725e-01   5.6554e-01   4.7286e-01   3.7946e-01   2.8563e-01;
   2.0800e+03   8.3726e-01   7.4785e-01   6.5729e-01   5.6560e-01   4.7296e-01   3.7959e-01   2.8579e-01;
   2.1050e+03   8.3721e-01   7.4784e-01   6.5730e-01   5.6562e-01   4.7302e-01   3.7981e-01   2.8637e-01;
   2.1200e+03   8.3718e-01   7.4778e-01   6.5721e-01   5.6547e-01   4.7275e-01   3.7934e-01   2.8556e-01];
  end
