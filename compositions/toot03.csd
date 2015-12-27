<CsoundSynthesizer>

<CsOptions>
-odac 
</CsOptions>

<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1

instr 3                          ; p3=duration of note
    k1 linen p4, p6, p3, p7      ; p4=amp
    a1 oscil k1, p5, 1           ; p5=freq
    out a1                       ; p6=attack time
endin                            ; p7=release time

</CsInstruments>

<CsScore>
f1   0    4096 10 1      ; sine wave

;ins strt dur  amp(p4)   freq(p5)  attack(p6)     release(p7)
i3   0    1    10000     440       0.5            0.7
i3   1.5  1    10000     440       0.9            0.1
i3   3    1    5000      880       0.02           0.99
i3   4.5  1    5000      880       0.7            0.01
i3   6    2    20000     220       0.5            0.5

e
</CsScore>

</CsoundSynthesizer>

; http://www.csounds.com/toots/index.html#toot03
; 
; Toot 3: Envelopes
;
; Here we add the linen opcode:
; http://www.csounds.com/manual/html/linen.html
;
; "linen — Applies a straight line rise and decay pattern 
; to an input amp signal."
