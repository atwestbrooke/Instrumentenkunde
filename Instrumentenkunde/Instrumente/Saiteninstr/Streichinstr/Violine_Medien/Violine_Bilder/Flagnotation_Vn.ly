\include "ekmel.ily"
\ekmelicStyle go

#(set! paper-alist (cons '("dynamic" . (cons (* 15 in) (* 1.5 in))) paper-alist))
\paper {
#(set-paper-size "dynamic")
#(define top-margin (* 8))
#(define bottom-margin (* 2))
#(define left-margin (* 5))
#(define right-margin (* 5))
	tagline = ##f
	page-breaking = #ly:one-line-breaking
} 

\score {
 \new Staff
  \relative g {
   \once \hide Staff.TimeSignature
   \set Timing.defaultBarType = "!"
   \once \set glissandoMap = #'((3 . 0))
    \override Score.NonMusicalPaperColumn.full-measure-extra-space = #5 g'1^\flageolet | g1 \bar "||" <g, d'\harmonic> | d'' \bar "||" <g,, c\harmonic> | g'' \bar "||" <g,, h\harmonic> | h'' \bar "||" <g,, hes\harmonic> | d''' \bar "||" <g,,, heseh\harmonic> | feh''' \bar "|."
   }
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
