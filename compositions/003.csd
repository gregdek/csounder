; Third example! Calling the same instrument multiple times
; at once.  Using 002.csd as a starting point.
;
; Literally all we're doing here is changing the p2 values
; in the Score section from the 002.csd example, so that 
; every note starts at 0 seconds. It's identical to 002.csd
; otherwise in every respect.

<CsoundSynthesizer>

<CsOptions>
-odac 
</CsOptions>

<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1 

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

i 1 0 2 300  600  0	;if p6=0 then expon is used
i 1 0 2 300  600  1	;if p6=1 then line is used
i 1 0 2 600  1200 0
i 1 0 2 600  1200 1
i 1 0 2 1200 2400 0
i 1 0 2 1200 2400 1
i 1 0 2 2400 30   0
i 1 0 2 2400 30   1
e
</CsScore> 
</CsoundSynthesizer> 
