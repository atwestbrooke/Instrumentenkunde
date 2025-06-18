\language deutsch
#(set! paper-alist (cons '("dynamic" . (cons (* 15 in) (* 1.5 in))) paper-alist))
\paper {
#(set-paper-size "dynamic")
#(define top-margin (* 10))
#(define bottom-margin (* 2))
#(define left-margin (* 5))
#(define right-margin (* 5))
	tagline = ##f
	page-breaking = #ly:one-line-breaking
}
\layout { ragged-right = ##t }

\score {
 \new Staff
  \relative g { 
   \clef "treble"
    \time 4/2
     \hide Staff.BarLine
      \once \hide Staff.TimeSignature
       \override Score.NoteHead.style = #'baroque
        \once \override Score.NoteHead.color = #blue g\breve^\markup { \with-color #blue \translate #'(-4 . 0) Bordunsaite }   | g1  d' | c'  c
			\once \undo \hide Staff.BarLine \bar "||"
			 \override Score.NoteHead.color = #red
			  \override Score.Accidental.color = #red

			\skip 8
			 < \parenthesize b\harmonic>1^\markup { \with-color #red {
				   \column {
				    \line { \translate #'(-2 . 0) nicht in der 1. }
  					 \line { \translate #'(-2 . 0)  Lage spielbar }
					}
  				   }
				  }
			 < \parenthesize h\harmonic>1  \bar ""
   }
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
