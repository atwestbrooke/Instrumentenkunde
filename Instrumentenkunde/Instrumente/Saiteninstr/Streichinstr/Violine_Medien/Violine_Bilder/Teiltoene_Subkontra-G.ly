\include "ekmel-36.ily"
\ekmelicStyle go
\language "deutsch"
#(set! paper-alist (cons '("dynamic" . (cons (* 20 in) (* 2.5 in))) paper-alist))
\paper {
#(set-paper-size "dynamic")
#(define top-margin (* 4))
#(define bottom-margin (* 2))
#(define left-margin (* 5))
#(define right-margin (* 5))
	tagline = ##f
	page-breaking = #ly:one-line-breaking
} 

global = {
	\omit Score.TimeSignature
}

TeiltoeneSubkontraGTreble = \relative g {
	\clef "treble"
	  \skip1*7 \bar "" g1 \bar "" a \bar "" h \bar "" cil \bar "" d \bar "|."
}

TeiltoeneSubkontraGBass = \relative g,,, {
	\clef "bass"
	   \ottava #-1 g1 \bar "" \ottava #0 g' \bar "" d' \bar "" g \bar "" h \bar "" d \bar "" fel \bar "" \skip1*5 \bar "|."
}

\score {
	\new PianoStaff <<
	 \global
	  \new Staff = "up" {
	   \TeiltoeneSubkontraGTreble }
	  \new Staff = "down" {
	   \TeiltoeneSubkontraGBass }
	>>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
	