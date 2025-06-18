\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 1 in) (* 2.3
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
}

\score {

\new Staff \with { \remove "Time_signature_engraver" }
 \relative c'' { 
  \clef "treble"
   <c d'>1^\markup \fontsize #1 { \woodwind-diagram #'flute #'((cc . (two three)) (lh . (b)) (rh . (ees))) } \bar "" }

}

\version "2.20.0"
