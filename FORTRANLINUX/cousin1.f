      subroutine cousin(z,v,v0,w_tot,T,pfor,pco2,n_in)
c subroutine cousin(z,v,v0,w_tot,T,pfor,pco2,n_in)
c this is the cousin lineshape using lookup tables
c z    = results array
c v    = frequency array
c v0   = center freq
c T    = temperature
c pfor = foreign press
c pco2 = co2 press
c n_in = no of input points

      real*8 z(n_in),v(n_in),v0,T,pfor,pco2,w_tot
      integer n_in

      real*8 pra,prc,fdif,fchi,df,chil,chiu,chif,chip
      integer it,itp,ip,nl,nh,nstp

c **********************************************************************
      real*8          vbc,vtc,dvc,tchi(5),chi(503,5)
      integer         nptc,nchi,i,j
      data vbc,vtc,dvc,nptc /0.0, 251.0, 0.5, 503/
      data nchi /5/,tchi/193.0, 238.0, 296.0, 218.0, 296.0/
c
      data ((chi(i,j),j=1,5),i=  1, 10)/
     +  1.0000E+00, 1.0000E+00, 1.0000E+00, 1.0000E+00, 1.0000E+00,
     +  1.0000E+00, 1.0000E+00, 1.0000E+00, 1.0000E+00, 1.0000E+00,
     +  1.0000E+00, 1.0000E+00, 9.4039E-01, 1.0000E+00, 1.0000E+00,
     +  1.0000E+00, 1.0000E+00, 8.8407E-01, 1.0000E+00, 1.0000E+00,
     +  1.0000E+00, 1.0000E+00, 8.3113E-01, 1.0000E+00, 1.0000E+00,
     +  1.0000E+00, 1.0000E+00, 7.8136E-01, 1.0000E+00, 1.0000E+00,
     +  1.0000E+00, 1.0000E+00, 7.3457E-01, 1.0000E+00, 1.0000E+00,
     +  1.0000E+00, 1.0000E+00, 6.9059E-01, 9.7160E-01, 9.3754E-01,
     +  1.0000E+00, 1.0000E+00, 6.4923E-01, 9.4340E-01, 8.7920E-01,
     +  1.0000E+00, 1.0000E+00, 6.1035E-01, 9.1520E-01, 8.2449E-01/
      data ((chi(i,j),j=1,5),i= 11, 20)/
     +  1.0000E+00, 1.0000E+00, 5.7381E-01, 8.8700E-01, 7.7318E-01,
     +  1.0000E+00, 9.3456E-01, 5.3944E-01, 8.5880E-01, 7.2506E-01,
     +  1.0000E+00, 8.7338E-01, 5.0714E-01, 8.3060E-01, 6.7994E-01,
     +  1.0000E+00, 8.1621E-01, 4.7677E-01, 8.0240E-01, 6.3763E-01,
     +  1.0000E+00, 7.6278E-01, 4.4822E-01, 7.7420E-01, 5.9795E-01,
     +  1.0000E+00, 7.1285E-01, 4.2138E-01, 7.4600E-01, 5.6074E-01,
     +  1.0000E+00, 6.6619E-01, 3.9615E-01, 7.1780E-01, 5.2584E-01,
     +  1.0000E+00, 6.2258E-01, 3.7243E-01, 6.8960E-01, 4.9312E-01,
     +  1.0000E+00, 5.8183E-01, 3.5013E-01, 6.6140E-01, 4.6243E-01,
     +  9.2749E-01, 5.4374E-01, 3.2916E-01, 6.3320E-01, 4.3366E-01/
      data ((chi(i,j),j=1,5),i= 21, 30)/
     +  8.5987E-01, 5.0815E-01, 3.0945E-01, 6.0500E-01, 4.0667E-01,
     +  7.9718E-01, 4.7489E-01, 2.9092E-01, 6.0167E-01, 4.0136E-01,
     +  7.3906E-01, 4.4380E-01, 2.7350E-01, 5.9631E-01, 3.9591E-01,
     +  6.8518E-01, 4.1475E-01, 2.5712E-01, 5.9089E-01, 3.9053E-01,
     +  6.3523E-01, 3.8760E-01, 2.4172E-01, 5.8542E-01, 3.8522E-01,
     +  5.8891E-01, 3.6223E-01, 2.2725E-01, 5.7991E-01, 3.7998E-01,
     +  5.4598E-01, 3.3852E-01, 2.1364E-01, 5.7437E-01, 3.7482E-01,
     +  5.0617E-01, 3.1636E-01, 2.0085E-01, 5.6879E-01, 3.6972E-01,
     +  4.6927E-01, 2.9565E-01, 1.8882E-01, 5.6319E-01, 3.6470E-01,
     +  4.3506E-01, 2.7630E-01, 1.7751E-01, 5.5757E-01, 3.5974E-01/
      data ((chi(i,j),j=1,5),i= 31, 40)/
     +  4.0334E-01, 2.5821E-01, 1.6688E-01, 5.5193E-01, 3.5485E-01,
     +  3.7393E-01, 2.4131E-01, 1.5689E-01, 5.4628E-01, 3.5003E-01,
     +  3.4667E-01, 2.2551E-01, 1.4749E-01, 5.4062E-01, 3.4527E-01,
     +  3.2140E-01, 2.1075E-01, 1.3866E-01, 5.3496E-01, 3.4058E-01,
     +  2.9797E-01, 1.9695E-01, 1.3036E-01, 5.2929E-01, 3.3595E-01,
     +  2.7624E-01, 1.8406E-01, 1.2255E-01, 5.2363E-01, 3.3138E-01,
     +  2.5610E-01, 1.7201E-01, 1.1521E-01, 5.1797E-01, 3.2688E-01,
     +  2.3743E-01, 1.6075E-01, 1.0831E-01, 5.1232E-01, 3.2244E-01,
     +  2.2012E-01, 1.5023E-01, 1.0183E-01, 5.0668E-01, 3.1805E-01,
     +  2.0407E-01, 1.4040E-01, 9.5731E-02, 5.0106E-01, 3.1373E-01/
      data ((chi(i,j),j=1,5),i= 41, 50)/
     +  1.8920E-01, 1.3121E-01, 8.9998E-02, 4.9545E-01, 3.0947E-01,
     +  1.7540E-01, 1.2262E-01, 8.9310E-02, 4.8986E-01, 3.0526E-01,
     +  1.6261E-01, 1.1459E-01, 8.8581E-02, 4.8429E-01, 3.0111E-01,
     +  1.5076E-01, 1.0709E-01, 8.7857E-02, 4.7874E-01, 2.9702E-01,
     +  1.3977E-01, 1.0008E-01, 8.7140E-02, 4.7321E-01, 2.9298E-01,
     +  1.2958E-01, 9.8857E-02, 8.6428E-02, 4.6771E-01, 2.8900E-01,
     +  1.2013E-01, 9.7805E-02, 8.5722E-02, 4.6224E-01, 2.8507E-01,
     +  1.1822E-01, 9.6764E-02, 8.5022E-02, 4.5679E-01, 2.8119E-01,
     +  1.1633E-01, 9.5734E-02, 8.4328E-02, 4.5138E-01, 2.7737E-01,
     +  1.1444E-01, 9.4715E-02, 8.3639E-02, 4.4600E-01, 2.7360E-01/
      data ((chi(i,j),j=1,5),i= 51, 60)/
     +  1.1255E-01, 9.3707E-02, 8.2956E-02, 4.4065E-01, 2.6988E-01,
     +  1.1066E-01, 9.2710E-02, 8.2279E-02, 4.3533E-01, 2.6622E-01,
     +  1.0877E-01, 9.1723E-02, 8.1607E-02, 4.3005E-01, 2.6260E-01,
     +  1.0688E-01, 9.0747E-02, 8.0940E-02, 4.2481E-01, 2.5903E-01,
     +  1.0499E-01, 8.9781E-02, 8.0279E-02, 4.1960E-01, 2.5551E-01,
     +  1.0311E-01, 8.8826E-02, 7.9624E-02, 4.1443E-01, 2.5203E-01,
     +  1.0122E-01, 8.7880E-02, 7.8974E-02, 4.0930E-01, 2.4861E-01,
     +  9.9731E-02, 8.6945E-02, 7.8329E-02, 4.0420E-01, 2.4523E-01,
     +  9.8364E-02, 8.6019E-02, 7.7689E-02, 3.9915E-01, 2.4190E-01,
     +  9.7016E-02, 8.5104E-02, 7.7055E-02, 3.9414E-01, 2.3861E-01/
      data ((chi(i,j),j=1,5),i= 61, 70)/
     +  9.5686E-02, 8.4198E-02, 7.6425E-02, 3.8917E-01, 2.3536E-01,
     +  9.4375E-02, 8.3302E-02, 7.5801E-02, 3.8424E-01, 2.3217E-01,
     +  9.3081E-02, 8.2416E-02, 7.5182E-02, 3.7935E-01, 2.2901E-01,
     +  9.1805E-02, 8.1538E-02, 7.4568E-02, 3.7451E-01, 2.2590E-01,
     +  9.0547E-02, 8.0671E-02, 7.3959E-02, 3.6970E-01, 2.2283E-01,
     +  8.9306E-02, 7.9812E-02, 7.3355E-02, 3.6494E-01, 2.1980E-01,
     +  8.8082E-02, 7.8963E-02, 7.2756E-02, 3.6023E-01, 2.1681E-01,
     +  8.6875E-02, 7.8122E-02, 7.2162E-02, 3.5556E-01, 2.1386E-01,
     +  8.5684E-02, 7.7291E-02, 7.1573E-02, 3.5093E-01, 2.1096E-01,
     +  8.4510E-02, 7.6468E-02, 7.0988E-02, 3.4634E-01, 2.0809E-01/
      data ((chi(i,j),j=1,5),i= 71, 80)/
     +  8.3352E-02, 7.5654E-02, 7.0408E-02, 3.4181E-01, 2.0526E-01,
     +  8.2210E-02, 7.4849E-02, 6.9833E-02, 3.3731E-01, 2.0247E-01,
     +  8.1083E-02, 7.4052E-02, 6.9263E-02, 3.3286E-01, 1.9972E-01,
     +  7.9972E-02, 7.3264E-02, 6.8698E-02, 3.2845E-01, 1.9700E-01,
     +  7.8876E-02, 7.2485E-02, 6.8137E-02, 3.2409E-01, 1.9433E-01,
     +  7.7795E-02, 7.1713E-02, 6.7580E-02, 3.1978E-01, 1.9169E-01,
     +  7.6728E-02, 7.0950E-02, 6.7028E-02, 3.1551E-01, 1.8908E-01,
     +  7.5677E-02, 7.0195E-02, 6.6481E-02, 3.1128E-01, 1.8651E-01,
     +  7.4640E-02, 6.9448E-02, 6.5938E-02, 3.0710E-01, 1.8397E-01,
     +  7.3617E-02, 6.8709E-02, 6.5399E-02, 3.0296E-01, 1.8147E-01/
      data ((chi(i,j),j=1,5),i= 81, 90)/
     +  7.2608E-02, 6.7977E-02, 6.4865E-02, 2.9887E-01, 1.7901E-01,
     +  7.1613E-02, 6.7254E-02, 6.4336E-02, 2.9482E-01, 1.7657E-01,
     +  7.0631E-02, 6.6538E-02, 6.3810E-02, 2.9081E-01, 1.7417E-01,
     +  6.9663E-02, 6.5830E-02, 6.3289E-02, 2.8685E-01, 1.7181E-01,
     +  6.8708E-02, 6.5129E-02, 6.2772E-02, 2.8294E-01, 1.6947E-01,
     +  6.7767E-02, 6.4436E-02, 6.2260E-02, 2.7906E-01, 1.6717E-01,
     +  6.6838E-02, 6.3750E-02, 6.1751E-02, 2.7523E-01, 1.6490E-01,
     +  6.5922E-02, 6.3072E-02, 6.1247E-02, 2.7145E-01, 1.6265E-01,
     +  6.5018E-02, 6.2401E-02, 6.0747E-02, 2.6771E-01, 1.6044E-01,
     +  6.4127E-02, 6.1736E-02, 6.0251E-02, 2.6401E-01, 1.5826E-01/
      data ((chi(i,j),j=1,5),i= 91,100)/
     +  6.3249E-02, 6.1079E-02, 5.9759E-02, 2.6035E-01, 1.5611E-01,
     +  6.2382E-02, 6.0429E-02, 5.9271E-02, 2.5674E-01, 1.5399E-01,
     +  6.1527E-02, 5.9786E-02, 5.8787E-02, 2.5317E-01, 1.5190E-01,
     +  6.0683E-02, 5.9150E-02, 5.8307E-02, 2.4964E-01, 1.4983E-01,
     +  5.9852E-02, 5.8520E-02, 5.7830E-02, 2.4615E-01, 1.4780E-01,
     +  5.9032E-02, 5.7897E-02, 5.7358E-02, 2.4271E-01, 1.4579E-01,
     +  5.8222E-02, 5.7281E-02, 5.6890E-02, 2.3930E-01, 1.4380E-01,
     +  5.7425E-02, 5.6672E-02, 5.6425E-02, 2.3594E-01, 1.4185E-01,
     +  5.6638E-02, 5.6068E-02, 5.5964E-02, 2.3262E-01, 1.3992E-01,
     +  5.5861E-02, 5.5472E-02, 5.5507E-02, 2.2934E-01, 1.3802E-01/
      data ((chi(i,j),j=1,5),i=101,110)/
     +  5.5096E-02, 5.4881E-02, 5.5054E-02, 2.2610E-01, 1.3614E-01,
     +  5.4261E-02, 5.4424E-02, 5.4261E-02, 2.2289E-01, 1.3429E-01,
     +  5.3732E-02, 5.3839E-02, 5.3732E-02, 2.1973E-01, 1.3247E-01,
     +  5.3208E-02, 5.3261E-02, 5.3208E-02, 2.1661E-01, 1.3067E-01,
     +  5.2689E-02, 5.2688E-02, 5.2689E-02, 2.1353E-01, 1.2889E-01,
     +  5.2175E-02, 5.2122E-02, 5.2175E-02, 2.1048E-01, 1.2714E-01,
     +  5.1666E-02, 5.1563E-02, 5.1666E-02, 2.0747E-01, 1.2541E-01,
     +  5.1162E-02, 5.1009E-02, 5.1162E-02, 2.0450E-01, 1.2371E-01,
     +  5.0664E-02, 5.0461E-02, 5.0664E-02, 2.0157E-01, 1.2203E-01,
     +  5.0169E-02, 4.9919E-02, 5.0169E-02, 1.9868E-01, 1.2037E-01/
      data ((chi(i,j),j=1,5),i=111,120)/
     +  4.9680E-02, 4.9383E-02, 4.9680E-02, 1.9582E-01, 1.1873E-01,
     +  4.9196E-02, 4.8852E-02, 4.9196E-02, 1.9300E-01, 1.1712E-01,
     +  4.8716E-02, 4.8327E-02, 4.8716E-02, 1.9022E-01, 1.1553E-01,
     +  4.8241E-02, 4.7808E-02, 4.8241E-02, 1.8747E-01, 1.1396E-01,
     +  4.7770E-02, 4.7295E-02, 4.7770E-02, 1.8476E-01, 1.1241E-01,
     +  4.7305E-02, 4.6787E-02, 4.7305E-02, 1.8208E-01, 1.1088E-01,
     +  4.6843E-02, 4.6284E-02, 4.6843E-02, 1.7944E-01, 1.0937E-01,
     +  4.6386E-02, 4.5787E-02, 4.6386E-02, 1.7683E-01, 1.0788E-01,
     +  4.5934E-02, 4.5295E-02, 4.5934E-02, 1.7426E-01, 1.0642E-01,
     +  4.5486E-02, 4.4808E-02, 4.5486E-02, 1.7172E-01, 1.0497E-01/
      data ((chi(i,j),j=1,5),i=121,130)/
     +  4.5043E-02, 4.4327E-02, 4.5043E-02, 1.6921E-01, 1.0354E-01,
     +  4.4603E-02, 4.3851E-02, 4.4603E-02, 1.6674E-01, 1.0214E-01,
     +  4.4168E-02, 4.3380E-02, 4.4168E-02, 1.6430E-01, 1.0075E-01,
     +  4.3738E-02, 4.2914E-02, 4.3738E-02, 1.6189E-01, 9.9380E-02,
     +  4.3311E-02, 4.2453E-02, 4.3311E-02, 1.5952E-01, 9.8029E-02,
     +  4.2889E-02, 4.1997E-02, 4.2889E-02, 1.5717E-01, 9.6697E-02,
     +  4.2470E-02, 4.1546E-02, 4.2470E-02, 1.5486E-01, 9.5382E-02,
     +  4.2056E-02, 4.1100E-02, 4.2056E-02, 1.5258E-01, 9.4086E-02,
     +  4.1646E-02, 4.0658E-02, 4.1646E-02, 1.5033E-01, 9.2807E-02,
     +  4.1240E-02, 4.0221E-02, 4.1240E-02, 1.4811E-01, 9.1546E-02/
      data ((chi(i,j),j=1,5),i=131,140)/
     +  4.0838E-02, 3.9789E-02, 4.0838E-02, 1.4592E-01, 9.0301E-02,
     +  4.0439E-02, 3.9362E-02, 4.0439E-02, 1.4376E-01, 8.9074E-02,
     +  4.0045E-02, 3.8939E-02, 4.0045E-02, 1.4163E-01, 8.7863E-02,
     +  3.9655E-02, 3.8521E-02, 3.9655E-02, 1.3953E-01, 8.6669E-02,
     +  3.9268E-02, 3.8107E-02, 3.9268E-02, 1.3746E-01, 8.5491E-02,
     +  3.8885E-02, 3.7698E-02, 3.8885E-02, 1.3542E-01, 8.4329E-02,
     +  3.8506E-02, 3.7293E-02, 3.8506E-02, 1.3340E-01, 8.3183E-02,
     +  3.8130E-02, 3.6892E-02, 3.8130E-02, 1.3141E-01, 8.2052E-02,
     +  3.7758E-02, 3.6496E-02, 3.7758E-02, 1.2945E-01, 8.0937E-02,
     +  3.7390E-02, 3.6104E-02, 3.7390E-02, 1.2752E-01, 7.9837E-02/
      data ((chi(i,j),j=1,5),i=141,150)/
     +  3.7025E-02, 3.5716E-02, 3.7025E-02, 1.2561E-01, 7.8751E-02,
     +  3.6664E-02, 3.5332E-02, 3.6664E-02, 1.2373E-01, 7.7681E-02,
     +  3.6307E-02, 3.4953E-02, 3.6307E-02, 1.2188E-01, 7.6625E-02,
     +  3.5953E-02, 3.4577E-02, 3.5953E-02, 1.2005E-01, 7.5584E-02,
     +  3.5602E-02, 3.4206E-02, 3.5602E-02, 1.1825E-01, 7.4556E-02,
     +  3.5255E-02, 3.3838E-02, 3.5255E-02, 1.1648E-01, 7.3543E-02,
     +  3.4911E-02, 3.3475E-02, 3.4911E-02, 1.1472E-01, 7.2543E-02,
     +  3.4571E-02, 3.3115E-02, 3.4571E-02, 1.1300E-01, 7.1557E-02,
     +  3.4234E-02, 3.2760E-02, 3.4234E-02, 1.1130E-01, 7.0585E-02,
     +  3.3900E-02, 3.2408E-02, 3.3900E-02, 1.0962E-01, 6.9625E-02/
      data ((chi(i,j),j=1,5),i=151,160)/
     +  3.3569E-02, 3.2060E-02, 3.3569E-02, 1.0796E-01, 6.8679E-02,
     +  3.3242E-02, 3.1715E-02, 3.3242E-02, 1.0633E-01, 6.7745E-02,
     +  3.2918E-02, 3.1375E-02, 3.2918E-02, 1.0472E-01, 6.6824E-02,
     +  3.2597E-02, 3.1038E-02, 3.2597E-02, 1.0314E-01, 6.5916E-02,
     +  3.2279E-02, 3.0704E-02, 3.2279E-02, 1.0158E-01, 6.5020E-02,
     +  3.1964E-02, 3.0374E-02, 3.1964E-02, 1.0004E-01, 6.4136E-02,
     +  3.1652E-02, 3.0048E-02, 3.1652E-02, 9.8517E-02, 6.3265E-02,
     +  3.1343E-02, 2.9725E-02, 3.1343E-02, 9.7021E-02, 6.2405E-02,
     +  3.1038E-02, 2.9406E-02, 3.1038E-02, 9.5546E-02, 6.1557E-02,
     +  3.0735E-02, 2.9090E-02, 3.0735E-02, 9.4092E-02, 6.0720E-02/
      data ((chi(i,j),j=1,5),i=161,170)/
     +  3.0435E-02, 2.8778E-02, 3.0435E-02, 9.2660E-02, 5.9895E-02,
     +  3.0139E-02, 2.8468E-02, 3.0139E-02, 9.1248E-02, 5.9080E-02,
     +  2.9845E-02, 2.8163E-02, 2.9845E-02, 8.9856E-02, 5.8277E-02,
     +  2.9554E-02, 2.7860E-02, 2.9554E-02, 8.8484E-02, 5.7485E-02,
     +  2.9265E-02, 2.7561E-02, 2.9265E-02, 8.7133E-02, 5.6704E-02,
     +  2.8980E-02, 2.7265E-02, 2.8980E-02, 8.5800E-02, 5.5933E-02,
     +  2.8697E-02, 2.6972E-02, 2.8697E-02, 8.4488E-02, 5.5173E-02,
     +  2.8418E-02, 2.6682E-02, 2.8418E-02, 8.3194E-02, 5.4423E-02,
     +  2.8140E-02, 2.6396E-02, 2.8140E-02, 8.1919E-02, 5.3683E-02,
     +  2.7866E-02, 2.6112E-02, 2.7866E-02, 8.0663E-02, 5.2954E-02/
      data ((chi(i,j),j=1,5),i=171,180)/
     +  2.7594E-02, 2.5832E-02, 2.7594E-02, 7.9425E-02, 5.2234E-02,
     +  2.7325E-02, 2.5554E-02, 2.7325E-02, 7.8205E-02, 5.1524E-02,
     +  2.7059E-02, 2.5280E-02, 2.7059E-02, 7.7003E-02, 5.0824E-02,
     +  2.6795E-02, 2.5008E-02, 2.6795E-02, 7.5819E-02, 5.0133E-02,
     +  2.6533E-02, 2.4739E-02, 2.6533E-02, 7.4652E-02, 4.9451E-02,
     +  2.6275E-02, 2.4474E-02, 2.6275E-02, 7.3502E-02, 4.8779E-02,
     +  2.6018E-02, 2.4211E-02, 2.6018E-02, 7.2369E-02, 4.8116E-02,
     +  2.5765E-02, 2.3951E-02, 2.5765E-02, 7.1253E-02, 4.7462E-02,
     +  2.5513E-02, 2.3693E-02, 2.5513E-02, 7.0153E-02, 4.6817E-02,
     +  2.5265E-02, 2.3439E-02, 2.5265E-02, 6.9070E-02, 4.6181E-02/
      data ((chi(i,j),j=1,5),i=181,190)/
     +  2.5018E-02, 2.3187E-02, 2.5018E-02, 6.8002E-02, 4.5553E-02,
     +  2.4774E-02, 2.2938E-02, 2.4774E-02, 6.6951E-02, 4.4934E-02,
     +  2.4533E-02, 2.2692E-02, 2.4533E-02, 6.5914E-02, 4.4323E-02,
     +  2.4293E-02, 2.2448E-02, 2.4293E-02, 6.4894E-02, 4.3721E-02,
     +  2.4057E-02, 2.2207E-02, 2.4057E-02, 6.3888E-02, 4.3126E-02,
     +  2.3822E-02, 2.1968E-02, 2.3822E-02, 6.2897E-02, 4.2540E-02,
     +  2.3590E-02, 2.1732E-02, 2.3590E-02, 6.1922E-02, 4.1962E-02,
     +  2.3360E-02, 2.1499E-02, 2.3360E-02, 6.0960E-02, 4.1392E-02,
     +  2.3132E-02, 2.1268E-02, 2.3132E-02, 6.0013E-02, 4.0829E-02,
     +  2.2906E-02, 2.1039E-02, 2.2906E-02, 5.9080E-02, 4.0274E-02/
      data ((chi(i,j),j=1,5),i=191,200)/
     +  2.2683E-02, 2.0813E-02, 2.2683E-02, 5.8161E-02, 3.9727E-02,
     +  2.2462E-02, 2.0590E-02, 2.2462E-02, 5.7256E-02, 3.9187E-02,
     +  2.2243E-02, 2.0369E-02, 2.2243E-02, 5.6365E-02, 3.8654E-02,
     +  2.2026E-02, 2.0150E-02, 2.2026E-02, 5.5486E-02, 3.8129E-02,
     +  2.1811E-02, 1.9933E-02, 2.1811E-02, 5.4621E-02, 3.7610E-02,
     +  2.1598E-02, 1.9719E-02, 2.1598E-02, 5.3769E-02, 3.7099E-02,
     +  2.1387E-02, 1.9507E-02, 2.1387E-02, 5.2930E-02, 3.6595E-02,
     +  2.1179E-02, 1.9298E-02, 2.1179E-02, 5.2103E-02, 3.6097E-02,
     +  2.0972E-02, 1.9091E-02, 2.0972E-02, 5.1289E-02, 3.5607E-02,
     +  2.0768E-02, 1.8886E-02, 2.0768E-02, 5.0487E-02, 3.5123E-02/
      data ((chi(i,j),j=1,5),i=201,210)/
     +  2.0565E-02, 1.8683E-02, 2.0565E-02, 4.9697E-02, 3.4645E-02,
     +  2.0365E-02, 1.8482E-02, 2.0365E-02, 4.8919E-02, 3.4175E-02,
     +  2.0166E-02, 1.8283E-02, 2.0166E-02, 4.8153E-02, 3.3710E-02,
     +  1.9970E-02, 1.8087E-02, 1.9970E-02, 4.7398E-02, 3.3252E-02,
     +  1.9775E-02, 1.7893E-02, 1.9775E-02, 4.6655E-02, 3.2800E-02,
     +  1.9582E-02, 1.7701E-02, 1.9582E-02, 4.5923E-02, 3.2354E-02,
     +  1.9391E-02, 1.7510E-02, 1.9391E-02, 4.5203E-02, 3.1914E-02,
     +  1.9202E-02, 1.7322E-02, 1.9202E-02, 4.4493E-02, 3.1480E-02,
     +  1.9015E-02, 1.7136E-02, 1.9015E-02, 4.3794E-02, 3.1053E-02,
     +  1.8829E-02, 1.6952E-02, 1.8829E-02, 4.3105E-02, 3.0630E-02/
      data ((chi(i,j),j=1,5),i=211,220)/
     +  1.8646E-02, 1.6770E-02, 1.8646E-02, 4.2427E-02, 3.0214E-02,
     +  1.8464E-02, 1.6590E-02, 1.8464E-02, 4.1760E-02, 2.9803E-02,
     +  1.8284E-02, 1.6412E-02, 1.8284E-02, 4.1102E-02, 2.9398E-02,
     +  1.8105E-02, 1.6235E-02, 1.8105E-02, 4.0455E-02, 2.8999E-02,
     +  1.7929E-02, 1.6061E-02, 1.7929E-02, 3.9817E-02, 2.8605E-02,
     +  1.7754E-02, 1.5889E-02, 1.7754E-02, 3.9190E-02, 2.8216E-02,
     +  1.7581E-02, 1.5718E-02, 1.7581E-02, 3.8571E-02, 2.7832E-02,
     +  1.7409E-02, 1.5549E-02, 1.7409E-02, 3.7963E-02, 2.7454E-02,
     +  1.7240E-02, 1.5382E-02, 1.7240E-02, 3.7363E-02, 2.7081E-02,
     +  1.7071E-02, 1.5217E-02, 1.7071E-02, 3.6773E-02, 2.6713E-02/
      data ((chi(i,j),j=1,5),i=221,230)/
     +  1.6905E-02, 1.5053E-02, 1.6905E-02, 3.6192E-02, 2.6350E-02,
     +  1.6740E-02, 1.4892E-02, 1.6740E-02, 3.5620E-02, 2.5992E-02,
     +  1.6577E-02, 1.4732E-02, 1.6577E-02, 3.5056E-02, 2.5638E-02,
     +  1.6415E-02, 1.4573E-02, 1.6415E-02, 3.4501E-02, 2.5290E-02,
     +  1.6255E-02, 1.4417E-02, 1.6255E-02, 3.3955E-02, 2.4946E-02,
     +  1.6097E-02, 1.4262E-02, 1.6097E-02, 3.3417E-02, 2.4607E-02,
     +  1.5940E-02, 1.4109E-02, 1.5940E-02, 3.2888E-02, 2.4272E-02,
     +  1.5784E-02, 1.3957E-02, 1.5784E-02, 3.2366E-02, 2.3943E-02,
     +  1.5630E-02, 1.3807E-02, 1.5630E-02, 3.1853E-02, 2.3617E-02,
     +  1.5478E-02, 1.3659E-02, 1.5478E-02, 3.1347E-02, 2.3296E-02/
      data ((chi(i,j),j=1,5),i=231,240)/
     +  1.5327E-02, 1.3512E-02, 1.5327E-02, 3.0850E-02, 2.2979E-02,
     +  1.5177E-02, 1.3367E-02, 1.5177E-02, 3.0360E-02, 2.2667E-02,
     +  1.5029E-02, 1.3224E-02, 1.5029E-02, 2.9877E-02, 2.2359E-02,
     +  1.4883E-02, 1.3081E-02, 1.4883E-02, 2.9403E-02, 2.2055E-02,
     +  1.4738E-02, 1.2941E-02, 1.4738E-02, 2.8935E-02, 2.1755E-02,
     +  1.4594E-02, 1.2802E-02, 1.4594E-02, 2.8475E-02, 2.1460E-02,
     +  1.4452E-02, 1.2664E-02, 1.4452E-02, 2.8022E-02, 2.1168E-02,
     +  1.4311E-02, 1.2528E-02, 1.4311E-02, 2.7575E-02, 2.0880E-02,
     +  1.4171E-02, 1.2394E-02, 1.4171E-02, 2.7136E-02, 2.0596E-02,
     +  1.4033E-02, 1.2261E-02, 1.4033E-02, 2.6704E-02, 2.0316E-02/
      data ((chi(i,j),j=1,5),i=241,250)/
     +  1.3896E-02, 1.2129E-02, 1.3896E-02, 2.6278E-02, 2.0040E-02,
     +  1.3761E-02, 1.1999E-02, 1.3761E-02, 2.5859E-02, 1.9819E-02,
     +  1.3626E-02, 1.1870E-02, 1.3626E-02, 2.5447E-02, 1.9622E-02,
     +  1.3493E-02, 1.1742E-02, 1.3493E-02, 2.5040E-02, 1.9427E-02,
     +  1.3362E-02, 1.1616E-02, 1.3362E-02, 2.4641E-02, 1.9234E-02,
     +  1.3232E-02, 1.1491E-02, 1.3232E-02, 2.4247E-02, 1.9043E-02,
     +  1.3103E-02, 1.1368E-02, 1.3103E-02, 2.3860E-02, 1.8854E-02,
     +  1.2975E-02, 1.1246E-02, 1.2975E-02, 2.3478E-02, 1.8667E-02,
     +  1.2848E-02, 1.1125E-02, 1.2848E-02, 2.3103E-02, 1.8481E-02,
     +  1.2723E-02, 1.1006E-02, 1.2723E-02, 2.2733E-02, 1.8297E-02/
      data ((chi(i,j),j=1,5),i=251,260)/
     +  1.2599E-02, 1.0887E-02, 1.2599E-02, 2.2370E-02, 1.8116E-02,
     +  1.2476E-02, 1.0770E-02, 1.2476E-02, 2.2011E-02, 1.7936E-02,
     +  1.2354E-02, 1.0655E-02, 1.2354E-02, 2.1659E-02, 1.7757E-02,
     +  1.2234E-02, 1.0540E-02, 1.2234E-02, 2.1312E-02, 1.7581E-02,
     +  1.2115E-02, 1.0427E-02, 1.2115E-02, 2.0970E-02, 1.7406E-02,
     +  1.1996E-02, 1.0315E-02, 1.1996E-02, 2.0634E-02, 1.7233E-02,
     +  1.1879E-02, 1.0204E-02, 1.1879E-02, 2.0303E-02, 1.7062E-02,
     +  1.1764E-02, 1.0095E-02, 1.1764E-02, 1.9978E-02, 1.6892E-02,
     +  1.1649E-02, 9.9861E-03, 1.1649E-02, 1.9657E-02, 1.6724E-02,
     +  1.1535E-02, 9.8789E-03, 1.1535E-02, 1.9342E-02, 1.6558E-02/
      data ((chi(i,j),j=1,5),i=261,270)/
     +  1.1423E-02, 9.7727E-03, 1.1423E-02, 1.9031E-02, 1.6394E-02,
     +  1.1311E-02, 9.6678E-03, 1.1311E-02, 1.8725E-02, 1.6231E-02,
     +  1.1201E-02, 9.5639E-03, 1.1201E-02, 1.8424E-02, 1.6070E-02,
     +  1.1092E-02, 9.4612E-03, 1.1092E-02, 1.8128E-02, 1.5910E-02,
     +  1.0984E-02, 9.3595E-03, 1.0984E-02, 1.7837E-02, 1.5752E-02,
     +  1.0877E-02, 9.2590E-03, 1.0877E-02, 1.7550E-02, 1.5595E-02,
     +  1.0770E-02, 9.1595E-03, 1.0770E-02, 1.7267E-02, 1.5440E-02,
     +  1.0665E-02, 9.0612E-03, 1.0665E-02, 1.6989E-02, 1.5287E-02,
     +  1.0561E-02, 8.9638E-03, 1.0561E-02, 1.6716E-02, 1.5135E-02,
     +  1.0458E-02, 8.8675E-03, 1.0458E-02, 1.6447E-02, 1.4984E-02/
      data ((chi(i,j),j=1,5),i=271,280)/
     +  1.0356E-02, 8.7723E-03, 1.0356E-02, 1.6182E-02, 1.4836E-02,
     +  1.0146E-02, 8.6780E-03, 1.0255E-02, 1.5921E-02, 1.4688E-02,
     +  9.9704E-03, 8.5848E-03, 1.0155E-02, 1.5664E-02, 1.4542E-02,
     +  9.7974E-03, 8.4926E-03, 1.0056E-02, 1.5412E-02, 1.4398E-02,
     +  9.6274E-03, 8.4014E-03, 9.9583E-03, 1.5163E-02, 1.4255E-02,
     +  9.4604E-03, 8.3111E-03, 9.8612E-03, 1.4918E-02, 1.4113E-02,
     +  9.2963E-03, 8.2219E-03, 9.7650E-03, 1.4677E-02, 1.3973E-02,
     +  9.1350E-03, 8.1335E-03, 9.6698E-03, 1.4440E-02, 1.3834E-02,
     +  8.9766E-03, 8.0462E-03, 9.5755E-03, 1.4207E-02, 1.3696E-02,
     +  8.8208E-03, 7.9597E-03, 9.4821E-03, 1.3978E-02, 1.3560E-02/
      data ((chi(i,j),j=1,5),i=281,290)/
     +  8.6678E-03, 7.8742E-03, 9.3896E-03, 1.3752E-02, 1.3425E-02,
     +  8.5175E-03, 7.7897E-03, 9.2981E-03, 1.3596E-02, 1.3292E-02,
     +  8.3697E-03, 7.7060E-03, 9.2074E-03, 1.3441E-02, 1.3160E-02,
     +  8.2245E-03, 7.6232E-03, 9.1176E-03, 1.3287E-02, 1.3029E-02,
     +  8.0818E-03, 7.5413E-03, 9.0287E-03, 1.3135E-02, 1.2900E-02,
     +  7.9416E-03, 7.4603E-03, 8.9406E-03, 1.2985E-02, 1.2771E-02,
     +  7.8039E-03, 7.3802E-03, 8.8534E-03, 1.2836E-02, 1.2645E-02,
     +  7.6685E-03, 7.3009E-03, 8.7671E-03, 1.2689E-02, 1.2519E-02,
     +  7.5354E-03, 7.2225E-03, 8.6816E-03, 1.2544E-02, 1.2394E-02,
     +  7.4047E-03, 7.1449E-03, 8.5969E-03, 1.2400E-02, 1.2271E-02/
      data ((chi(i,j),j=1,5),i=291,300)/
     +  7.2763E-03, 7.0681E-03, 8.5131E-03, 1.2259E-02, 1.2149E-02,
     +  7.1500E-03, 6.9922E-03, 8.4301E-03, 1.2118E-02, 1.2029E-02,
     +  7.0260E-03, 6.9171E-03, 8.3479E-03, 1.1980E-02, 1.1909E-02,
     +  6.9041E-03, 6.8428E-03, 8.2665E-03, 1.1843E-02, 1.1791E-02,
     +  6.7843E-03, 6.7693E-03, 8.1858E-03, 1.1707E-02, 1.1674E-02,
     +  6.6667E-03, 6.6966E-03, 8.1060E-03, 1.1573E-02, 1.1558E-02,
     +  6.5510E-03, 6.6246E-03, 8.0270E-03, 1.1441E-02, 1.1443E-02,
     +  6.4374E-03, 6.5535E-03, 7.9487E-03, 1.1310E-02, 1.1329E-02,
     +  6.3257E-03, 6.4831E-03, 7.8712E-03, 1.1180E-02, 1.1216E-02,
     +  6.2159E-03, 6.4134E-03, 7.7944E-03, 1.1052E-02, 1.1105E-02/
      data ((chi(i,j),j=1,5),i=301,310)/
     +  6.1081E-03, 6.3446E-03, 7.7184E-03, 1.0926E-02, 1.0995E-02,
     +  6.0022E-03, 6.2764E-03, 7.6431E-03, 1.0801E-02, 1.0885E-02,
     +  5.8980E-03, 6.2090E-03, 7.5686E-03, 1.0677E-02, 1.0777E-02,
     +  5.7957E-03, 6.1423E-03, 7.4948E-03, 1.0555E-02, 1.0670E-02,
     +  5.6952E-03, 6.0763E-03, 7.4217E-03, 1.0434E-02, 1.0564E-02,
     +  5.5964E-03, 6.0110E-03, 7.3493E-03, 1.0315E-02, 1.0459E-02,
     +  5.4993E-03, 5.9465E-03, 7.2776E-03, 1.0197E-02, 1.0355E-02,
     +  5.4039E-03, 5.8826E-03, 7.2067E-03, 1.0080E-02, 1.0252E-02,
     +  5.3101E-03, 5.8194E-03, 7.1364E-03, 9.9650E-03, 1.0150E-02,
     +  5.2180E-03, 5.7569E-03, 7.0668E-03, 9.8510E-03, 1.0049E-02/
      data ((chi(i,j),j=1,5),i=311,320)/
     +  5.1275E-03, 5.6950E-03, 6.9979E-03, 9.7383E-03, 9.9496E-03,
     +  5.0385E-03, 5.6339E-03, 6.9296E-03, 9.6268E-03, 9.8507E-03,
     +  4.9511E-03, 5.5734E-03, 6.8621E-03, 9.5167E-03, 9.7528E-03,
     +  4.8652E-03, 5.5135E-03, 6.7951E-03, 9.4078E-03, 9.6559E-03,
     +  4.7808E-03, 5.4543E-03, 6.7289E-03, 9.3001E-03, 9.5599E-03,
     +  4.6979E-03, 5.3957E-03, 6.6632E-03, 9.1937E-03, 9.4649E-03,
     +  4.6164E-03, 5.3377E-03, 6.5983E-03, 9.0885E-03, 9.3709E-03,
     +  4.5363E-03, 5.2804E-03, 6.5339E-03, 8.9845E-03, 9.2777E-03,
     +  4.4576E-03, 5.2236E-03, 6.4702E-03, 8.8817E-03, 9.1855E-03,
     +  4.3803E-03, 5.1675E-03, 6.4071E-03, 8.7801E-03, 9.0942E-03/
      data ((chi(i,j),j=1,5),i=321,330)/
     +  4.3043E-03, 5.1120E-03, 6.3446E-03, 8.6797E-03, 9.0039E-03,
     +  4.2296E-03, 5.0571E-03, 6.2827E-03, 8.5803E-03, 8.9144E-03,
     +  4.1563E-03, 5.0028E-03, 6.2215E-03, 8.4822E-03, 8.8258E-03,
     +  4.0842E-03, 4.9491E-03, 6.1608E-03, 8.3851E-03, 8.7381E-03,
     +  4.0133E-03, 4.8959E-03, 6.1007E-03, 8.2892E-03, 8.6513E-03,
     +  3.9437E-03, 4.8433E-03, 6.0412E-03, 8.1943E-03, 8.5653E-03,
     +  3.8753E-03, 4.7913E-03, 5.9823E-03, 8.1006E-03, 8.4802E-03,
     +  3.8081E-03, 4.7398E-03, 5.9240E-03, 8.0079E-03, 8.3959E-03,
     +  3.7420E-03, 4.6889E-03, 5.8662E-03, 7.9162E-03, 8.3125E-03,
     +  3.6771E-03, 4.6385E-03, 5.8090E-03, 7.8257E-03, 8.2298E-03/
      data ((chi(i,j),j=1,5),i=331,340)/
     +  3.6133E-03, 4.5887E-03, 5.7523E-03, 7.7361E-03, 8.1481E-03,
     +  3.5506E-03, 4.5394E-03, 5.6962E-03, 7.6476E-03, 8.0671E-03,
     +  3.4890E-03, 4.4906E-03, 5.6407E-03, 7.5601E-03, 7.9869E-03,
     +  3.4285E-03, 4.4424E-03, 5.5857E-03, 7.4736E-03, 7.9076E-03,
     +  3.3690E-03, 4.3947E-03, 5.5312E-03, 7.3881E-03, 7.8290E-03,
     +  3.3106E-03, 4.3475E-03, 5.4773E-03, 7.3036E-03, 7.7512E-03,
     +  3.2531E-03, 4.3008E-03, 5.4239E-03, 7.2200E-03, 7.6741E-03,
     +  3.1967E-03, 4.2546E-03, 5.3710E-03, 7.1374E-03, 7.5979E-03,
     +  3.1412E-03, 4.2089E-03, 5.3186E-03, 7.0557E-03, 7.5224E-03,
     +  3.0867E-03, 4.1637E-03, 5.2667E-03, 6.9750E-03, 7.4476E-03/
      data ((chi(i,j),j=1,5),i=341,350)/
     +  3.0332E-03, 4.1189E-03, 5.2154E-03, 6.8952E-03, 7.3736E-03,
     +  2.9806E-03, 4.0747E-03, 5.1645E-03, 6.8163E-03, 7.3003E-03,
     +  2.9289E-03, 4.0309E-03, 5.1141E-03, 6.7383E-03, 7.2278E-03,
     +  2.8781E-03, 3.9876E-03, 5.0643E-03, 6.6612E-03, 7.1559E-03,
     +  2.8281E-03, 3.9448E-03, 5.0149E-03, 6.5850E-03, 7.0848E-03,
     +  2.7791E-03, 3.9024E-03, 4.9660E-03, 6.5096E-03, 7.0144E-03,
     +  2.7309E-03, 3.8605E-03, 4.9175E-03, 6.4351E-03, 6.9447E-03,
     +  2.6835E-03, 3.8190E-03, 4.8696E-03, 6.3615E-03, 6.8757E-03,
     +  2.6369E-03, 3.7780E-03, 4.8221E-03, 6.2887E-03, 6.8074E-03,
     +  2.5912E-03, 3.7374E-03, 4.7751E-03, 6.2168E-03, 6.7397E-03/
      data ((chi(i,j),j=1,5),i=351,360)/
     +  2.5462E-03, 3.6973E-03, 4.7285E-03, 6.1456E-03, 6.6728E-03,
     +  2.5021E-03, 3.6576E-03, 4.6824E-03, 6.0753E-03, 6.6064E-03,
     +  2.4587E-03, 3.6183E-03, 4.6367E-03, 6.0058E-03, 6.5408E-03,
     +  2.4160E-03, 3.5794E-03, 4.5915E-03, 5.9371E-03, 6.4758E-03,
     +  2.3741E-03, 3.5410E-03, 4.5467E-03, 5.8691E-03, 6.4114E-03,
     +  2.3329E-03, 3.5029E-03, 4.5024E-03, 5.8020E-03, 6.3477E-03,
     +  2.2924E-03, 3.4653E-03, 4.4585E-03, 5.7356E-03, 6.2846E-03,
     +  2.2527E-03, 3.4281E-03, 4.4150E-03, 5.6700E-03, 6.2222E-03,
     +  2.2136E-03, 3.3912E-03, 4.3719E-03, 5.6051E-03, 6.1603E-03,
     +  2.1752E-03, 3.3548E-03, 4.3293E-03, 5.5410E-03, 6.0991E-03/
      data ((chi(i,j),j=1,5),i=361,370)/
     +  2.1375E-03, 3.3188E-03, 4.2871E-03, 5.4776E-03, 6.0385E-03,
     +  2.1004E-03, 3.2831E-03, 4.2453E-03, 5.4149E-03, 5.9785E-03,
     +  2.0639E-03, 3.2479E-03, 4.2039E-03, 5.3529E-03, 5.9191E-03,
     +  2.0281E-03, 3.2130E-03, 4.1629E-03, 5.2917E-03, 5.8603E-03,
     +  1.9930E-03, 3.1785E-03, 4.1223E-03, 5.2311E-03, 5.8020E-03,
     +  1.9584E-03, 3.1443E-03, 4.0821E-03, 5.1713E-03, 5.7444E-03,
     +  1.9244E-03, 3.1105E-03, 4.0423E-03, 5.1121E-03, 5.6873E-03,
     +  1.8910E-03, 3.0771E-03, 4.0029E-03, 5.0536E-03, 5.6308E-03,
     +  1.8582E-03, 3.0441E-03, 3.9638E-03, 4.9958E-03, 5.5748E-03,
     +  1.8260E-03, 3.0114E-03, 3.9252E-03, 4.9386E-03, 5.5194E-03/
      data ((chi(i,j),j=1,5),i=371,380)/
     +  1.7943E-03, 2.9790E-03, 3.8869E-03, 4.8821E-03, 5.4646E-03,
     +  1.7632E-03, 2.9470E-03, 3.8490E-03, 4.8263E-03, 5.4103E-03,
     +  1.7326E-03, 2.9154E-03, 3.8114E-03, 4.7710E-03, 5.3565E-03,
     +  1.7025E-03, 2.8841E-03, 3.7743E-03, 4.7165E-03, 5.3033E-03,
     +  1.6730E-03, 2.8531E-03, 3.7375E-03, 4.6625E-03, 5.2506E-03,
     +  1.6440E-03, 2.8224E-03, 3.7010E-03, 4.6091E-03, 5.1984E-03,
     +  1.6155E-03, 2.7921E-03, 3.6649E-03, 4.5564E-03, 5.1467E-03,
     +  1.5874E-03, 2.7621E-03, 3.6292E-03, 4.5043E-03, 5.0956E-03,
     +  1.5599E-03, 2.7324E-03, 3.5938E-03, 4.4527E-03, 5.0449E-03,
     +  1.5328E-03, 2.7031E-03, 3.5587E-03, 4.4018E-03, 4.9948E-03/
      data ((chi(i,j),j=1,5),i=381,390)/
     +  1.5062E-03, 2.6741E-03, 3.5240E-03, 4.3514E-03, 4.9452E-03,
     +  1.4801E-03, 2.6453E-03, 3.4897E-03, 4.3016E-03, 4.8960E-03,
     +  1.4544E-03, 2.6169E-03, 3.4556E-03, 4.2524E-03, 4.8474E-03,
     +  1.4292E-03, 2.5888E-03, 3.4219E-03, 4.2037E-03, 4.7992E-03,
     +  1.4044E-03, 2.5610E-03, 3.3886E-03, 4.1557E-03, 4.7515E-03,
     +  1.3800E-03, 2.5335E-03, 3.3555E-03, 4.1081E-03, 4.7043E-03,
     +  1.3561E-03, 2.5063E-03, 3.3228E-03, 4.0611E-03, 4.6575E-03,
     +  1.3326E-03, 2.4793E-03, 3.2904E-03, 4.0146E-03, 4.6112E-03,
     +  1.3095E-03, 2.4527E-03, 3.2583E-03, 3.9687E-03, 4.5654E-03,
     +  1.2867E-03, 2.4264E-03, 3.2265E-03, 3.9233E-03, 4.5200E-03/
      data ((chi(i,j),j=1,5),i=391,400)/
     +  1.2644E-03, 2.4003E-03, 3.1951E-03, 3.8784E-03, 4.4751E-03,
     +  1.2425E-03, 2.3745E-03, 3.1639E-03, 3.8340E-03, 4.4307E-03,
     +  1.2209E-03, 2.3490E-03, 3.1330E-03, 3.7901E-03, 4.3866E-03,
     +  1.1998E-03, 2.3238E-03, 3.1025E-03, 3.7468E-03, 4.3430E-03,
     +  1.1789E-03, 2.2988E-03, 3.0722E-03, 3.7039E-03, 4.2999E-03,
     +  1.1585E-03, 2.2741E-03, 3.0423E-03, 3.6615E-03, 4.2571E-03,
     +  1.1384E-03, 2.2497E-03, 3.0126E-03, 3.6196E-03, 4.2148E-03,
     +  1.1186E-03, 2.2255E-03, 2.9832E-03, 3.5782E-03, 4.1730E-03,
     +  1.0992E-03, 2.2016E-03, 2.9541E-03, 3.5373E-03, 4.1315E-03,
     +  1.0802E-03, 2.1780E-03, 2.9253E-03, 3.4968E-03, 4.0904E-03/
      data ((chi(i,j),j=1,5),i=401,410)/
     +  1.0614E-03, 2.1546E-03, 2.8968E-03, 3.4568E-03, 4.0498E-03,
     +  1.0430E-03, 2.1314E-03, 2.8685E-03, 3.4172E-03, 4.0095E-03,
     +  1.0249E-03, 2.1085E-03, 2.8406E-03, 3.3781E-03, 3.9697E-03,
     +  1.0071E-03, 2.0859E-03, 2.8129E-03, 3.3395E-03, 3.9302E-03,
     +  9.8967E-04, 2.0635E-03, 2.7854E-03, 3.3013E-03, 3.8912E-03,
     +  9.7250E-04, 2.0413E-03, 2.7583E-03, 3.2635E-03, 3.8525E-03,
     +  9.5563E-04, 2.0194E-03, 2.7314E-03, 3.2262E-03, 3.8142E-03,
     +  9.3905E-04, 1.9977E-03, 2.7047E-03, 3.1892E-03, 3.7763E-03,
     +  9.2276E-04, 1.9762E-03, 2.6784E-03, 3.1528E-03, 3.7388E-03,
     +  9.0676E-04, 1.9550E-03, 2.6522E-03, 3.1167E-03, 3.7016E-03/
      data ((chi(i,j),j=1,5),i=411,420)/
     +  8.9103E-04, 1.9340E-03, 2.6264E-03, 3.0810E-03, 3.6648E-03,
     +  8.7557E-04, 1.9132E-03, 2.6008E-03, 3.0458E-03, 3.6284E-03,
     +  8.6038E-04, 1.8927E-03, 2.5754E-03, 3.0109E-03, 3.5924E-03,
     +  8.4545E-04, 1.8724E-03, 2.5503E-03, 2.9765E-03, 3.5567E-03,
     +  8.3079E-04, 1.8522E-03, 2.5254E-03, 2.9424E-03, 3.5213E-03,
     +  8.1637E-04, 1.8323E-03, 2.5008E-03, 2.9087E-03, 3.4863E-03,
     +  8.0221E-04, 1.8127E-03, 2.4764E-03, 2.8755E-03, 3.4517E-03,
     +  7.8830E-04, 1.7932E-03, 2.4523E-03, 2.8426E-03, 3.4174E-03,
     +  7.7462E-04, 1.7739E-03, 2.4283E-03, 2.8100E-03, 3.3834E-03,
     +  7.6118E-04, 1.7549E-03, 2.4047E-03, 2.7779E-03, 3.3498E-03/
      data ((chi(i,j),j=1,5),i=421,430)/
     +  7.4798E-04, 1.7360E-03, 2.3812E-03, 2.7461E-03, 3.3165E-03,
     +  7.3500E-04, 1.7174E-03, 2.3580E-03, 2.7147E-03, 3.2836E-03,
     +  7.2225E-04, 1.6989E-03, 2.3350E-03, 2.6836E-03, 3.2509E-03,
     +  7.0972E-04, 1.6807E-03, 2.3122E-03, 2.6529E-03, 3.2186E-03,
     +  6.9741E-04, 1.6626E-03, 2.2897E-03, 2.6226E-03, 3.1866E-03,
     +  6.8531E-04, 1.6448E-03, 2.2673E-03, 2.5925E-03, 3.1550E-03,
     +  6.7342E-04, 1.6271E-03, 2.2452E-03, 2.5629E-03, 3.1236E-03,
     +  6.6174E-04, 1.6096E-03, 2.2233E-03, 2.5336E-03, 3.0926E-03,
     +  6.5026E-04, 1.5923E-03, 2.2016E-03, 2.5046E-03, 3.0618E-03,
     +  6.3898E-04, 1.5752E-03, 2.1802E-03, 2.4759E-03, 3.0314E-03/
      data ((chi(i,j),j=1,5),i=431,440)/
     +  6.2789E-04, 1.5583E-03, 2.1589E-03, 2.4476E-03, 3.0013E-03,
     +  6.1700E-04, 1.5416E-03, 2.1379E-03, 2.4196E-03, 2.9715E-03,
     +  6.0630E-04, 1.5250E-03, 2.1170E-03, 2.3919E-03, 2.9419E-03,
     +  5.9578E-04, 1.5086E-03, 2.0964E-03, 2.3645E-03, 2.9127E-03,
     +  5.8545E-04, 1.4924E-03, 2.0759E-03, 2.3375E-03, 2.8837E-03,
     +  5.7529E-04, 1.4764E-03, 2.0557E-03, 2.3107E-03, 2.8551E-03,
     +  5.6531E-04, 1.4605E-03, 2.0356E-03, 2.2843E-03, 2.8267E-03,
     +  5.5550E-04, 1.4448E-03, 2.0158E-03, 2.2581E-03, 2.7986E-03,
     +  5.4587E-04, 1.4293E-03, 1.9961E-03, 2.2323E-03, 2.7708E-03,
     +  5.3640E-04, 1.4140E-03, 1.9767E-03, 2.2068E-03, 2.7433E-03/
      data ((chi(i,j),j=1,5),i=441,450)/
     +  5.2709E-04, 1.3988E-03, 1.9574E-03, 2.1815E-03, 2.7160E-03,
     +  5.1795E-04, 1.3837E-03, 1.9383E-03, 2.1566E-03, 2.6890E-03,
     +  5.0896E-04, 1.3689E-03, 1.9194E-03, 2.1319E-03, 2.6623E-03,
     +  5.0013E-04, 1.3542E-03, 1.9007E-03, 2.1075E-03, 2.6358E-03,
     +  4.9146E-04, 1.3396E-03, 1.8821E-03, 2.0834E-03, 2.6096E-03,
     +  4.8293E-04, 1.3252E-03, 1.8638E-03, 2.0595E-03, 2.5837E-03,
     +  4.7455E-04, 1.3110E-03, 1.8456E-03, 2.0360E-03, 2.5580E-03,
     +  4.6632E-04, 1.2969E-03, 1.8276E-03, 2.0127E-03, 2.5326E-03,
     +  4.5823E-04, 1.2830E-03, 1.8098E-03, 1.9896E-03, 2.5074E-03,
     +  4.5028E-04, 1.2692E-03, 1.7921E-03, 1.9669E-03, 2.4825E-03/
      data ((chi(i,j),j=1,5),i=451,460)/
     +  4.4247E-04, 1.2556E-03, 1.7747E-03, 1.9444E-03, 2.4579E-03,
     +  4.3479E-04, 1.2421E-03, 1.7573E-03, 1.9221E-03, 2.4334E-03,
     +  4.2725E-04, 1.2287E-03, 1.7402E-03, 1.9001E-03, 2.4093E-03,
     +  4.1984E-04, 1.2155E-03, 1.7232E-03, 1.8784E-03, 2.3853E-03,
     +  4.1256E-04, 1.2025E-03, 1.7064E-03, 1.8569E-03, 2.3616E-03,
     +  4.0540E-04, 1.1896E-03, 1.6898E-03, 1.8357E-03, 2.3381E-03,
     +  3.9837E-04, 1.1768E-03, 1.6733E-03, 1.8146E-03, 2.3149E-03,
     +  3.9146E-04, 1.1642E-03, 1.6570E-03, 1.7939E-03, 2.2919E-03,
     +  3.8466E-04, 1.1517E-03, 1.6408E-03, 1.7734E-03, 2.2691E-03,
     +  3.7799E-04, 1.1393E-03, 1.6248E-03, 1.7531E-03, 2.2466E-03/
      data ((chi(i,j),j=1,5),i=461,470)/
     +  3.7143E-04, 1.1270E-03, 1.6090E-03, 1.7330E-03, 2.2242E-03,
     +  3.6499E-04, 1.1149E-03, 1.5933E-03, 1.7132E-03, 2.2021E-03,
     +  3.5866E-04, 1.1030E-03, 1.5778E-03, 1.6936E-03, 2.1803E-03,
     +  3.5244E-04, 1.0911E-03, 1.5624E-03, 1.6742E-03, 2.1586E-03,
     +  3.4632E-04, 1.0794E-03, 1.5471E-03, 1.6550E-03, 2.1371E-03,
     +  3.4032E-04, 1.0678E-03, 1.5320E-03, 1.6361E-03, 2.1159E-03,
     +  3.3441E-04, 1.0563E-03, 1.5171E-03, 1.6174E-03, 2.0949E-03,
     +  3.2861E-04, 1.0450E-03, 1.5023E-03, 1.5989E-03, 2.0741E-03,
     +  3.2291E-04, 1.0338E-03, 1.4877E-03, 1.5806E-03, 2.0534E-03,
     +  3.1731E-04, 1.0226E-03, 1.4732E-03, 1.5625E-03, 2.0330E-03/
      data ((chi(i,j),j=1,5),i=471,480)/
     +  3.1180E-04, 1.0117E-03, 1.4588E-03, 1.5446E-03, 2.0128E-03,
     +  3.0639E-04, 1.0008E-03, 1.4446E-03, 1.5269E-03, 1.9928E-03,
     +  3.0108E-04, 9.9005E-04, 1.4305E-03, 1.5095E-03, 1.9730E-03,
     +  2.9586E-04, 9.7941E-04, 1.4165E-03, 1.4922E-03, 1.9534E-03,
     +  2.9072E-04, 9.6889E-04, 1.4027E-03, 1.4751E-03, 1.9340E-03,
     +  2.8568E-04, 9.5848E-04, 1.3890E-03, 1.4583E-03, 1.9148E-03,
     +  2.8072E-04, 9.4819E-04, 1.3755E-03, 1.4416E-03, 1.8958E-03,
     +  2.7585E-04, 9.3800E-04, 1.3621E-03, 1.4251E-03, 1.8769E-03,
     +  2.7107E-04, 9.2793E-04, 1.3488E-03, 1.4088E-03, 1.8583E-03,
     +  2.6637E-04, 9.1796E-04, 1.3356E-03, 1.3926E-03, 1.8398E-03/
      data ((chi(i,j),j=1,5),i=481,490)/
     +  2.6175E-04, 9.0810E-04, 1.3226E-03, 1.3767E-03, 1.8215E-03,
     +  2.5720E-04, 8.9834E-04, 1.3097E-03, 1.3610E-03, 1.8034E-03,
     +  2.5274E-04, 8.8869E-04, 1.2969E-03, 1.3454E-03, 1.7855E-03,
     +  2.4836E-04, 8.7915E-04, 1.2843E-03, 1.3300E-03, 1.7677E-03,
     +  2.4405E-04, 8.6970E-04, 1.2718E-03, 1.3148E-03, 1.7502E-03,
     +  2.3982E-04, 8.6036E-04, 1.2594E-03, 1.2997E-03, 1.7328E-03,
     +  2.3566E-04, 8.5112E-04, 1.2471E-03, 1.2849E-03, 1.7156E-03,
     +  2.3157E-04, 8.4198E-04, 1.2349E-03, 1.2702E-03, 1.6985E-03,
     +  2.2755E-04, 8.3293E-04, 1.2229E-03, 1.2556E-03, 1.6816E-03,
     +  2.2360E-04, 8.2398E-04, 1.2110E-03, 1.2413E-03, 1.6649E-03/
      data ((chi(i,j),j=1,5),i=491,500)/
     +  2.1972E-04, 8.1513E-04, 1.1991E-03, 1.2271E-03, 1.6484E-03,
     +  2.1591E-04, 8.0638E-04, 1.1874E-03, 1.2130E-03, 1.6320E-03,
     +  2.1217E-04, 7.9772E-04, 1.1759E-03, 1.1991E-03, 1.6158E-03,
     +  2.0849E-04, 7.8915E-04, 1.1644E-03, 1.1854E-03, 1.5997E-03,
     +  2.0487E-04, 7.8067E-04, 1.1530E-03, 1.1719E-03, 1.5838E-03,
     +  2.0132E-04, 7.7228E-04, 1.1418E-03, 1.1584E-03, 1.5681E-03,
     +  1.9782E-04, 7.6399E-04, 1.1307E-03, 1.1452E-03, 1.5525E-03,
     +  1.9439E-04, 7.5578E-04, 1.1196E-03, 1.1321E-03, 1.5371E-03,
     +  1.9102E-04, 7.4766E-04, 1.1087E-03, 1.1191E-03, 1.5218E-03,
     +  1.8771E-04, 7.3963E-04, 1.0979E-03, 1.1063E-03, 1.5067E-03/
      data ((chi(i,j),j=1,5),i=501,503)/
     +  1.8445E-04, 7.3169E-04, 1.0872E-03, 1.0937E-03, 1.4917E-03,
     +  1.8125E-04, 7.2383E-04, 1.0766E-03, 1.0812E-03, 1.4769E-03,
     +  1.7810E-04, 7.1605E-04, 1.0661E-03, 1.0688E-03, 1.4622E-03/
c

c******************************* end of data section ***********************

c this is for the air broadened part
      if (T .ge. tchi(2)) it = 2 
      if (T .lt. tchi(2)) it = 1 

c this is for the self broadened part
      itp = 4 

c this is for the combination
      pra=pfor/(pfor+pco2) 
      prc=pco2/(pfor+pco2)
c      note that pra + prc = 1.0 

      nl=1
      nh=n_in
      nstp=1

         do ip=nl,nh,nstp 
            fdif = abs(v(ip) - v0) 
            j = min((nptc-2),int(fdif/dvc)) + 1 
            fchi = vbc + (j - 1)*dvc 
c 
            df=(fdif-fchi)/dvc
c 
c           Do the air (actually N2) broadened part 
            chil = chi(j,it)   + (chi(j+1,it)   - chi(j,it)  )*df 
            chiu = chi(j,it+1) + (chi(j+1,it+1) - chi(j,it+1))*df 
            chif = chil + 
     +         (chiu-chil)*(T-tchi(it))/(tchi(it+1)-tchi(it)) 
c 
c           Now do the pure cO2 part 
            chil = chi(j,itp)   + (chi(j+1,itp)   - chi(j,itp)  )*df 
            chiu = chi(j,itp+1) + (chi(j+1,itp+1) - chi(j,itp+1))*df 
            chip = chil + 
     +         (chiu-chil)*(T-tchi(itp))/(tchi(itp+1)-tchi(itp)) 
c 
            z(ip)=pra*chif + prc*chip 
         enddo 

       return
       end
