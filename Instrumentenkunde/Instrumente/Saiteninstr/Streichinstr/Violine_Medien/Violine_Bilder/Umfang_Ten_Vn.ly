
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
  \relative g, { 
   \clef "bass" 
    \hide Staff.BarLine
     \once \hide Staff.TimeSignature
      \override Score.NonMusicalPaperColumn.full-measure-extra-space = #5  <g d' a' e'>1 \bar ""
   }
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
