\language "deutsch"
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
  \relative h,, { 
  \clef "bass"
   \hide Staff.BarLine
   \once \hide Staff.TimeSignature
	< \parenthesize h >1 | < \parenthesize c > | 
    \override Score.NonMusicalPaperColumn.full-measure-extra-space = #5 
   \once \set glissandoMap = #'((3 . 0)) <e a d g >\glissando | \clef "treble"  g''' | < \parenthesize g'\harmonic>^\markup { \null \translate #'(2 . 3)  *}
	}
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
