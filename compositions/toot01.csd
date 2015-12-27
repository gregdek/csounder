<CsoundSynthesizer>

<CsOptions>
-odac 
</CsOptions>

<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1

instr 1
    a1 oscil 10000, 440, 1
    out a1

endin
</CsInstruments>

<CsScore>
f 1 0 4096 10 1          ; use GEN10 to compute a sine wave
i 1 0 4
e
</CsScore>

</CsoundSynthesizer>

; http://www.csounds.com/toots/index.html#toot01
; 
; Toot 1: Play One Note
;
; Now we are introduced to function table statements:
; http://www.csounds.com/manual/html/f.html
;
; So the "f" statement is creating a wave table using
; the "GEN10" (that's the 10 in the 4th parameter).
; I'm not even going to bother describing it; just
; read about function table statements for yourself.
; 
; And how in God's name is this function table even
; referenced? Oh, it's easy! See, in the Score, you
; create a function table, which is then stored helpfully
; as "function table 1". Not that there are any variables
; or anything; you just know. And then, in the Instrument
; section, you refer back to this as the parameter of the
; oscillator opcode -- you know where it says:
;   a1 oscil 10000, 440, 1
; ...yeah, that 1 on the end refers to "function table 1".
; 
; Simple!
;
; And by simple I mean arcane and utterly insane. But hey, 
; this is what happens when you try to learn a music language
; written in 1986. Onward!
