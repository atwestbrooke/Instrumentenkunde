\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 2.6 in) (* 1
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
\top-margin 0
}



\score { 

\new Staff \with { \remove "Time_signature_engraver" }
 \relative b' { \accidentalStyle dodecaphonic-first
  \clef "treble" 
   \time 2/4 b:32^"Flz."\espressivo( a8:64_.[) r16 es:128]( | \time 4/4 as4.:32 des8:64~ des8: g,8:~ g4:32) }

}

\version "2.20.0"
