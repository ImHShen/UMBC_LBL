C***********************************************************************
C
C  PROGRAM        H2OFT0  BLOCK DATA
C
C  PURPOSE        FOREIGN DENSITY DEPENDENT CONTINUUM VALUES FOR H2O 
C                 AT 296K
C
C  VERSION        3.0   D.P. EDWARDS   01/01/89 
C
C  DESCRIPTION    VALUES TAKEN FROM FASCOD1B
C                 CLOUGH ET AL. (1981) SPIE VOL. 277 ATMOS. TRANS.
C                 THIS ROUTINE IS A DIRECT COPY OF BLOCK DATA 
C                 BFH2O 6/28/82, IN FASCOD EXCEPT THAT THE FREQUENCY 
C                 RANGE STARTS AT 0.0 CM-1 AND NOT -20.0 CM-1. 
C                 THE UNITS IN BS29 ARE GIVEN AS (CM**2/MOL) * 1.E-20. 
C                 I AM SURE THIS SHOULD BE (CM**2/MOL)*(1/CM-1)*1.E-20, 
C                 BUT THIS NEEDS CHECKING.
C
C***********************************************************************
C
      BLOCK DATA H2OFT0
C-----------------------------------------------------------------------

       REAL*8
     + F0001(50),F0051(50),F0101(50),F0151(50),F0201(50),F0251(50),  
     + F0301(50),F0351(50),F0401(50),F0451(50),F0501(50),F0551(50),  
     + F0601(50),F0651(50),F0701(50),F0751(50),F0801(50),F0851(50),  
     + F0901(50),F0951(50),F1001(50),F1051(50),F1101(50),F1151(50),  
     + F1201(50),F1251(50),F1301(50),F1351(50),F1401(50),F1451(50),  
     + F1501(50),F1551(50),F1601(50),F1651(50),F1701(50),F1751(50),  
     + F1801(50),F1851(50),F1901(50),F1951(50),F2001(1)              

       COMMON /CH2OF0/                                
     + F0001,F0051,F0101,F0151,F0201,F0251,  
     + F0301,F0351,F0401,F0451,F0501,F0551,  
     + F0601,F0651,F0701,F0751,F0801,F0851,  
     + F0901,F0951,F1001,F1051,F1101,F1151,  
     + F1201,F1251,F1301,F1351,F1401,F1451,  
     + F1501,F1551,F1601,F1651,F1701,F1751,  
     + F1801,F1851,F1901,F1951,F2001

C-----------------------------------------------------------------------
C
C     DATA VB1,VT2,DV1,NPT1 / 0.0, 20000.0, 10.0, 2001/         
C
      DATA F0001/                                                         511780
     X 1.1038E-02, 1.1715E-02, 1.2859E-02, 1.5326E-02, 1.6999E-02,        511790
     X 1.8321E-02, 1.9402E-02, 1.9570E-02, 1.9432E-02, 1.7572E-02,        511800
     X 1.6760E-02, 1.5480E-02, 1.3984E-02, 1.2266E-02, 1.0467E-02,        511810
     X 9.4526E-03, 8.0485E-03, 6.9484E-03, 6.1416E-03, 5.0941E-03,        511820
     X 4.4836E-03, 3.8133E-03, 3.4608E-03, 3.1487E-03, 2.4555E-03,        511830
     X 2.0977E-03, 1.7266E-03, 1.4920E-03, 1.2709E-03, 9.8081E-04,        511840
     X 8.5063E-04, 6.8822E-04, 5.3809E-04, 4.4679E-04, 3.3774E-04,        511850
     X 2.7979E-04, 2.1047E-04, 1.6511E-04, 1.2993E-04, 9.3033E-05,        511860
     X 7.4360E-05, 5.6428E-05, 4.5442E-05, 3.4575E-05, 2.7903E-05,        511870
     X 2.1374E-05, 1.6075E-05, 1.3022E-05, 1.0962E-05, 8.5959E-06/        511880
      DATA F0051/                                                         511890
     X 6.9125E-06, 5.3808E-06, 4.3586E-06, 3.6394E-06, 2.9552E-06,        511900
     X 2.3547E-06, 1.8463E-06, 1.6036E-06, 1.3483E-06, 1.1968E-06,        511910
     X 1.0333E-06, 8.4484E-07, 6.7195E-07, 5.0947E-07, 4.2343E-07,        511920
     X 3.4453E-07, 2.7830E-07, 2.3063E-07, 1.9951E-07, 1.7087E-07,        511930
     X 1.4393E-07, 1.2575E-07, 1.0750E-07, 8.2325E-08, 5.7524E-08,        511940
     X 4.4482E-08, 3.8106E-08, 3.4315E-08, 2.9422E-08, 2.5069E-08,        511950
     X 2.2402E-08, 1.9349E-08, 1.6152E-08, 1.2208E-08, 8.9660E-09,        511960
     X 7.1322E-09, 6.1028E-09, 5.2938E-09, 4.5350E-09, 3.4977E-09,        511970
     X 2.9511E-09, 2.4734E-09, 2.0508E-09, 1.8507E-09, 1.6373E-09,        511980
     X 1.5171E-09, 1.3071E-09, 1.2462E-09, 1.2148E-09, 1.2590E-09/        511990
      DATA F0101/                                                         512000
     X 1.3153E-09, 1.3301E-09, 1.4483E-09, 1.6944E-09, 2.0559E-09,        512010
     X 2.2954E-09, 2.6221E-09, 3.2606E-09, 4.2392E-09, 5.2171E-09,        512020
     X 6.2553E-09, 8.2548E-09, 9.5842E-09, 1.1280E-08, 1.3628E-08,        512030
     X 1.7635E-08, 2.1576E-08, 2.4835E-08, 3.0014E-08, 3.8485E-08,        512040
     X 4.7440E-08, 5.5202E-08, 7.0897E-08, 9.6578E-08, 1.3976E-07,        512050
     X 1.8391E-07, 2.3207E-07, 2.9960E-07, 4.0408E-07, 5.9260E-07,        512060
     X 7.8487E-07, 1.0947E-06, 1.4676E-06, 1.9325E-06, 2.6587E-06,        512070
     X 3.4534E-06, 4.4376E-06, 5.8061E-06, 7.0141E-06, 8.4937E-06,        512080
     X 1.0186E-05, 1.2034E-05, 1.3837E-05, 1.6595E-05, 1.9259E-05,        512090
     X 2.1620E-05, 2.3681E-05, 2.7064E-05, 3.2510E-05, 3.5460E-05/        512100
      DATA F0151/                                                         512110
     X 3.9109E-05, 4.2891E-05, 4.7757E-05, 5.0981E-05, 5.0527E-05,        512120
     X 4.8618E-05, 4.4001E-05, 3.7982E-05, 3.2667E-05, 2.7794E-05,        512130
     X 2.4910E-05, 2.4375E-05, 2.7316E-05, 3.2579E-05, 3.5499E-05,        512140
     X 3.8010E-05, 4.1353E-05, 4.3323E-05, 4.3004E-05, 3.9790E-05,        512150
     X 3.7718E-05, 3.6360E-05, 3.2386E-05, 2.7409E-05, 2.3626E-05,        512160
     X 2.0631E-05, 1.8371E-05, 1.5445E-05, 1.2989E-05, 1.1098E-05,        512170
     X 9.6552E-06, 8.0649E-06, 7.2365E-06, 5.9137E-06, 5.2759E-06,        512180
     X 4.8860E-06, 4.1321E-06, 3.5918E-06, 2.7640E-06, 2.4892E-06,        512190
     X 2.1018E-06, 1.7848E-06, 1.5855E-06, 1.3569E-06, 1.1986E-06,        512200
     X 9.4693E-07, 7.4097E-07, 6.3443E-07, 4.8131E-07, 4.0942E-07/        512210
      DATA F0201/                                                         512220
     X 3.3316E-07, 2.8488E-07, 2.3461E-07, 1.7397E-07, 1.4684E-07,        512230
     X 1.0953E-07, 8.5396E-08, 6.9261E-08, 5.4001E-08, 4.5430E-08,        512240
     X 3.2791E-08, 2.5995E-08, 2.0225E-08, 1.5710E-08, 1.3027E-08,        512250
     X 1.0229E-08, 8.5277E-09, 6.5249E-09, 5.0117E-09, 3.9906E-09,        512260
     X 3.2332E-09, 2.7847E-09, 2.4570E-09, 2.3359E-09, 2.0599E-09,        512270
     X 1.8436E-09, 1.6559E-09, 1.4910E-09, 1.2794E-09, 9.8229E-10,        512280
     X 8.0054E-10, 6.0769E-10, 4.5646E-10, 3.3111E-10, 2.4428E-10,        512290
     X 1.8007E-10, 1.3291E-10, 9.7974E-11, 7.8271E-11, 6.3833E-11,        512300
     X 5.4425E-11, 4.6471E-11, 4.0209E-11, 3.5227E-11, 3.1212E-11,        512310
     X 2.8840E-11, 2.7762E-11, 2.7935E-11, 3.2012E-11, 3.9525E-11/        512320
      DATA F0251/                                                         512330
     X 5.0303E-11, 6.8027E-11, 9.3954E-11, 1.2986E-10, 1.8478E-10,        512340
     X 2.5331E-10, 3.4827E-10, 4.6968E-10, 6.2380E-10, 7.9106E-10,        512350
     X 1.0026E-09, 1.2102E-09, 1.4146E-09, 1.6154E-09, 1.7510E-09,        512360
     X 1.8575E-09, 1.8742E-09, 1.8700E-09, 1.8582E-09, 1.9657E-09,        512370
     X 2.1204E-09, 2.0381E-09, 2.0122E-09, 2.0436E-09, 2.1213E-09,        512380
     X 2.0742E-09, 1.9870E-09, 2.0465E-09, 2.1556E-09, 2.2222E-09,        512390
     X 2.1977E-09, 2.1047E-09, 1.9334E-09, 1.7357E-09, 1.5754E-09,        512400
     X 1.4398E-09, 1.4018E-09, 1.5459E-09, 1.7576E-09, 2.1645E-09,        512410
     X 2.9480E-09, 4.4439E-09, 5.8341E-09, 8.0757E-09, 1.1658E-08,        512420
     X 1.6793E-08, 2.2694E-08, 2.9468E-08, 3.9278E-08, 5.2145E-08/        512430
      DATA F0301/                                                         512440
     X 6.4378E-08, 7.7947E-08, 8.5321E-08, 9.7848E-08, 1.0999E-07,        512450
     X 1.1489E-07, 1.2082E-07, 1.2822E-07, 1.4053E-07, 1.5238E-07,        512460
     X 1.5454E-07, 1.5018E-07, 1.4048E-07, 1.2359E-07, 1.0858E-07,        512470
     X 9.3486E-08, 8.1638E-08, 7.7690E-08, 8.4625E-08, 1.0114E-07,        512480
     X 1.1430E-07, 1.2263E-07, 1.3084E-07, 1.3380E-07, 1.3573E-07,        512490
     X 1.3441E-07, 1.2962E-07, 1.2638E-07, 1.1934E-07, 1.1371E-07,        512500
     X 1.0871E-07, 9.8843E-08, 9.1877E-08, 9.1050E-08, 9.3213E-08,        512510
     X 9.2929E-08, 1.0155E-07, 1.1263E-07, 1.2370E-07, 1.3636E-07,        512520
     X 1.5400E-07, 1.7656E-07, 2.1329E-07, 2.3045E-07, 2.5811E-07,        512530
     X 2.9261E-07, 3.4259E-07, 4.0770E-07, 4.8771E-07, 5.8081E-07/        512540
      DATA F0351/                                                         512550
     X 7.2895E-07, 8.7482E-07, 1.0795E-06, 1.3384E-06, 1.7208E-06,        512560
     X 2.0677E-06, 2.5294E-06, 3.1123E-06, 3.7900E-06, 4.7752E-06,        512570
     X 5.6891E-06, 6.6261E-06, 7.6246E-06, 8.7730E-06, 9.6672E-06,        512580
     X 1.0980E-05, 1.1287E-05, 1.1670E-05, 1.1635E-05, 1.1768E-05,        512590
     X 1.2039E-05, 1.2253E-05, 1.3294E-05, 1.4005E-05, 1.3854E-05,        512600
     X 1.3420E-05, 1.3003E-05, 1.2645E-05, 1.1715E-05, 1.1258E-05,        512610
     X 1.1516E-05, 1.2494E-05, 1.3655E-05, 1.4931E-05, 1.4649E-05,        512620
     X 1.3857E-05, 1.3120E-05, 1.1791E-05, 1.0637E-05, 8.2760E-06,        512630
     X 6.5821E-06, 5.1959E-06, 4.0158E-06, 3.0131E-06, 2.0462E-06,        512640
     X 1.4853E-06, 1.0365E-06, 7.3938E-07, 4.9752E-07, 3.4148E-07/        512650
      DATA F0401/                                                         512660
     X 2.4992E-07, 1.8363E-07, 1.4591E-07, 1.1380E-07, 9.0588E-08,        512670
     X 7.3697E-08, 6.0252E-08, 5.1868E-08, 4.2660E-08, 3.6163E-08,        512680
     X 3.2512E-08, 2.9258E-08, 2.4238E-08, 2.1209E-08, 1.6362E-08,        512690
     X 1.3871E-08, 1.2355E-08, 9.6940E-09, 7.7735E-09, 6.2278E-09,        512700
     X 5.2282E-09, 4.3799E-09, 3.5545E-09, 2.7527E-09, 2.0950E-09,        512710
     X 1.6344E-09, 1.2689E-09, 1.0403E-09, 8.4880E-10, 6.3461E-10,        512720
     X 4.7657E-10, 3.5220E-10, 2.7879E-10, 2.3021E-10, 1.6167E-10,        512730
     X 1.1732E-10, 8.9206E-11, 7.0596E-11, 5.8310E-11, 4.4084E-11,        512740
     X 3.1534E-11, 2.5068E-11, 2.2088E-11, 2.2579E-11, 2.2637E-11,        512750
     X 2.5705E-11, 3.2415E-11, 4.6116E-11, 6.5346E-11, 9.4842E-11/        512760
      DATA F0451/                                                         512770
     X 1.2809E-10, 1.8211E-10, 2.4052E-10, 3.0270E-10, 3.5531E-10,        512780
     X 4.2402E-10, 4.6730E-10, 4.7942E-10, 4.6813E-10, 4.5997E-10,        512790
     X 4.5788E-10, 4.0311E-10, 3.7367E-10, 3.3149E-10, 2.9281E-10,        512800
     X 2.5231E-10, 2.1152E-10, 1.9799E-10, 1.8636E-10, 1.9085E-10,        512810
     X 2.0786E-10, 2.2464E-10, 2.3785E-10, 2.5684E-10, 2.7499E-10,        512820
     X 2.6962E-10, 2.6378E-10, 2.6297E-10, 2.6903E-10, 2.7035E-10,        512830
     X 2.5394E-10, 2.5655E-10, 2.7184E-10, 2.9013E-10, 3.0585E-10,        512840
     X 3.0791E-10, 3.1667E-10, 3.4343E-10, 3.7365E-10, 4.0269E-10,        512850
     X 4.7260E-10, 5.6584E-10, 6.9791E-10, 8.6569E-10, 1.0393E-09,        512860
     X 1.2067E-09, 1.5047E-09, 1.8583E-09, 2.2357E-09, 2.6498E-09/        512870
      DATA F0501/                                                         512880
     X 3.2483E-09, 3.9927E-09, 4.6618E-09, 5.5555E-09, 6.6609E-09,        512890
     X 8.2139E-09, 1.0285E-08, 1.3919E-08, 1.8786E-08, 2.5150E-08,        512900
     X 3.3130E-08, 4.5442E-08, 6.3370E-08, 9.0628E-08, 1.2118E-07,        512910
     X 1.5927E-07, 2.1358E-07, 2.7825E-07, 3.7671E-07, 4.4894E-07,        512920
     X 5.4442E-07, 6.2240E-07, 7.3004E-07, 8.3384E-07, 8.7933E-07,        512930
     X 8.8080E-07, 8.6939E-07, 8.6541E-07, 8.2055E-07, 7.7278E-07,        512940
     X 7.5989E-07, 8.6909E-07, 9.7945E-07, 1.0394E-06, 1.0646E-06,        512950
     X 1.1509E-06, 1.2017E-06, 1.1915E-06, 1.1259E-06, 1.1549E-06,        512960
     X 1.1938E-06, 1.2356E-06, 1.2404E-06, 1.1716E-06, 1.1149E-06,        512970
     X 1.0073E-06, 8.9845E-07, 7.6639E-07, 6.1517E-07, 5.0887E-07/        512980
      DATA F0551/                                                         512990
     X 4.1269E-07, 3.2474E-07, 2.5698E-07, 1.8893E-07, 1.4009E-07,        513000
     X 1.0340E-07, 7.7724E-08, 5.7302E-08, 4.2178E-08, 2.9603E-08,        513010
     X 2.1945E-08, 1.6301E-08, 1.2806E-08, 1.0048E-08, 7.8970E-09,        513020
     X 6.1133E-09, 4.9054E-09, 4.1985E-09, 3.6944E-09, 3.2586E-09,        513030
     X 2.7362E-09, 2.3647E-09, 2.1249E-09, 1.8172E-09, 1.6224E-09,        513040
     X 1.5158E-09, 1.2361E-09, 1.0682E-09, 9.2312E-10, 7.9220E-10,        513050
     X 6.8174E-10, 5.6147E-10, 4.8268E-10, 4.1534E-10, 3.3106E-10,        513060
     X 2.8275E-10, 2.4584E-10, 2.0742E-10, 1.7840E-10, 1.4664E-10,        513070
     X 1.2390E-10, 1.0497E-10, 8.5038E-11, 6.7008E-11, 5.6355E-11,        513080
     X 4.3323E-11, 3.6914E-11, 3.2262E-11, 3.0749E-11, 3.0318E-11/        513090
      DATA F0601/                                                         513100
     X 2.9447E-11, 2.9918E-11, 3.0668E-11, 3.1315E-11, 3.0329E-11,        513110
     X 2.8259E-11, 2.6065E-11, 2.3578E-11, 2.0469E-11, 1.6908E-11,        513120
     X 1.4912E-11, 1.1867E-11, 9.9730E-12, 8.1014E-12, 6.7528E-12,        513130
     X 6.3133E-12, 5.8599E-12, 6.0145E-12, 6.5105E-12, 7.0537E-12,        513140
     X 7.4973E-12, 7.8519E-12, 8.5039E-12, 9.1995E-12, 1.0694E-11,        513150
     X 1.1659E-11, 1.2685E-11, 1.3087E-11, 1.3222E-11, 1.2634E-11,        513160
     X 1.1077E-11, 9.6259E-12, 8.3202E-12, 7.4857E-12, 6.8069E-12,        513170
     X 6.7496E-12, 7.3116E-12, 8.0171E-12, 8.6394E-12, 9.2659E-12,        513180
     X 1.0048E-11, 1.0941E-11, 1.2226E-11, 1.3058E-11, 1.5193E-11,        513190
     X 1.8923E-11, 2.3334E-11, 2.8787E-11, 3.6693E-11, 4.8295E-11/        513200
      DATA F0651/                                                         513210
     X 6.4260E-11, 8.8269E-11, 1.1865E-10, 1.5961E-10, 2.0605E-10,        513220
     X 2.7349E-10, 3.7193E-10, 4.8216E-10, 6.1966E-10, 7.7150E-10,        513230
     X 1.0195E-09, 1.2859E-09, 1.6535E-09, 2.0316E-09, 2.3913E-09,        513240
     X 3.0114E-09, 3.7495E-09, 4.6504E-09, 5.9145E-09, 7.6840E-09,        513250
     X 1.0304E-08, 1.3010E-08, 1.6441E-08, 2.1475E-08, 2.5892E-08,        513260
     X 2.9788E-08, 3.3820E-08, 4.0007E-08, 4.4888E-08, 4.5765E-08,        513270
     X 4.6131E-08, 4.6239E-08, 4.4849E-08, 4.0729E-08, 3.6856E-08,        513280
     X 3.6164E-08, 3.7606E-08, 4.1457E-08, 4.3750E-08, 5.1150E-08,        513290
     X 5.6054E-08, 6.1586E-08, 6.4521E-08, 6.6494E-08, 6.9024E-08,        513300
     X 6.8893E-08, 7.0901E-08, 6.9760E-08, 7.1485E-08, 7.0740E-08/        513310
      DATA F0701/                                                         513320
     X 7.3764E-08, 7.6618E-08, 8.4182E-08, 9.3838E-08, 1.0761E-07,        513330
     X 1.2851E-07, 1.4748E-07, 1.8407E-07, 2.2109E-07, 2.6392E-07,        513340
     X 2.9887E-07, 3.4493E-07, 4.0336E-07, 4.3551E-07, 4.9231E-07,        513350
     X 5.0728E-07, 5.3781E-07, 5.3285E-07, 5.4496E-07, 5.5707E-07,        513360
     X 5.6944E-07, 6.1123E-07, 6.4317E-07, 6.4581E-07, 6.1999E-07,        513370
     X 6.0191E-07, 5.7762E-07, 5.7241E-07, 5.7013E-07, 6.0160E-07,        513380
     X 6.6905E-07, 7.4095E-07, 8.2121E-07, 8.0947E-07, 7.6145E-07,        513390
     X 7.2193E-07, 6.3722E-07, 5.4316E-07, 4.2186E-07, 3.2528E-07,        513400
     X 2.5207E-07, 1.8213E-07, 1.2658E-07, 8.6746E-08, 6.0216E-08,        513410
     X 4.1122E-08, 2.8899E-08, 2.1740E-08, 1.7990E-08, 1.5593E-08/        513420
      DATA F0751/                                                         513430
     X 1.3970E-08, 1.2238E-08, 1.0539E-08, 9.2386E-09, 7.8481E-09,        513440
     X 6.8704E-09, 5.7615E-09, 5.0434E-09, 4.6886E-09, 4.3770E-09,        513450
     X 3.9768E-09, 3.5202E-09, 3.1854E-09, 2.9009E-09, 2.5763E-09,        513460
     X 2.2135E-09, 1.9455E-09, 1.6248E-09, 1.3368E-09, 1.0842E-09,        513470
     X 8.4254E-10, 6.7414E-10, 5.4667E-10, 4.5005E-10, 3.4932E-10,        513480
     X 2.6745E-10, 2.2053E-10, 1.8162E-10, 1.4935E-10, 1.1618E-10,        513490
     X 9.1888E-11, 8.0672E-11, 6.8746E-11, 6.2668E-11, 5.5715E-11,        513500
     X 4.5074E-11, 3.7669E-11, 3.2082E-11, 2.8085E-11, 2.4838E-11,        513510
     X 1.9791E-11, 1.6964E-11, 1.3887E-11, 1.1179E-11, 9.7499E-12,        513520
     X 7.8255E-12, 6.3698E-12, 5.3265E-12, 4.6588E-12, 4.4498E-12/        513530
      DATA F0801/                                                         513540
     X 3.9984E-12, 3.7513E-12, 3.7176E-12, 3.9148E-12, 4.2702E-12,        513550
     X 5.0090E-12, 6.5801E-12, 8.7787E-12, 1.2718E-11, 1.8375E-11,        513560
     X 2.5304E-11, 3.5403E-11, 4.8842E-11, 6.4840E-11, 8.0911E-11,        513570
     X 1.0136E-10, 1.2311E-10, 1.4203E-10, 1.5869E-10, 1.8093E-10,        513580
     X 2.1370E-10, 2.5228E-10, 2.8816E-10, 3.4556E-10, 3.9860E-10,        513590
     X 4.4350E-10, 4.7760E-10, 5.2357E-10, 6.0827E-10, 6.3635E-10,        513600
     X 6.5886E-10, 6.8753E-10, 7.2349E-10, 7.2789E-10, 6.8232E-10,        513610
     X 6.6081E-10, 6.4232E-10, 6.3485E-10, 6.4311E-10, 7.2235E-10,        513620
     X 7.7263E-10, 8.1668E-10, 9.0324E-10, 9.7643E-10, 1.0535E-09,        513630
     X 1.0195E-09, 1.0194E-09, 1.0156E-09, 9.6792E-10, 9.2725E-10/        513640
      DATA F0851/                                                         513650
     X 8.7347E-10, 8.4484E-10, 8.2647E-10, 8.4363E-10, 9.1261E-10,        513660
     X 1.0051E-09, 1.1511E-09, 1.4037E-09, 1.8066E-09, 2.4483E-09,        513670
     X 3.2739E-09, 4.3194E-09, 5.6902E-09, 7.7924E-09, 9.7376E-09,        513680
     X 1.2055E-08, 1.4303E-08, 1.6956E-08, 1.9542E-08, 2.2233E-08,        513690
     X 2.5186E-08, 2.7777E-08, 2.8943E-08, 2.8873E-08, 2.9417E-08,        513700
     X 2.7954E-08, 2.7524E-08, 2.7040E-08, 3.1254E-08, 3.6843E-08,        513710
     X 3.7797E-08, 3.8713E-08, 4.0135E-08, 4.2824E-08, 4.3004E-08,        513720
     X 4.0279E-08, 4.2781E-08, 4.5220E-08, 4.8948E-08, 5.0172E-08,        513730
     X 4.8499E-08, 4.7182E-08, 4.2204E-08, 3.7701E-08, 3.0972E-08,        513740
     X 2.4654E-08, 1.9543E-08, 1.4609E-08, 1.1171E-08, 8.3367E-09/        513750
      DATA F0901/                                                         513760
     X 6.3791E-09, 5.0790E-09, 4.0655E-09, 3.3658E-09, 2.7882E-09,        513770
     X 2.4749E-09, 2.2287E-09, 2.0217E-09, 1.8191E-09, 1.5897E-09,        513780
     X 1.4191E-09, 1.2448E-09, 1.0884E-09, 9.3585E-10, 7.9429E-10,        513790
     X 7.3214E-10, 6.5008E-10, 5.7549E-10, 5.4300E-10, 4.7251E-10,        513800
     X 4.3451E-10, 3.8446E-10, 3.5589E-10, 3.4432E-10, 2.8209E-10,        513810
     X 2.4620E-10, 2.1278E-10, 1.8406E-10, 1.6314E-10, 1.3261E-10,        513820
     X 1.1696E-10, 9.6865E-11, 7.6814E-11, 6.6411E-11, 5.0903E-11,        513830
     X 4.0827E-11, 3.0476E-11, 2.3230E-11, 1.7707E-11, 1.3548E-11,        513840
     X 1.0719E-11, 9.3026E-12, 8.7967E-12, 8.3136E-12, 7.3918E-12,        513850
     X 6.5293E-12, 5.9243E-12, 5.3595E-12, 3.5266E-12, 2.2571E-12/        513860
      DATA F0951/                                                         513870
     X 1.6150E-12, 1.1413E-12, 8.4998E-13, 7.0803E-13, 5.1747E-13,        513880
     X 4.0694E-13, 3.6528E-13, 3.3670E-13, 3.1341E-13, 2.9390E-13,        513890
     X 2.8680E-13, 3.1283E-13, 3.7294E-13, 5.0194E-13, 6.7919E-13,        513900
     X 1.0455E-12, 1.5230E-12, 2.3932E-12, 3.4231E-12, 5.0515E-12,        513910
     X 7.3193E-12, 9.9406E-12, 1.2193E-11, 1.4742E-11, 1.9269E-11,        513920
     X 2.1816E-11, 2.2750E-11, 2.2902E-11, 2.3888E-11, 2.4902E-11,        513930
     X 2.2160E-11, 2.0381E-11, 1.9903E-11, 2.0086E-11, 1.9304E-11,        513940
     X 2.0023E-11, 2.2244E-11, 2.5450E-11, 3.1228E-11, 3.4560E-11,        513950
     X 3.6923E-11, 3.7486E-11, 3.8124E-11, 3.8317E-11, 3.4737E-11,        513960
     X 3.3037E-11, 3.1724E-11, 2.9840E-11, 2.8301E-11, 2.5857E-11/        513970
      DATA F1001/                                                         513980
     X 2.3708E-11, 1.9452E-11, 1.6232E-11, 1.5174E-11, 1.4206E-11,        513990
     X 1.4408E-11, 1.5483E-11, 1.8642E-11, 2.3664E-11, 3.0181E-11,        514000
     X 4.0160E-11, 5.2287E-11, 7.2754E-11, 1.0511E-10, 1.4531E-10,        514010
     X 2.0998E-10, 2.6883E-10, 3.3082E-10, 4.2638E-10, 5.3132E-10,        514020
     X 6.3617E-10, 7.1413E-10, 8.5953E-10, 9.9715E-10, 1.0796E-09,        514030
     X 1.0978E-09, 1.1052E-09, 1.1095E-09, 1.0641E-09, 9.7881E-10,        514040
     X 9.6590E-10, 1.0332E-09, 1.1974E-09, 1.3612E-09, 1.5829E-09,        514050
     X 1.8655E-09, 2.1465E-09, 2.4779E-09, 2.7370E-09, 2.9915E-09,        514060
     X 3.3037E-09, 3.6347E-09, 3.9587E-09, 4.4701E-09, 5.0122E-09,        514070
     X 5.8044E-09, 6.1916E-09, 6.9613E-09, 7.7863E-09, 8.2820E-09/        514080
      DATA F1051/                                                         514090
     X 9.4359E-09, 9.7387E-09, 1.0656E-08, 1.0746E-08, 1.1210E-08,        514100
     X 1.1905E-08, 1.2194E-08, 1.3145E-08, 1.3738E-08, 1.3634E-08,        514110
     X 1.3011E-08, 1.2511E-08, 1.1805E-08, 1.2159E-08, 1.2390E-08,        514120
     X 1.3625E-08, 1.5678E-08, 1.7886E-08, 1.9933E-08, 1.9865E-08,        514130
     X 1.9000E-08, 1.7812E-08, 1.5521E-08, 1.2593E-08, 9.5635E-09,        514140
     X 7.2987E-09, 5.2489E-09, 3.5673E-09, 2.4206E-09, 1.6977E-09,        514150
     X 1.2456E-09, 9.3744E-10, 7.8379E-10, 6.9960E-10, 6.6451E-10,        514160
     X 6.8521E-10, 7.4234E-10, 8.6658E-10, 9.4972E-10, 1.0791E-09,        514170
     X 1.2359E-09, 1.3363E-09, 1.5025E-09, 1.5368E-09, 1.6152E-09,        514180
     X 1.6184E-09, 1.6557E-09, 1.7035E-09, 1.6916E-09, 1.7237E-09/        514190
      DATA F1101/                                                         514200
     X 1.7175E-09, 1.6475E-09, 1.5335E-09, 1.4272E-09, 1.3282E-09,        514210
     X 1.3459E-09, 1.4028E-09, 1.5192E-09, 1.7068E-09, 1.9085E-09,        514220
     X 2.1318E-09, 2.1020E-09, 1.9942E-09, 1.8654E-09, 1.6391E-09,        514230
     X 1.3552E-09, 1.0186E-09, 7.8540E-10, 5.7022E-10, 3.9247E-10,        514240
     X 2.5441E-10, 1.6699E-10, 1.1132E-10, 6.8989E-11, 4.5255E-11,        514250
     X 3.1106E-11, 2.3161E-11, 1.7618E-11, 1.4380E-11, 1.1601E-11,        514260
     X 9.7148E-12, 8.4519E-12, 6.5392E-12, 5.4113E-12, 4.7624E-12,        514270
     X 4.0617E-12, 3.6173E-12, 2.8608E-12, 2.2724E-12, 1.7436E-12,        514280
     X 1.3424E-12, 1.0358E-12, 7.3064E-13, 5.4500E-13, 4.0551E-13,        514290
     X 2.8642E-13, 2.1831E-13, 1.6860E-13, 1.2086E-13, 1.0150E-13/        514300
      DATA F1151/                                                         514310
     X 9.3550E-14, 8.4105E-14, 7.3051E-14, 6.9796E-14, 7.9949E-14,        514320
     X 1.0742E-13, 1.5639E-13, 2.1308E-13, 3.1226E-13, 4.6853E-13,        514330
     X 6.6917E-13, 1.0088E-12, 1.4824E-12, 2.2763E-12, 3.3917E-12,        514340
     X 4.4585E-12, 6.3187E-12, 8.4189E-12, 1.1302E-11, 1.3431E-11,        514350
     X 1.5679E-11, 1.9044E-11, 2.2463E-11, 2.3605E-11, 2.3619E-11,        514360
     X 2.3505E-11, 2.3805E-11, 2.2549E-11, 1.9304E-11, 1.8382E-11,        514370
     X 1.7795E-11, 1.8439E-11, 1.9146E-11, 2.1966E-11, 2.6109E-11,        514380
     X 3.1883E-11, 3.7872E-11, 4.3966E-11, 4.8789E-11, 5.3264E-11,        514390
     X 5.9705E-11, 6.3744E-11, 7.0163E-11, 7.9114E-11, 8.8287E-11,        514400
     X 9.9726E-11, 1.1498E-10, 1.3700E-10, 1.6145E-10, 1.9913E-10/        514410
      DATA F1201/                                                         514420
     X 2.2778E-10, 2.6216E-10, 2.9770E-10, 3.3405E-10, 3.7821E-10,        514430
     X 3.9552E-10, 4.1322E-10, 4.0293E-10, 4.0259E-10, 3.8853E-10,        514440
     X 3.7842E-10, 3.8551E-10, 4.4618E-10, 5.0527E-10, 5.0695E-10,        514450
     X 5.1216E-10, 5.1930E-10, 5.5794E-10, 5.3320E-10, 5.2008E-10,        514460
     X 5.6888E-10, 6.1883E-10, 6.9006E-10, 6.9505E-10, 6.6768E-10,        514470
     X 6.3290E-10, 5.6753E-10, 5.0327E-10, 3.9830E-10, 3.1147E-10,        514480
     X 2.4416E-10, 1.8860E-10, 1.3908E-10, 9.9156E-11, 7.3779E-11,        514490
     X 5.6048E-11, 4.2457E-11, 3.4505E-11, 2.9881E-11, 2.7865E-11,        514500
     X 2.8471E-11, 3.1065E-11, 3.4204E-11, 3.9140E-11, 4.3606E-11,        514510
     X 4.9075E-11, 5.3069E-11, 5.5236E-11, 5.5309E-11, 5.3832E-11/        514520
      DATA F1251/                                                         514530
     X 5.3183E-11, 5.1783E-11, 5.2042E-11, 5.4422E-11, 5.5656E-11,        514540
     X 5.4409E-11, 5.2659E-11, 5.1696E-11, 5.1726E-11, 4.9003E-11,        514550
     X 4.9050E-11, 5.1700E-11, 5.6818E-11, 6.3129E-11, 6.6542E-11,        514560
     X 6.4367E-11, 5.9908E-11, 5.4470E-11, 4.7903E-11, 3.9669E-11,        514570
     X 2.9651E-11, 2.2286E-11, 1.6742E-11, 1.1827E-11, 7.7739E-12,        514580
     X 4.8805E-12, 3.1747E-12, 2.0057E-12, 1.2550E-12, 8.7434E-13,        514590
     X 6.2755E-13, 4.9752E-13, 4.0047E-13, 3.5602E-13, 3.0930E-13,        514600
     X 2.4903E-13, 1.9316E-13, 1.4995E-13, 1.2059E-13, 8.7242E-14,        514610
     X 6.4511E-14, 5.3300E-14, 4.3741E-14, 3.4916E-14, 2.6560E-14,        514620
     X 1.6923E-14, 1.1816E-14, 6.7071E-15, 3.6474E-15, 2.0686E-15/        514630
      DATA F1301/                                                         514640
     X 1.1925E-15, 6.8948E-16, 3.9661E-16, 2.2576E-16, 1.2669E-16,        514650
     X 6.9908E-17, 3.7896E-17, 2.0280E-17, 1.1016E-17, 6.7816E-18,        514660
     X 6.0958E-18, 8.9913E-18, 1.7201E-17, 3.4964E-17, 7.0722E-17,        514670
     X 1.4020E-16, 2.7167E-16, 5.1478E-16, 9.5500E-16, 1.7376E-15,        514680
     X 3.1074E-15, 5.4789E-15, 9.5640E-15, 1.6635E-14, 2.9145E-14,        514690
     X 5.2179E-14, 8.8554E-14, 1.4764E-13, 2.3331E-13, 3.5996E-13,        514700
     X 5.2132E-13, 6.3519E-13, 7.3174E-13, 8.3752E-13, 9.8916E-13,        514710
     X 1.1515E-12, 1.4034E-12, 1.6594E-12, 2.1021E-12, 2.7416E-12,        514720
     X 3.4135E-12, 4.5517E-12, 5.5832E-12, 7.2303E-12, 9.9484E-12,        514730
     X 1.2724E-11, 1.6478E-11, 2.0588E-11, 2.5543E-11, 3.3625E-11/        514740
      DATA F1351/                                                         514750
     X 4.1788E-11, 5.0081E-11, 6.0144E-11, 6.9599E-11, 8.4408E-11,        514760
     X 9.7143E-11, 1.0805E-10, 1.1713E-10, 1.2711E-10, 1.3727E-10,        514770
     X 1.4539E-10, 1.6049E-10, 1.7680E-10, 2.0557E-10, 2.4967E-10,        514780
     X 3.0096E-10, 3.5816E-10, 4.0851E-10, 4.6111E-10, 5.2197E-10,        514790
     X 5.5043E-10, 6.0324E-10, 6.4983E-10, 6.7498E-10, 7.0545E-10,        514800
     X 7.0680E-10, 7.5218E-10, 7.5723E-10, 7.7840E-10, 8.0081E-10,        514810
     X 8.0223E-10, 7.7271E-10, 7.1676E-10, 6.7819E-10, 6.4753E-10,        514820
     X 6.5844E-10, 7.0163E-10, 7.7503E-10, 8.8152E-10, 9.9022E-10,        514830
     X 1.0229E-09, 9.9296E-10, 8.9911E-10, 7.7813E-10, 6.3785E-10,        514840
     X 4.7491E-10, 3.5280E-10, 2.4349E-10, 1.6502E-10, 1.1622E-10/        514850
      DATA F1401/                                                         514860
     X 8.6715E-11, 6.7360E-11, 5.3910E-11, 4.5554E-11, 4.1300E-11,        514870
     X 3.9728E-11, 3.9000E-11, 3.9803E-11, 4.1514E-11, 4.3374E-11,        514880
     X 4.6831E-11, 4.8921E-11, 5.1995E-11, 5.7242E-11, 6.2759E-11,        514890
     X 7.0801E-11, 7.4555E-11, 7.9754E-11, 8.7616E-11, 9.1171E-11,        514900
     X 1.0349E-10, 1.1047E-10, 1.2024E-10, 1.2990E-10, 1.3725E-10,        514910
     X 1.5005E-10, 1.5268E-10, 1.5535E-10, 1.5623E-10, 1.5009E-10,        514920
     X 1.4034E-10, 1.3002E-10, 1.2225E-10, 1.1989E-10, 1.2411E-10,        514930
     X 1.3612E-10, 1.5225E-10, 1.7202E-10, 1.9471E-10, 1.9931E-10,        514940
     X 1.9079E-10, 1.7478E-10, 1.5259E-10, 1.2625E-10, 9.3332E-11,        514950
     X 6.8796E-11, 4.6466E-11, 2.9723E-11, 1.8508E-11, 1.2106E-11/        514960
      DATA F1451/                                                         514970
     X 8.0142E-12, 5.4066E-12, 3.9329E-12, 3.1665E-12, 2.7420E-12,        514980
     X 2.3996E-12, 2.3804E-12, 2.3242E-12, 2.4476E-12, 2.5331E-12,        514990
     X 2.3595E-12, 2.2575E-12, 2.1298E-12, 2.0088E-12, 1.8263E-12,        515000
     X 1.6114E-12, 1.4422E-12, 1.2946E-12, 1.0837E-12, 9.1282E-13,        515010
     X 7.2359E-13, 5.3307E-13, 3.8837E-13, 2.6678E-13, 1.6769E-13,        515020
     X 1.0826E-13, 7.2364E-14, 4.5201E-14, 3.0808E-14, 2.2377E-14,        515030
     X 1.7040E-14, 9.2181E-15, 5.2934E-15, 3.5774E-15, 3.1431E-15,        515040
     X 3.7647E-15, 5.6428E-15, 9.5139E-15, 1.7322E-14, 2.8829E-14,        515050
     X 4.7708E-14, 6.9789E-14, 9.7267E-14, 1.4662E-13, 1.9429E-13,        515060
     X 2.5998E-13, 3.6636E-13, 4.7960E-13, 6.5129E-13, 7.7638E-13/        515070
      DATA F1501/                                                         515080
     X 9.3774E-13, 1.1467E-12, 1.3547E-12, 1.5686E-12, 1.6893E-12,        515090
     X 1.9069E-12, 2.1352E-12, 2.3071E-12, 2.4759E-12, 2.8247E-12,        515100
     X 3.4365E-12, 4.3181E-12, 5.6107E-12, 7.0017E-12, 8.6408E-12,        515110
     X 1.0974E-11, 1.3742E-11, 1.6337E-11, 2.0157E-11, 2.3441E-11,        515120
     X 2.6733E-11, 3.0247E-11, 3.3737E-11, 3.8618E-11, 4.1343E-11,        515130
     X 4.3870E-11, 4.4685E-11, 4.4881E-11, 4.5526E-11, 4.3628E-11,        515140
     X 4.4268E-11, 4.6865E-11, 5.3426E-11, 5.4020E-11, 5.3218E-11,        515150
     X 5.4587E-11, 5.6360E-11, 5.7740E-11, 5.6426E-11, 6.0399E-11,        515160
     X 6.6981E-11, 7.4319E-11, 7.7977E-11, 7.5539E-11, 7.1610E-11,        515170
     X 6.4606E-11, 5.5498E-11, 4.3944E-11, 3.3769E-11, 2.5771E-11/        515180
      DATA F1551/                                                         515190
     X 1.9162E-11, 1.3698E-11, 1.0173E-11, 7.8925E-12, 6.1938E-12,        515200
     X 4.7962E-12, 4.0811E-12, 3.3912E-12, 2.8625E-12, 2.4504E-12,        515210
     X 2.2188E-12, 2.2139E-12, 2.2499E-12, 2.2766E-12, 2.3985E-12,        515220
     X 2.5459E-12, 2.9295E-12, 3.4196E-12, 3.6155E-12, 4.0733E-12,        515230
     X 4.4610E-12, 4.9372E-12, 5.4372E-12, 5.7304E-12, 6.1640E-12,        515240
     X 6.1278E-12, 6.2940E-12, 6.4947E-12, 6.8174E-12, 7.5190E-12,        515250
     X 8.2608E-12, 8.4971E-12, 8.3484E-12, 8.1888E-12, 7.8552E-12,        515260
     X 7.8468E-12, 7.5943E-12, 7.9096E-12, 8.6869E-12, 9.1303E-12,        515270
     X 9.2547E-12, 8.9322E-12, 8.2177E-12, 7.3408E-12, 5.7956E-12,        515280
     X 4.4470E-12, 3.5881E-12, 2.6748E-12, 1.7074E-12, 9.6700E-13/        515290
      DATA F1601/                                                         515300
     X 5.2645E-13, 2.9943E-13, 1.7316E-13, 1.0039E-13, 5.7859E-14,        515310
     X 3.2968E-14, 1.8499E-14, 1.0192E-14, 5.5015E-15, 2.9040E-15,        515320
     X 1.4968E-15, 7.5244E-16, 3.6852E-16, 1.7568E-16, 8.1464E-17,        515330
     X 3.6717E-17, 1.6076E-17, 6.8341E-18, 2.8195E-18, 1.1286E-18,        515340
     X  .0000E+00,  .0000E+00,  .0000E+00,  .0000E+00,  .0000E+00,        515350
     X  .0000E+00,  .0000E+00,  .0000E+00,  .0000E+00, 1.4070E-18,        515360
     X 3.0405E-18, 6.4059E-18, 1.3169E-17, 2.6443E-17, 5.1917E-17,        515370
     X 9.9785E-17, 1.8802E-16, 3.4788E-16, 6.3328E-16, 1.1370E-15,        515380
     X 2.0198E-15, 3.5665E-15, 6.3053E-15, 1.1309E-14, 2.1206E-14,        515390
     X 3.2858E-14, 5.5165E-14, 8.6231E-14, 1.2776E-13, 1.7780E-13/        515400
      DATA F1651/                                                         515410
     X 2.5266E-13, 3.6254E-13, 5.1398E-13, 6.8289E-13, 8.7481E-13,        515420
     X 1.1914E-12, 1.6086E-12, 2.0469E-12, 2.5761E-12, 3.4964E-12,        515430
     X 4.4980E-12, 5.5356E-12, 6.7963E-12, 8.5720E-12, 1.0700E-11,        515440
     X 1.2983E-11, 1.6270E-11, 1.9609E-11, 2.2668E-11, 2.5963E-11,        515450
     X 3.0918E-11, 3.4930E-11, 3.9330E-11, 4.4208E-11, 4.6431E-11,        515460
     X 5.1141E-11, 5.4108E-11, 5.8077E-11, 6.5050E-11, 7.2126E-11,        515470
     X 8.1064E-11, 8.1973E-11, 8.1694E-11, 8.3081E-11, 8.0240E-11,        515480
     X 7.9225E-11, 7.6256E-11, 7.8468E-11, 8.0041E-11, 8.1585E-11,        515490
     X 8.3485E-11, 8.3774E-11, 8.5870E-11, 8.6104E-11, 8.8516E-11,        515500
     X 9.0814E-11, 9.2522E-11, 8.8913E-11, 7.8381E-11, 6.8568E-11/        515510
      DATA F1701/                                                         515520
     X 5.6797E-11, 4.4163E-11, 3.2369E-11, 2.3259E-11, 1.6835E-11,        515530
     X 1.1733E-11, 8.5273E-12, 6.3805E-12, 4.8983E-12, 3.8831E-12,        515540
     X 3.2610E-12, 2.8577E-12, 2.5210E-12, 2.2913E-12, 2.0341E-12,        515550
     X 1.8167E-12, 1.6395E-12, 1.4890E-12, 1.3516E-12, 1.2542E-12,        515560
     X 1.2910E-12, 1.3471E-12, 1.4689E-12, 1.5889E-12, 1.6989E-12,        515570
     X 1.8843E-12, 2.0902E-12, 2.3874E-12, 2.7294E-12, 3.3353E-12,        515580
     X 4.0186E-12, 4.5868E-12, 5.2212E-12, 5.8856E-12, 6.5991E-12,        515590
     X 7.2505E-12, 7.6637E-12, 8.5113E-12, 9.4832E-12, 9.9678E-12,        515600
     X 1.0723E-11, 1.0749E-11, 1.1380E-11, 1.1774E-11, 1.1743E-11,        515610
     X 1.2493E-11, 1.2559E-11, 1.2332E-11, 1.1782E-11, 1.1086E-11/        515620
      DATA F1751/                                                         515630
     X 1.0945E-11, 1.1178E-11, 1.2083E-11, 1.3037E-11, 1.4730E-11,        515640
     X 1.6450E-11, 1.7403E-11, 1.7004E-11, 1.5117E-11, 1.3339E-11,        515650
     X 1.0844E-11, 8.0915E-12, 5.6615E-12, 3.7196E-12, 2.5194E-12,        515660
     X 1.6569E-12, 1.1201E-12, 8.2335E-13, 6.0270E-13, 4.8205E-13,        515670
     X 4.1313E-13, 3.6243E-13, 3.2575E-13, 2.7730E-13, 2.5292E-13,        515680
     X 2.3062E-13, 2.1126E-13, 2.1556E-13, 2.1213E-13, 2.2103E-13,        515690
     X 2.1927E-13, 2.0794E-13, 1.9533E-13, 1.6592E-13, 1.4521E-13,        515700
     X 1.1393E-13, 8.3772E-14, 6.2077E-14, 4.3337E-14, 2.7165E-14,        515710
     X 1.6821E-14, 9.5407E-15, 5.3093E-15, 3.0320E-15, 1.7429E-15,        515720
     X 9.9828E-16, 5.6622E-16, 3.1672E-16, 1.7419E-16, 9.3985E-17/        515730
      DATA F1801/                                                         515740
     X 4.9656E-17, 2.5652E-17, 1.2942E-17, 6.3695E-18, 3.0554E-18,        515750
     C 1.4273E-18, -0.       , -0.       , -0.       , -0.       ,        515760
     C -0.       , 0.        , 0.        , 0.        , 0.        ,        515770
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515780
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515790
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515800
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515810
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515820
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515830
     C 0.        , 0.        , 0.        , 0.        , 0.        /        515840
      DATA F1851/                                                         515850
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515860
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515870
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515880
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515890
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515900
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515910
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515920
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515930
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515940
     C 0.        , 0.        , 0.        , 0.        , 0.        /        515950
      DATA F1901/                                                         515960
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515970
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515980
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        515990
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516000
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516010
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516020
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516030
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516040
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516050
     C 0.        , 0.        , 0.        , 0.        , 0.        /        516060
      DATA F1951/                                                         516070
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516080
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516090
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516100
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516110
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516120
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516130
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516140
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516150
     C 0.        , 0.        , 0.        , 0.        , 0.        ,        516160
     C 0.        , 0.        , 0.        , 0.        , 0.        /        516170
      DATA F2001/                                                         516180
     C 0.        /                                                        516190
C                                                                         516200
      END                                                                 516210
