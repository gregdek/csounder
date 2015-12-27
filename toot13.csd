<CsoundSynthesizer>

<CsOptions>
-odac 
</CsOptions>

<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1

          instr 13
iamp      =         ampdb(p4) / 2       ;amp scaled for two sources
ipluckamp =         p6                  ;p6: % of total amplitude, 1=dB amp as in p4
ipluckdur =         p7*p3               ;p7: % of total duration, 1=entire note duration
ipluckoff =         p3 - ipluckdur

ifmamp    =         p8                  ;p8: % of total amplitude, 1=dB amp as in p4
ifmrise   =         p9*p3               ;p9: % of total duration, 1=entire note duration
ifmdec    =         p10*p3              ;p10: % of total duration
ifmoff    =         p3 - (ifmrise + ifmdec)
index     =         p11
ivibdepth =         p12
ivibrate  =         p13
ifrmntamp =         p14                 ;p14: % of total amplitude, 1=dB amp as in p4
ifrmntris =         p15*p3              ;p15: % of total duration, 1=entire note duration
ifrmntdec =         p3 - ifrmntris

kpluck    linseg    ipluckamp, ipluckdur, 0, ipluckoff, 0
apluck1   pluck     iamp, p5, p5, 0, 1
apluck2   pluck     iamp, p5*1.003, p5*1.003, 0, 1
apluck    =         kpluck * (apluck1+apluck2)

kfm       linseg    0, ifmrise, ifmamp, ifmdec, 0, ifmoff, 0
kndx      =         kfm * index
afm1      foscil    iamp, p5, 1, 2, kndx, 1
afm2      foscil    iamp, p5*1.003, 1.003, 2.003, kndx, 1
afm       =         kfm * (afm1+afm2)

kformant linseg     0, ifrmntris, ifrmntamp, ifrmntdec, 0
kvib      oscil     ivibdepth, ivibrate, 1
afrmt1    fof       iamp, p5+kvib, 650, 0, 40, .003,.017,.007,4,1,2,p3
afrmt2    fof       iamp, (p5*1.001)+kvib*.009, 650, 0, 40, .003,.017,.007,10,1,2,p3
aformant  =         kformant * (afrmt1+afrmt2)

          out       apluck + afm + aformant
          endin
</CsInstruments>

<CsScore>
f1   0    8192 10   1                                                                ; Sine
f2   0    2048 19   0.5    1  270 1                                                  ; Sine quadrant rise

;  pluckamp = p6         -    % of total amplitude, 1=dB amp as specified in p4
;  pluckdur = p7*p3      -    % of total duration, 1=entire duration of note

;  fmamp = p8            -    % of total amplitude, 1=dB amp as specified in p4
;  fmrise = p9*p3        -    % of total duration, 1=entire duration of note
;  fmdec = p10*p3        -    % of total duration
;  index = p11           -    number of significant sidebands: p11 + 2
;  vibdepth = p12
;  vibrate = p13
;  formantamp = p14      -    % of total amplitude, 1=dB amp as specified in p4
;  formantrise = p15*p3  -    % of total duration, 1=entire duration of note

 f0 01
 f0 02
 f0 03
 f0 04
 f0 06
 f0 07
 f0 08
 f0 09
 f0 10
 f0 11
 f0 12
 f0 14
 f0 15
 f0 16
 f0 17
 f0 18
 f0 19
 f0 20
 f0 21
 f0 22
 f0 23
 f0 24
 f0 25

;ins st dur amp frq plkmp plkdr fmmp  fmrs   fmdc indx vbdp      vbrt frmp fris
i13  0   5  80  200  .8   .3     .7   .2     .35    8     1      5      3   .5
i13  5   8  80  100  .    .4     .7   .35    .35    7     1      6      3   .7
i13 13  13  80   50  .    .3     .7   .2     .4     6     1      4      3   .6
</CsScore>

</CsoundSynthesizer>

; http://www.csounds.com/toots/index.html#toot13
;
; Toot 13: Spectral Fusion
