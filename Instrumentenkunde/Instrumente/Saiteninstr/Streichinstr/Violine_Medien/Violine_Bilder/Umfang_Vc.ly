
#(set! paper-alist (cons '("dynamic" . (cons (* 15 in) (* 1.5 in))) paper-alist))
\paper {
#(set-paper-size "dynamic")
#(define top-margin (* 4))
#(define bottom-margin (* 2))
#(define left-margin (* 5))
#(define right-margin (* 5))
	tagline = ##f
	page-breaking = #ly:one-line-breaking
} 

\score {
 \new Staff
  \relative c, { 
  \clef "bass"
   \hide Staff.BarLine
   \once \hide Staff.TimeSignature
   \once \set glissandoMap = #'((3 . 0))
    \override Score.NonMusicalPaperColumn.full-measure-extra-space = #5 <c g' d' a' >1\glissando | \skip1 |  \clef "treble" c'''' | \ottava #1  < \parenthesize e'\harmonic >
   }
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
