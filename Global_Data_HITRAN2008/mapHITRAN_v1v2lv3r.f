c compile with 
c do not use -W because of the stupid comments after C72
c f77 -o mapHITRAN_v1v2lv3r.x -N109 -O3 mapHITRAN_v1v2lv3r.f

      INTEGER I

      I = -1
      Call VIBES(I)

      END

c****************************************************
c subroutine copied and modified from /asl/data/hitran/HITRAN2k/BD_Vibs.for
c just to dump out the CO2 vib levels maps

      SUBROUTINE VIBES(I)

       CHARACTER*8 AVIB(606),ca8
       INTEGER I,iVib
c
c...Vibrational levels of each class of molecule on database:
c class 1    CO, HF, HCl, HBr, HI, N2, O, NO+
      DATA (AVIB(I),I=1,24)
c            .......1   .......2   .......3   .......4
     +     /'       0','       1','       2','       3'
c
c       .......5   .......6   .......7   .......8   .......9   ......10
     +,'       4','       5','       6','       7','       8','       9'
c
c       ......11   ......12   ......13   ......14   ......15   ......16
     +,'      10','      11','      12','      13','      14','      15'
c
c       ......17   ......18   ......19   ......20   ......21
     +,'      16','      17','      18','      19','      20',
c
c      ......22    ......23   ......24
     +'      21','       22','      23'/
c
c
c class 2     O2
      DATA (AVIB(I),I=25,66)
c            .......1   .......2   .......3   .......4
     +     /'      X0','      X1','      a0','      a1',
c
c       .......5   .......6   .......7   .......8   .......9  .......10
     +'      b0','      b1','      b2','        ','      X2','      B0',
c
c       ......11   ......12   ......13   ......14   ......15   ......16
     +'      B1','      B2','      B3','      B4','      B5','      B6',
c
c       ......17   ......18   ......19   ......20   ......21   ......22
     +'      B7','      B8','      B9','     B10','     B11','     B12',
c
c       ......23   ......24   ......25   ......26   ......27   ......28
     +'     B13','     B14','     B15','     B16','     B17','     B18',
c
c       ......29
     +'     B19',13*'RESERVED'/

c class 3    NO, OH, ClO
      DATA (AVIB(I),I=67,102)
c            .......1   .......2   .......3   .......4
     +     /'X3k2   0','X3k2   1','X3k2   2','X3k2   3'
c
c       .......5   .......6   .......7   .......8   .......9  .......10
     +,'X3k2   4','X3k2   5','X3k2   6','X3k2   7','X3k2   8','X3k2   9'
c
c       ......11   ......12   ......13   ......14   ......15   ......16
     +,'X1k2   0','X1k2   1','X1k2   2','X1k2   3','X1k2   4','X1k2   5'
c
c       ......17   ......18   ......19   ......20   ......21   ......22   10/20/00
     +,'X1k2   6','X1k2   7','X1k2   8','X1k2   9','X1k2  10','X1k2  11'
c
c       ......23   ......24   ......25   ......26                         10/20/00
     +,'X1k2  12','X3k2  10','X3k2  11','X3k2  12'
c
c       ......27   ......28   ......29   ......30                         12/12/00 
     +,'A1     0','A1     1','A1     2','A1     3'
c
c       ......31   ......32   ......33   ......34                         12/12/00 
     +,'A2     0','A2     1','A2     2','A2     3',2*'RESERVED'/ 
c
c class 4    N2O, OCS, HCN
      DATA (AVIB(I),I=103,170)
c            .......1   .......2   .......3   .......4
     +     /'    0000','    0110','    0200','    0220'
c
c       .......5   .......6   .......7   .......8   .......9  .......10
     +,'    1000','    0310','    0330','    1110','    0400','    0420'
c
c       ......11   ......12   ......13   ......14   ......15   ......16
     +,'    1200','    1220','    2000','    0001','    0510','    1310'
c
c       ......17   ......18   ......19   ......20   ......21   ......22
     +,'    1330','    2110','    0111','    1400','    1420','    2200'
c
c       ......23   ......24   ......25   ......26   ......27   ......28
     +,'    2220','    3000','    0201','    0221','    1001','    2310'
c
c       ......29   ......30   ......31   ......32   ......33   ......34
     +,'    3110','    0311','    0331','    1111','    4000','    3200'
c
c       ......35   ......36   ......37   ......38   ......39   ......40
     +,'    2001','    1201','    1221','    0002','    2111','    0112'
c
c       ......41   ......42   ......43
     +,'        ','    0600','    0620',25*'RESERVED'/
c
c class 5    CO2
c                                       .......1   .......2   .......3   
      DATA (AVIB(I),I=171,229)/        '   00001','   01101','   10002',
c
c      .......4   .......5   .......6   .......7   .......8   .......9
     +'   02201','   10001','   11102','   03301','   11101','   00011',
c
c      ......10   ......11   ......12   ......13   ......14   ......15
     +'   20003','   12202','   20002','   04401','   12201','   20001',
c
c      ......16   ......17   ......18   ......19   ......20   ......21
     +'   01111','   21103','   13302','   21102','   05501','   13301',
c
c      ......22   ......23   ......24   ......25   ......26   ......27
     +'   21101','   10012','   02211','   10011','   30004','   22203',
c
c      ......28   ......29   ......30   ......31   ......32   ......33
     +'   14402','   30003','   22202','   06601','   30002','   14401',
c
c      ......34   ......35   ......36   ......37   ......38   ......39
     +'   22201','   30001','   11112','   03311','   11111','   00021',
c
c      ......40   ......41   ......42   ......43   ......44   ......45
     +'   31104','   31103','   31102','   20013','   12212','   23301',
c
c      ......46   ......47   ......48   ......49   ......50   ......51
     +'   31101','   04411','   20012','   12211','   20011','   01121',
c
c      ......52   ......53   ......54   ......55   ......56   ......57
     +'   40004','   32203','   21113','   40002','   13312','   05511',
c
c      ......58   ......59
     +'   21112','   13311'/
c                                       ......60   ......61   ......62
      DATA (AVIB(I),I=230,344)/        '   21111','   10022','   02221',
c
c      ......63   ......64   ......65   ......66   ......67   ......68
     +'   10021','   30014','   22213','   14412','   41102','   30013',
c
c      ......69   ......70   ......71   ......72   ......73   ......74
     +'   06611','   22212','   30012','   41101','   14411','   22211',
c
c      ......75   ......76   ......77   ......78   ......79   ......80
     +'   30011','   11122','   03321','   11121','   00031','   31114',
c
c      ......81   ......82   ......83   ......84   ......85   ......86
     +'   23313','   31113','   23312','   31112','   15511','   20023',
c
c      ......87   ......88   ......89   ......90   ......91   ......92
     +'   23311','   12222','   31111','   20022','   12221','   20021',
c
c      ......93   ......94   ......95   ......96   ......97   ......98
     +'   01131','   40015','   32214','   40014','   32213','   40013',
c
c      ......99   .....100   .....101   .....102   .....103   .....104
     +'   51102','   32212','   40012','   21123','   32211','   21122',
c
c      .....105   .....106   .....107   .....108   .....109   .....110
     +'   40011','   21121','   10032','   02231','   10031','   41114',
c
c      .....111   .....112   .....113   .....114   .....115   .....116
     +'   41113','   41112','   11132','   03331','   11131','   20033',
c
c      .....117   .....118   .....119   .....120   .....121   .....122
     +'   12232','   20032','   12231','   20031','   21133','   21132',
c
c      .....123   .....124   .....125   .....126   .....127   .....128
     +'   21131','   23303','   15502','   23302','   07701','        ',
c
     + 46*'RESERVED'/
c
c class 6    H2O, O3, SO2, NO2, HOCl, H2S, HO2, HOBr
c                                       .......1   .......2   .......3 
      DATA (AVIB(I),I=345,440)/        '     000','     010','     020',
c
c      .......4   .......5   .......6   .......7   .......8   .......9
     +'     100','     001','     030','     110','     011','     040',
c
c      ......10   ......11   ......12   ......13   ......14   ......15
     +'     120','     021','     200','     101','     002','     130',
c
c      ......16   ......17   ......18   ......19   ......20   ......21
     +'     031','     210','     111','     012','     041','     220',
c
c      ......22   ......23   ......24   ......25   ......26   ......27
     +'     121','     022','     300','     201','     102','     003',
c
c      ......28   ......29   ......30   ......31   ......32   ......33
     +'     131','     310','     211','     112','     013','     141',
c
c      ......34   ......35   ......36   ......37   ......38   ......39
     +'     042','     320','     221','     301','     202','     122',
c
c      ......40   ......41   ......42   ......43   ......44   ......45
     +'     023','     400','     103','     004','     151','     330',
c
c      ......46   ......47   ......48   ......49   ......50   ......51
     +'     231','     212','     311','     410','     113','     321',
c
c      ......52   ......53   ......54   ......55   ......56   ......57
     +'     222','     302','     401','     420','     123','     500',
c
c      ......58   ......59   ......60   ......61   ......62   ......63
     +'     203','     104','        ','     331','     213','     312',
c
c      ......64   ......65   ......66   ......67   ......68   ......69
     +'     411','     303','     402','     403','     421','     501',
c
c      ......70   ......71   ......72   ......73   ......74   ......75
     +'     313','     412','     232','     050','     060','     070',
c
c      ......76   ......77   ......78   ......79   ......80   ......81
     +'     032','     051','     061','     080','     140','     150', 4/24/97
c
     +        15*'RESERVED'/
c
c class 7    C2H2
c                               .......1   .......2   .......3
      DATA (AVIB(I),I=441,468)/'000000+ ','000011  ','001000+ ',          5/7/01
c
c         .......4   .......5   .......6   .......7   .......8
     +   '010110+ ','000101  ','        ','000110- ','000112  ',          5/7/01
c
c         .......9   ......10   ......11   ......12   ......13            5/7/01
     +   '000020+ ','000022  ','000031  ','000211 2','000211 1',          5/7/01
c
c         ......14   ......15   ......16   ......17   ......18            5/7/01
     +   '000310+ ','000310- ','000312 2','000312 1','010011  ',          5/7/01
c
c         ......19   ......20   ......21   ......22   ......23            5/7/01
     +   '000130+ ','000130- ','000132 2','000132 1','010101  ',          5/7/01
c
c         ......24   ......25   ......26   ......27   ......28            5/7/01
     +   '000220+2','000220- ','000222 2','000040+ ','000042  '/          5/7/01
c
c class 8    NH3, PH3
c                                       .......1   .......2   .......3
      DATA (AVIB(I),I=469,529)/        '   0000 ','   0100 ','   0200 ',  5/7/01
c
c      .......4   .......5   .......6   .......7   .......8   .......9
     +'   0001 ','   0000a','   0100a','   0200a','   0001a','   0000s',
c
c      ......10   ......11   ......12   ......13   ......14   ......15
     +'   0100s','   0200s','   0001s','        ','   0300s','   0101s',
c
c      ......16   ......17   ......18   ......19   ......20   ......21
     +'   0101a','   0300a','   0201s','  0002As','  0002Aa','  0002Es',
c
c      ......22   ......23   ......24   ......25   ......26   ......27
     +'  0002Ea','   1000s','   1000a','   0010s','   0010a','   0400s',
c
c      ......28   ......29   ......30   ......31   ......32   ......33
     +'   0201a','   0301s','   0400a','  0102As','  0102Es','  0102Aa',
c
c      ......34   ......35   ......36   ......37   ......38   ......39
     +'  0102Ea','   1100s','   1100a','   0110s','   0110a','   0301a',
c
c      ......40   ......41   ......42   ......43
     +'   1001s','   1001a','   0011s','   0011a',18*'RESERVED'/          5/7/01
c
c class 9    H2CO, H2O2, COF2
c                               .......1   .......2   .......3
      DATA (AVIB(I),I=530,554)/'  000000','  000002','  001100',
c
c         .......4   .......5   .......6   .......7   .......8
     +   '  001001','  100000','  000010','  010100','  010001',
c
c         .......9   ......10   ......11   ......12   ......13
     +   '  000001','  010000','  000100','  020000','        ',
c
c         ......14   ......15
     +   '  002001','  000020', 10*'RESERVED'/
c
c class 10    CH4, CH3D, CH3Cl, C2H6, HNO3, SF6, HCOOH, ClONO2, C2H4       3/24/97
c                               .......1   .......2   .......3
      DATA (AVIB(I),I=555,606)/'00000000','00000111','01100001',
c
c      .......4   .......5   .......6   .......7   .......8   .......9
     +'00000202','00000222','01100112','10000000','00011001','02200002',
c
c      ......10   ......11   ......12   ......13   ......14   ......15
     +'10000111','00011112','01111002','00022002','  GROUND','      V1',
c
c      ......16   ......17   ......18   ......19   ......20   ......21
     +'      V2','      V4','      V5','      V9','     2V5','     2V9',
c
c      ......22   ......23   ......24   ......25   ......26   ......27
     +'     3V6','     3V9','   V5+V9','        ','      V6','      V3',
c
c      ......28   ......29   ......30   ......31   ......32   ......33
     +'     2V6','00000333','00011223','      V7','      V8','   V8+V9',
c
c      ......34   ......35   ......36   ......37   ......38   ......39   3/24/97
     +'   V3+V6','     2V3','   V5+V6','   V3+V5','   V4+V9','     V10', 
c                                                                 
c      ......40   ......41   ......42   ......43                         3/24/97
     +'     V11','  V2+V12','2V10+V12','  V9+V10',                       
c
c      ......44   ......45   ......46   ......47   ......48             12/15/00 
     +'01100222','02200111','11100001','03300001','00000444',           
c
     + 4*'RESERVED'/                                                    12/15/00

c only need 1 -127; rest are blank or 'RESERVED'    
      do i = 171,171+127-1
c only need 1 -1731; rest are blank or 'RESERVED'    
c      do i = 171,171+173-1
        write(ca8,100) avib(I)
        read(ca8,*) iVib
c        print *,i-171+1,avib(I),iVib
        print *,i-171+1,iVib
        end do

 100  FORMAT(A8)
      RETURN      
      END
