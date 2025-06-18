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
  \transpose b c''
   \relative b,, { 
    \clef "treble"
	 \time 31/8
      \hide Staff.BarLine
       \omit Staff.TimeSignature
	    \once \override NoteHead.font-size = #-2 < \parenthesize b >1*1/2 | d1*5/2\glissando |  g'''1*3/8 | \once \override NoteHead.font-size = #-2 < \parenthesize b>
	}
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
