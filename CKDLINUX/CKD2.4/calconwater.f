c Copyright 1997 
c University of Maryland Baltimore County 
c All Rights Reserved

c these water subroutines calculate the continuum for WATER(ID=1)
c and are based entirely in the KCARTA routines, except NO jacobians

c similarly the O2 and N2 subroutines are based ENTIRELY on GENLN2 stuff

c note we are using        REAL CON(*),WHICHLAYER instead of
c                          REAL CON(KMAXLAYER,KMAXPTS)

c also real ------> real*8

c because of memeory problems 
c and so we do        DO 10 ILAY=whichlayer,whichlayer
c instead of          DO 10 ILAY=1,NLAY

c************************************************************************
c                   WATER CONTINUUM CKD 0,21,23
c************************************************************************
       SUBROUTINE CALCON23( CON, IDGAS, NFREQ, FREQ, FSTEP, NLAY, T, P, 
     $    PARTP, AMT, selfmult, formult, whichlayer)

      IMPLICIT NONE

      include '../FORTRANFILES/max.inc'

C COMMON BLOCKS CONTAINING CONTINUUM VALUES 

       REAL*8 VB1,VT1,DV1,NPT1,H2OS96(2001)
       REAL*8 H2OS60(2001), H2OF96(2001),VB2,VT2,DV2,NPT2,CO2F96(2001)
       REAL*8 CO2F60(2001),CO2F30(2001)
       REAL*8 VB7,VT7,DV7,NPT7,O2C213(59),O2C253(59),O2C293(59)
       REAL*8 VB22,VT22,DV22,NPT22,CN2297(111),CN2273(111)
       REAL*8 CN2253(111),CN2233(111),CN2213(111),CN2193(111)
       REAL*8 selfmult, formult

       COMMON /CH2OS0/ VB1,VT1,DV1,NPT1,H2OS96
       COMMON /CH2OS1/ H2OS60
       COMMON /CH2OF0/ H2OF96
       COMMON /CCO2F0/ VB2,VT2,DV2,NPT2,CO2F96
       COMMON /CCO2F1/ CO2F60
       COMMON /CCO2F2/ CO2F30
       COMMON /CO2CT/  VB7,VT7,DV7,NPT7,O2C213,O2C253,O2C293

       COMMON /CN2C0/ VB22,VT22,DV22,NPT22,CN2297,CN2273,
     + CN2253,CN2233,CN2213,CN2193

C Arguements
       INTEGER IDGAS, NFREQ, NLAY,whichlayer
c       REAL*8 FREQ(kMaxPts), FSTEP, T(kMaxLayer), P(kMaxLayer),
c     $    PARTP(kMaxLayer),AMT(kMaxLayer)
c       REAL*8 CON(kMaxPts,kMaxLayer)
       REAL*8 FREQ(*), FSTEP, T(*), P(*),PARTP(*),AMT(*), CON(*)

C Local variables
       REAL*8 XAMT(kMaxLayer), C11(kMaxLayer), TFAC(kMaxLayer), 
     $    A1, A2, A3

C Variables for new water continuum adjustment terms
       INTEGER JFAC
       REAL*8 ALPHS2, BETAS, V0S, FACTRS, HWSQF, BETAF, V0F, FACTRF,
     $    V0F2, HWSQF2, BETA2, SFAC, alpha2,  FSCAL
       REAL*8 XFAC(0:50)

c used in calculating d/dq, d/dT
      REAL*8 rSum,rF

c general terms used in self, foreign
      REAL*8 vb,vt,dv,vs2,vf2,vf6,vf4,csfft
      REAL*8 csff60(MaxLen),csff96(MaxLen),cfff96(MaxLen)
      REAL*8 scor(MaxLen)
      REAL*8 f1,gr,v0f3,hwsqf3,beta3
      INTEGER iL,mk,npt,iF,iFrLow,iFrHigh
      REAL sfacl,sfach,fl

       REAL*8 C2, AVOG, TS
       DATA C2/1.4387863/
       DATA AVOG/6.022045E+26/
       DATA TS/296.0/

c these are the self braodening terms
       DATA (XFAC(iL),iL=0,50)/
     $    1.00000,1.01792,1.03767,1.05749,1.07730,1.09708,
     $    1.10489,1.11268,1.12047,1.12822,1.13597,1.14367,
     $    1.15135,1.15904,1.16669,1.17431,1.18786,1.20134,
     $    1.21479,1.22821,1.24158,1.26580,1.28991,1.28295,
     $    1.27600,1.26896,1.25550,1.24213,1.22879,1.21560,
     $    1.20230,1.18162,1.16112,1.14063,1.12016,1.10195,
     $    1.09207,1.08622,1.08105,1.07765,1.07398,1.06620,
     $    1.05791,1.04905,1.03976,1.02981,1.00985,1.00000,
     $    1.00000,1.00000,1.00000/

      rSum=0.0

C H2O (water) continuum
      VB = VB1
      VT = VT1
      DV = DV1
      NPT= NPT1

c this is to compute self continuum optical depth
      ALPHA2 = 200.0**2
      ALPHS2 = 120.0**2
      BETAS = 5.0E-06
      V0S = 1310.0
      FACTRS = 0.15

c this is to compute foreign continuum optical depth
      HWSQF = 330.0**2
      BETAF = 8.0E-11
      V0F = 1130.0
      FACTRF = 0.97
     
      V0F2 = 1900.0
      HWSQF2 = 150.0**2
      BETA2 = 3.0E-06

c these are the new terms for foreign continuum optical depth
      V0F3=1596.0
      HWSQF3 = 150.0**2
      BETA3 = 3.0E-06

c      print *,idgas,nfreq,fstep,nlay,whichlayer
      rF=FREQ(1)
      IF (RF .LE. VB .OR. RF .GE. VT) THEN
        print *,'CKD2.3 assumes freqs lie between',VB,VT
        STOP
        END IF
      rF=FREQ(nfreq)
      IF (RF .LE. VB .OR. RF .GE. VT) THEN
        print *,'CKD2.3 assumes freqs lie between',VB,VT
        STOP
        END IF
      iFrLow=1
      iFrHigh=nfreq

      DO iL=whichlayer,whichlayer
        XAMT(iL)=AMT(iL)*AVOG
        C11(iL) = 0.5*C2/T(iL)
C Clough et al. use exponential extrapolation between
C temperatures. 2.77777E-2 = 1/(296.0 - 260.0)
        TFAC(iL) =  2.77777E-2*(296.0 - T(iL))
        END DO

C Loop over the frequencies
      DO iF=1,NFREQ
        rF=FREQ(iF)

        MK = 1 + INT( (RF - VB)/DV )
        F1 = VB + (MK - 1)*DV
        GR = (RF - F1)/DV

        CSFF60(iF) = H2OS60(MK) + GR*(H2OS60(MK+1) - H2OS60(MK))
        CSFF96(iF) = H2OS96(MK) + GR*(H2OS96(MK+1) - H2OS96(MK))
        CFFF96(iF) = H2OF96(MK) + GR*(H2OF96(MK+1) - H2OF96(MK))

C  GENLN2 self continuum optical depth modifier
        VS2=(RF - V0S)**2
        SFAC=1.0
        IF (RF .GT. 700.0 .AND. RF .LT. 1200.0) THEN
          JFAC=INT( (RF - 700.0)/10.0 + 0.0001)
          SFAC=XFAC(JFAC)
cccc this is new ... copied from CKDv2.1
          SFACL=XFAC(JFAC)
          SFACH=XFAC(JFAC+1)
          FL=700.0 + FLOAT(JFAC*10)
          SFAC=SFACL + (rF - FL)*(SFACH - SFACL)/10.0

          ENDIF

c this was the old SCOR term
c         SCOR = SFAC*( 1.0 - 0.2333*( ALPHA2/
c     $       ( (RF - 1050.0)**2 + ALPHA2) ) ) *
c     $       ( 1.0 - FACTRS*( ALPHS2/(VS2 +
c     $       (BETAS*VS2**2) + ALPHS2) ) )

c this is NEW (from analysis of Rosenkranz)
          SCOR(iF)=SFAC*
     $      (1.0+2.02*(1.0e4/((RF)**2 + 1.0e-4*RF**4+1.0E4))) * 
     $      (1.0-0.2333*(ALPHA2/((RF-1050.0)**2+ALPHA2)))*
     $      (1.0-FACTRS*(ALPHS2/(VS2+(BETAS*VS2**2)+ALPHS2)))

C GENLN2 foreign modifier
        VF2=(RF - V0F)**2
        VF6=VF2*VF2*VF2
        FSCAL=(1.0 - FACTRF*( HWSQF/( VF2 + (BETAF*VF6) +  HWSQF)))

        VF2=(RF - V0F2)**2
        VF4=VF2*VF2
        FSCAL=FSCAL*(1.0 - 0.6*( HWSQF2/(VF2 + BETA2*VF4 + HWSQF2)))

c new for CKDv2.3
        VF2=(RF - V0F3)**2
        VF4=VF2*VF2
        FSCAL=FSCAL*(1.0 - 0.2*( HWSQF3/(VF2 + BETA3*VF4 + HWSQF3)))

        CFFF96(iF)=CFFF96(iF)*FSCAL

c      ELSE
c        !no contribution to continuum
c        CSFF60(iF) = 0.0
c        CSFF96(iF) = 0.0
c        CFFF96(iF) = 1.0    !so that CSFF96/CFFF96 <> junk
c        SCOR(iF)   = 0.0
c        END IF     !IF (RF .GE. VB .AND. RF .LT. VT) THEN

        END DO       !DO iF=1,NFREQ

C now quickly  Loop over the layers and freqs

      DO iL=whichlayer,whichlayer
        DO iF=iFrlow,iFrHigh
          rF=FREQ(iF)          
          CSFFT=SCOR(iF)*CSFF96(iF)*(CSFF60(iF)/CSFF96(iF))**TFAC(iL)

          A1 = RF*XAMT(iL)*TANH( C11(iL)*RF )
          A2 = TS/T(iL)
          A3 = 1.0E-20*( PARTP(iL)*CSFFT*selfmult +
     $          ( P(iL) - PARTP(iL) )*CFFF96(iF)*formult )

          CON(iF)=(A1*A2*A3)
          END DO  !loop over freqs
        END DO      !loop over layers

      RETURN
      END

c************************************************************************
       SUBROUTINE CALCON21( CON, IDGAS, NFREQ, FREQ, FSTEP, NLAY, T, P, 
     $    PARTP, AMT, selfmult, formult, whichlayer)
C
c
C      Based on the GENLN2 routine "contum" by David Edwards
c      this is CKD v 2.1

      include '../FORTRANFILES/max.inc'

C
c modified to allow for computation of d/dq,d/dT if kJacobian=kSpline=1

C-----------------------------------------------------------------------
C
C
C  COMMON BLOCKS CONTAINING CONTINUUM VALUES 
C
       REAL*8 VB1,VT1,DV1,NPT1,H2OS96(2001)
       REAL*8 H2OS60(2001), H2OF96(2001),VB2,VT2,DV2,NPT2,CO2F96(2001)
       REAL*8 CO2F60(2001),CO2F30(2001)
       REAL*8 VB7,VT7,DV7,NPT7,O2C213(59),O2C253(59),O2C293(59)
       REAL*8 VB22,VT22,DV22,NPT22,CN2297(111),CN2273(111)
       REAL*8 CN2253(111),CN2233(111),CN2213(111),CN2193(111)
       REAL*8 selfmult, formult

       COMMON /CH2OS0/ VB1,VT1,DV1,NPT1,H2OS96
       COMMON /CH2OS1/ H2OS60
       COMMON /CH2OF0/ H2OF96
       COMMON /CCO2F0/ VB2,VT2,DV2,NPT2,CO2F96
       COMMON /CCO2F1/ CO2F60
       COMMON /CCO2F2/ CO2F30
       COMMON /CO2CT/  VB7,VT7,DV7,NPT7,O2C213,O2C253,O2C293
C
       COMMON /CN2C0/ VB22,VT22,DV22,NPT22,CN2297,CN2273,
     + CN2253,CN2233,CN2213,CN2193
C
C      Arguements
       INTEGER IDGAS, NFREQ, NLAY, whichlayer
c       REAL*8 FREQ(kMaxPts), FSTEP, T(kMaxLayer), P(kMaxLayer),
c     $    PARTP(kMaxLayer),AMT(kMaxLayer)
c       REAL*8 CON(kMaxPts,kMaxLayer)
       REAL*8 FREQ(*), FSTEP, T(*), P(*),PARTP(*),AMT(*),CON(*)

C      Local variables
       REAL*8 XAMT(kMaxLayer), C11(kMaxLayer), TFAC(kMaxLayer), 
     $    A1, A2, A3
C
C      Variables for new water continuum adjustment terms
       INTEGER JFAC,I
       REAL*8 ALPHS2, BETAS, V0S, FACTRS, HWSQF, BETAF, V0F, FACTRF,
     $    V0F2, HWSQF2, BETA2, SFAC, alpha2, scor, FSCAL
       REAL*8 XFAC(0:50)
c used in calculating d/dq, d/dT
       REAL*8 rSum
C
      REAL*8 vb,vt,dv,vs2,vf2,vf6,vf4,csfft
c      REAL*8 csff60(MaxLen),csff96(MaxLen),cfff96(MaxLen)
      REAL*8 csff60,csff96,cfff96
      REAL*8 f1,gr
      INTEGER mk,npt

      INTEGER ILAY,IPT
      REAL*8 SFACH,SFACL,FL

       REAL*8 C2, AVOG, TS
       DATA C2/1.4387863/
       DATA AVOG/6.022045E+26/
       DATA TS/296.0/
C
       DATA (XFAC(I),I=0,50)/
     $    1.00000,1.01792,1.03767,1.05749,1.07730,1.09708,
     $    1.10489,1.11268,1.12047,1.12822,1.13597,1.14367,
     $    1.15135,1.15904,1.16669,1.17431,1.18786,1.20134,
     $    1.21479,1.22821,1.24158,1.26580,1.28991,1.28295,
     $    1.27600,1.26896,1.25550,1.24213,1.22879,1.21560,
     $    1.20230,1.18162,1.16112,1.14063,1.12016,1.10195,
     $    1.09207,1.08622,1.08105,1.07765,1.07398,1.06620,
     $    1.05791,1.04905,1.03976,1.02981,1.00985,1.00000,
     $    1.00000,1.00000,1.00000/


C-----------------------------------------------------------------------
        rSum=0.0
C       Do H2O (water) continuum
        IF (IDGAS .EQ. 1)THEN
          VB = VB1
          VT = VT1
          DV = DV1
          NPT= NPT1

          ALPHA2 = 200.0**2
          ALPHS2 = 120.0**2
          BETAS = 5.0E-06
          V0S = 1310.0
          FACTRS = 0.15

          HWSQF = 330.0**2
          BETAF = 8.0E-11
          V0F = 1130.0
          FACTRF = 0.97

          V0F2 = 1900.0
          HWSQF2 = 150.0**2
          BETA2 = 3.0E-06

        DO ILAY=whichlayer,whichlayer
          XAMT(ILAY)=AMT(ILAY)*AVOG
          C11(ILAY) = 0.5*C2/T(ILAY)
C Clough et al. use exponential extrapolation between
C temperatures. 2.77777E-2 = 1/(296.0 - 260.0)
          TFAC(ILAY) =  2.77777E-2*(296.0 - T(ILAY))
          ENDDO

C         Loop over the frequencies
          DO IPT=1,NFREQ
             IF (FREQ(IPT) .GE. VB .AND. FREQ(IPT) .LT. VT) THEN
                MK = 1 + INT( (FREQ(IPT) - VB)/DV )
                F1 = VB + (MK - 1)*DV
                GR = (FREQ(IPT) - F1)/DV

                CSFF60 = H2OS60(MK) + GR*(H2OS60(MK+1) - H2OS60(MK))
                CSFF96 = H2OS96(MK) + GR*(H2OS96(MK+1) - H2OS96(MK))
                CFFF96 = H2OF96(MK) + GR*(H2OF96(MK+1) - H2OF96(MK))

C               New GENLN2 self modifier
                VS2=(FREQ(IPT) - V0S)**2
                SFAC=1.0
                IF (FREQ(IPT) .GT. 700.0 .AND. FREQ(IPT) .LT. 1170.0)
     $          THEN
                   JFAC=INT( (FREQ(IPT) - 700.0)/10.0 + 0.0001)
                   SFACL=XFAC(JFAC)
                   SFACH=XFAC(JFAC+1)
                   FL=700.0 + FLOAT(JFAC*10)
                   SFAC=SFACL + (FREQ(IPT) - FL)*(SFACH - SFACL)/10.0
                ENDIF
                SCOR = SFAC*( 1.0 - 0.2333*( ALPHA2/
     $             ( (FREQ(IPT) - 1050.0)**2 + ALPHA2) ) ) *
     $             ( 1.0 - FACTRS*( ALPHS2/(VS2 +
     $             (BETAS*VS2**2) + ALPHS2) ) )

C               New GENLN2 foreign modifier
                VF2=(FREQ(IPT) - V0F)**2
                VF6=VF2*VF2*VF2
                FSCAL=(1.0 - FACTRF*( HWSQF/( VF2 + (BETAF*VF6) +
     $             HWSQF) ) )
                VF2=(FREQ(IPT) - V0F2)**2
                VF4=VF2*VF2
                FSCAL=FSCAL*(1.0 - 0.6*( HWSQF2/( VF2 + BETA2*VF4 +
     $             HWSQF2) ) )
                CFFF96=CFFF96*FSCAL

C               Loop over the layers

                DO ILAY=whichlayer,whichlayer

                   CSFFT=SCOR*CSFF96*(CSFF60/CSFF96)**TFAC(ILAY)

                   A1 = FREQ(IPT)*XAMT(ILAY)*
     $                TANH( C11(ILAY)*FREQ(IPT) )
                   A2 = TS/T(ILAY)
                   A3 = 1.0E-20*( PARTP(ILAY)*CSFFT*selfmult +
     $                ( P(ILAY) - PARTP(ILAY) )*CFFF96*formult )

                   CON(IPT)=(A1*A2*A3)

                ENDDO
             ENDIF
          ENDDO

       ENDIF
C
       RETURN
       END

c***********************************************************************
c this is CKD v0
c modified from /umbc/strow/Hannon/Genln2/Genln2/new_contum.f so that
c only the water continuum calculations are done

c modified to allow for computation of d/dq,d/dT if kJacobian=kSpline=1

c this subroutine calculates the continuum for WATER(ID=1) and N2(ID=22)
       SUBROUTINE CALCON00( CON, IDGAS, NFREQ, FREQ, FSTEP, NLAY, T, P, 
     $    PARTP, AMT, selfmult, formult, whichlayer)

C  PROGRAM        CONTUM   SUBROUTINE
C
C  PURPOSE        TO CALCULATE THE CONTINUUM ABSORPTION
C
C  VERSION        3.Y   D.P. EDWARDS   24/02/93
C                 Scott Hannon, November 1993
c modified by Scott to allow multiplying the (self/foreign) continuum.
c requires that genln2 and input also be modified (both for common block
c and only input for keyword xcontm). (program previously called xcontum)
C 
C  DESCRIPTION    THE CONTINUUM ABSORPTION IS CALCULATED FOR H2O, CO2, 
C                 O2 AND N2 AT THE FREQUENCY FF CM-1.
C
C  REFS.          CLOUGH S.A.,KNEIZYS F.X.,DAVIES R.,GAMACHE R., 
C                 TIPPING R. (1980)
C                 Theoretical line shape for H2O vapour: 
C                 Application to the continuum 
C                 Atmospheric Water Vapour, Eds. A.Deepak,T.D.Wilkeson, 
C                 L.H.Ruhnke, Academic Press, New York
C
C                 CLOUGH S.A.,KNEIZYS F.X.,ROTHMAN L.S.,GALLERY W.O. 
C                 (1981), Atmospheric spectral transmittance and 
C                 radiance: FASCOD1B
C                 SPIE 277 Atmospheric Transmission  152-166
C
C                 CLOUGH S.A.,KNEIZYS F.X.,ROTHMAN L.S.,ANDERSON G.P., 
C                 SHETTLE E.P. (1987)
C                 Current issues in infrared atmospheric transparency
C                 International meeting on
C                 Atmospheric Transparency for Satellite Applications
C                 15-19 Sept. 1986 Capri, Italy. Ed. G.V. Silvestrini.
C                 CUEN.
C
C                 TIMOFEYEV, Y.M. AND M.V. TONKOV
C                 EFFECT OF THE INDUCED OXYGEN ABSORPTION BAND ON THE
C                 TRANSFORMATION OF RADIATION IN THE 6UM REGION OF THE
C                 EARTH'S ATMOSPHERE, 
C                 IZV.ACAD.SCI. USSR
C                 ATMOS.OCEAN.PHYS., ENGLISH, 14, 437-441, 1978.
C
C  ARGUMENT       NPATH  I*4  I/P  NO. OF PATHS FOR CALCULATION   
C                 IFLAG  I*4  I/P  WIDE MESH CALCULATION SPECIFIER
C                 WABS   R*4  I/P  WIDEPASS ABSORPTION BY 
C                                  PAROBOLIC POINT, WIDE MESH AND PATH 
C                 CABS   R*4  I/P WIDEPASS NONLTE FACTOR ABSORPTION BY
C                                 PARABOLIC POINT, WIDE MESH, AND PATH
C
C  SUBROUTINES    GENDAT, CO2FT0, CO2FT1, CO2FT2, H2OFT0, H2OST0, 
C                 H2OST1, N2CT93,  O2CTT
C
C
      include '../FORTRANFILES/max.inc'

C  COMMON BLOCKS CONTAINING CONTINUUM VALUES 
C
       REAL*8 VB1,VT1,DV1,NPT1,H2OS96(2001)
       REAL*8 H2OS60(2001), H2OF96(2001),VB2,VT2,DV2,NPT2,CO2F96(2001)
       REAL*8 CO2F60(2001),CO2F30(2001)
       REAL*8 VB7,VT7,DV7,NPT7,O2C213(59),O2C253(59),O2C293(59)
       REAL*8 VB22,VT22,DV22,NPT22,CN2297(111),CN2273(111)
       REAL*8 CN2253(111),CN2233(111),CN2213(111),CN2193(111)
       REAL*8 selfmult, formult

       COMMON /CH2OS0/ VB1,VT1,DV1,NPT1,H2OS96
       COMMON /CH2OS1/ H2OS60
       COMMON /CH2OF0/ H2OF96
       COMMON /CCO2F0/ VB2,VT2,DV2,NPT2,CO2F96
       COMMON /CCO2F1/ CO2F60
       COMMON /CCO2F2/ CO2F30
       COMMON /CO2CT/  VB7,VT7,DV7,NPT7,O2C213,O2C253,O2C293
C
       COMMON /CN2C0/ VB22,VT22,DV22,NPT22,CN2297,CN2273,
     + CN2253,CN2233,CN2213,CN2193

       REAL*8 C11(kMaxLayer)
C

C      Arguements
       INTEGER IDGAS, NFREQ, NLAY, whichlayer
       REAL*8 FREQ(*), FSTEP, T(*), P(*),PARTP(*),AMT(*),CON(*)

C      Variables for new water continuum adjustment terms
       REAL*8 alpha2, scor

       INTEGER IPT,ILAY

c used in calculating d/dq, d/dT
       REAL*8 TFAC(kMaxLayer)

      REAL*8 vb,vt,dv,csfft
c      REAL*8 csff60(MaxLen),csff96(MaxLen),cfff96(MaxLen)
      REAL*8 csff60,csff96,cfff96
      REAL*8 f1,gr
      INTEGER mk,npt

      REAL*8 ALL,FF,A1,A2,A3,A4

       REAL*8 C2, AVOG, TS, PS
       DATA C2/1.4387863/
       DATA AVOG/6.022045E+26/
       DATA TS/296.0/
       DATA PS/1.0/
  
C-----------------------------------------------------------------------

       IF (IDGAS .EQ. 1)THEN
         VB = VB1
         VT = VT1
         DV = DV1
         NPT = NPT1
         ENDIF

       IF (IDGAS .EQ. 1) THEN
         DO 10 ILAY=whichlayer,whichlayer
           C11(ILAY) = 0.5*C2/T(ILAY)
           ALL = AMT(ILAY)*AVOG
C
           DO 40 IPT=1,NFREQ
             FF=FREQ(IPT)
             IF (FF .GE. VB .AND. FF .LT. VT) THEN
               MK = 1 + INT((FF - VB)/DV) 
               F1 = VB + (MK - 1)*DV

               GR = (FF - F1)/DV 
               CSFF60 = H2OS60(MK) + GR*(H2OS60(MK+1)-H2OS60(MK))       
               CSFF96 = H2OS96(MK) + GR*(H2OS96(MK+1)-H2OS96(MK))
               CFFF96 = H2OF96(MK) + GR*(H2OF96(MK+1)-H2OF96(MK))
C
C  CLOUGH ET AL. USE EXPONENTIAL EXTRAPOLATION BETWEEN TEMPERATURES
C  2.77777E-2 = 1/(296.0 - 260.0)
C
               TFAC(ILAY) =  2.77777E-2*(296.0 - T(ILAY)) 
               CSFFT = CSFF96*(CSFF60/CSFF96)**TFAC(ILAY)
C
C  FASCOD CORRECTION TO SELF CONTINUUM (1.9.85); 
C  FACTOR OF 0.7667 AT 1050cm-1
C
               ALPHA2 = 200.0**2
               SCOR   = 1.0 -      0.2333*ALPHA2/
     +                          ((FF - 1050.0)**2 + ALPHA2)
               CSFFT = CSFFT* SCOR 
C
C  FASCOD CORRECTION TO FOREIGN CONTINUUM
C
               CFFF96 = CFFF96 + 3.159E-8*EXP(-2.75E-4*FF)
C
               A1 = FF*ALL*TANH(C11(ILAY)*FF)
               A2 = TS/(T(ILAY)*PS)
               A3 = 1.0E-20*(PARTP(ILAY)*CSFFT*selfmult + 
     +                (P(ILAY) - PARTP(ILAY))*CFFF96*formult)
               A4 = A1*A2*A3
               CON(IPT)=a4
               END IF
   40        CONTINUE
   10     CONTINUE
       ENDIF

       RETURN
       END

c************************************************************************
      include 'h2oft0.f'
      include 'h2ost0.f'
      include 'h2ost1.f'
c************************************************************************
