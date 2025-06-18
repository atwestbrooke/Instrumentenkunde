\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 2 in) (* 1
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
 \relative a' { 
  \clef "treble" 
   \time 5/4
   a2.\espressivo^\markup { 70% Luft } r2 | \time 3/4 b2.\espressivo \bar "" }

}

\layout {
  \context {
    \Score
    \override NoteHead.stencil = #my-note-head
  }
}

\version "2.20.0"
