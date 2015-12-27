; Second example! Using k-values. 
; Cribbing from: http://www.csounds.com/manual/html/examples/line.csd

<CsoundSynthesizer>

<CsOptions>
; Keeping this simple; straight -odac out. 
-odac 
</CsOptions>

<CsInstruments>

; Initialize the global variables as we did in the first one.
; For a copious description, see 001.csd.

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1 

; OK, so this instrument is quite a bit more complicated
; than in 001.csd.  This uses a "k" variable, which "holds
; scalar values which are updated only once per control period."
;
; We're also using a more complex opcode, vco2, which is
; documented here:
; http://www.csounds.com/manual/html/vco2.html
; 
; We're also seeing actual control flow. If statements!
; Else statements! Logic! 
;
; Basically, we're tracing between two pitches, with the
; option of tracing linearly or exponentially according
; to the p6 parameter. p4 and p5 are the pitches we're
; tracing between.

kp = p6
; choose between expon or line
if (kp == 0) then 
  ; kpitch is assigned using the expon opcode
  kpitch expon p4, p3, p5 
elseif (kp == 1) then
  ; kpitch is assigned using the line opcode
  kpitch line p4, p3, p5 
endif

asig vco2 .6, kpitch 
outs asig, asig

endin 
</CsInstruments> 
<CsScore> 

i 1 0  2 300  600  0	;if p6=0 then expon is used
i 1 3  2 300  600  1	;if p6=1 then line is used
i 1 6  2 600  1200 0
i 1 9  2 600  1200 1
i 1 12 2 1200 2400 0
i 1 15 2 1200 2400 1
i 1 18 2 2400 30   0
i 1 21 2 2400 30   1
e
</CsScore> 
</CsoundSynthesizer> 
