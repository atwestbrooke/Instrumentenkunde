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
  \relative d, { 
   \clef "bass"
     \hide Staff.BarLine
      \once \hide Staff.TimeSignature
       d1 | g | c | e | a | d
   }
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
