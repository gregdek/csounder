<CsoundSynthesizer>

<CsOptions>
-odac 
</CsOptions>

<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1

instr 2
    a1 oscil p4, p5, 1   ; p4=amp
    out a1               ; p5=freq

endin
</CsInstruments>

<CsScore>
f1   0    4096 10 1      ; sine wave

;ins strt dur  amp(p4)   freq(p5)
i2   0    1    2000      880
i2   1.5  1    4000      440
i2   3    1    8000      220
i2   4.5  1    16000     110
i2   6    1    32000     55
</CsScore>

</CsoundSynthesizer>

; http://www.csounds.com/toots/index.html#toot02
; 
; Toot 2: P-Fields
;
; Adding P-Fields so we can actually send parameters. 
; Extends on Toot example 1. Pretty straightforward once
; you understand the craziness of table functions.
