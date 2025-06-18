#(set! paper-alist (cons '("mein Format" . (cons (* 1.8 in) (* 0.7
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
}

#(define (my-note-head grob)
   (let ((duration (ly:grob-property grob 'duration-log)))
     (if (>= duration 2)
         (grob-interpret-markup grob
              #{
                \markup \filled-box #'(-0.5 . 0.5) #'(-0.5 . 0.5) #0
              #})
         (grob-interpret-markup grob
                #{
                  \markup
                  \override #'(box-padding . 0)
                  \override #'(thickness . 2)
                  \box {
                    \transparent
                    \filled-box #'(-0.3 . 0.3) #'(-0.3 . 0.3) #0
                  }
                #}))))

\score {

\new Staff \with { \remove "Time_signature_engraver" }
 \relative d' { 
  \clef "treble" 
   \time 5/4
   d e2 d8[( e d f]) \bar "" }

}

\layout {
  \context {
    \Score
    \override NoteHead.stencil = #my-note-head
  }
}

\version "2.20.0"
