#(set! paper-alist (cons '("mein Format" . (cons (* 0.78 in) (* 0.7
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
}



\score {

\new Staff \with { \remove "Time_signature_engraver" }
 \relative b' { 
  \clef "treble" 
    \xNotesOn b }

}

\version "2.20.0"
