\language deutsch
#(set! paper-alist (cons '("dynamic" . (cons (* 2 in) (* 1.5 in))) paper-alist))
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
 
  \new Staff \relative a,,, { 
   \clef "bass"
    \once \hide Staff.TimeSignature
	 \hide Staff.BarLine 
	  \ottava #-1  a1^\markup { \translate #'( -4 . 4 ) { \column { "Saitenstimmung des" \line { "Montréaler Instruments" } } } } e'  \ottava #0 h' \bar ""
   }
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
