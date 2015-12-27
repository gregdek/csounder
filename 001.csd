<CsoundSynthesizer>

; The first tutorial: making a basic sound, and the language basics.
; Basically, I'm taking the example file oscils.csd, which I am 
; documenting copiously in a desperate effort to understand 
; what's going on.
;
; http://www.csounds.com/manual/html/examples/oscils.csd
;
; In the old days, csound files appeared to have been two separate files:
; the orchestra file and the score file. Now these are together in a single
; .csd file, separated into three parts: options, instruments, and score.
;
; Note: Whitespace is arbitrary! Adopt whatever hideous convention you choose.


<CsOptions>

; This first section is for runtime options. I only know
; these handful so far.

-odac     ;;; This is for audio out in real time.
;-iadc    ;;; I am told that this is for real time input.

; If you want csound to send output to a file, uncomment
; line below, and remove the -odac line above.
; -o oscils.wav -W 

</CsOptions>


<CsInstruments>

; This first bit is the header subsection of the instrument section. 
; Not that you can tell from any syntax; I presume that anything 
; before explicit instrument definitions is header information. 
; Maybe I'm wrong! I guess I'll find out!
;
; Anything in the header section is basically a default for
; elsewhere, as I understand it.

; sr is the audio sampling rate.
sr = 44100   ;;; http://www.csounds.com/manual/html/sr.html

; ksmps is number of samples per control period. 
ksmps = 32   ;;; http://www.csounds.com/manual/html/ksmps.html

; nchnls is the number of channels. 2 must mean stereo!
nchnls = 2   ;;; http://www.csounds.com/manual/html/nchnls.html

; 0dbfs sets the value of 0 decibels using full scale amplitude.
; Unfortunately, I don't know what that means exactly.
0dbfs  = 1   ;;; http://www.csounds.com/manual/html/Zerodbfs.html


; Now we start defining instruments!

; Here's our one instrument. The syntax is crazy arcane, and I
; feel like I'm taking crazy pills just looking at it, since it 
; uses super-specific opcodes and operators. So here goes:

instr 1

; The most important thing here is the variable "asig". We're 
; basically assigning an audio signal to the variable "asig";
; we know that "asig" is an audio signal because it starts with
; "a". ¯\_(ツ)_/¯ 
;
; The next most important thing here is the opcode "oscils".
; That's the sine oscillator described here:
; http://www.csounds.com/manual/html/oscils.html
;
; What is "iflg"? It's an initialization operator. You know that
; because it starts with "i". ¯\_(ツ)_/¯  iflg is associated
; with the specific opcode we're using here, "oscils
;
; And what is "p4"? Well, every instrument can accept parameters.
; p1 is instrument number. p2 is beats. p3 is duration in beats.
; Then p4 and beyond are arbitrary variables that can be handled
; by the instrument itself. So it's basically parameter handling
; for the old and very wretched.
;
; And what is "outs"? That's our outputs. Remember that we're 
; handling two channels, so I guess that's what you need two,
; and they're identical.
;
; Thus:

iflg = p4
asig oscils .7, 220, 0, iflg
outs asig, asig

; means:
; set iflg to the parameter passed in from the score.
; set asig to be the sine oscillator.
; outputs are the asig and the asig again (since it's stereo).

endin
; And that's the end of our first instrument definition. Hurray!

</CsInstruments>


<CsScore>

; OK, now we're in the score section, which has a COMPLETELY
; DIFFERENT SYNTAX from the Instrument section. Fortunately,
; it's kind of simple-ish? At least to start. From what I'm
; reading, these values can become crazy complex. (Which is
; what gives csound its power, I suppose.)
;
; In our case, "i" means "instrument or note statement".
; These statements below are basically just telling us
; when to turn our instruments on. More details:
; http://csounds.com/manual/html/i.html
;
; The parameters get passed to the instruments in order. 
; The first is p1, the second is p2, and so on.
;
; p1 is usually the instrument.
; p2 is usually the starting time in "beats".
; p3 is usually the duration time in "beats". 
; p4 and beyond are additional parameters for the instrument.

; Our first statement is calling instrument 1, starting at 0 
; seconds, for a duration of 2 seconds, and an iflg value of 0
; (which I don't understand).
i 1 0 2 0

; Our second statement is calling instrument 1, starting at 3 
; seconds, for a duration of 2 seconds, and an iflg value of 2
; (which I still don't understand).
i 1 3 2 2

; And the "e" seems to mean "end":
; http://csounds.com/manual/html/e.html 
e

</CsScore>
</CsoundSynthesizer>
