\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 1.8 in) (* 0.7
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
}

\score {

\new Staff \with { \remove "Time_signature_engraver" }
 \relative gis
{
  \clef "bass"	
   \repeat tremolo 8 { b32^\markup \italic { bisbigl. } ais } \bar ""}

}

\layout { 
 \context {
  \Score
   \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/64)
  }
 }

\version "2.20.0"
