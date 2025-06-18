\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 0.93 in) (* 0.6
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
}

\score {

\new Staff \with { \remove "Time_signature_engraver" }
 \relative f,
{
  \clef "bass"	
   f2 \bar ""}

}

\version "2.20.0"
