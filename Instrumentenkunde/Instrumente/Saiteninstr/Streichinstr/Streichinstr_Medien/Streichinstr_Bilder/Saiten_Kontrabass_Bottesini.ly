\language deutsch
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
  \new Staff \relative g,, { 
   \clef "bass"
     \once \hide Staff.TimeSignature
		<g c f b>1^\markup { \translate #'( -10 . 0 ) \column { { "klingende" \line { "Saitenstimmung:" } } } } \bar ""
   }
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
