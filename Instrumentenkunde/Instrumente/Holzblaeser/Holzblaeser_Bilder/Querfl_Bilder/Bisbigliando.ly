\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 1.8 in) (* 1.1
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
}

\score {


\new Staff \with { \remove "Time_signature_engraver" }
 #(define afterGraceFraction (cons 1 2))
 \relative cis''' {
  \accidentalStyle neo-modern
  \clef "treble"	
   \afterGrace cis1\startTrillSpan^\markup \italic { bisbigl. } { \once \hide "Stem" \parenthesize cis4 } \bar ""}

>>

}

\layout { 
 \context {
  \Score
   \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/64)
  }
 }

\version "2.20.0"
