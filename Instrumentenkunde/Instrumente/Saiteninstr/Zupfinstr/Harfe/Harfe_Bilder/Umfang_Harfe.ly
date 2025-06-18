\language "deutsch"
#(set! paper-alist (cons '("dynamic" . (cons (* 3 in) (* 1.5 in))) paper-alist))
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
   \relative ces,, { 
    \clef "bass"
     \hide Staff.BarLine
      \omit Staff.TimeSignature 
	   \time 8/1
 		 \ottava #-1 ces1*12/2\glissando  \clef "treble" \ottava #1 gis'''''''1*2 |	}
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
