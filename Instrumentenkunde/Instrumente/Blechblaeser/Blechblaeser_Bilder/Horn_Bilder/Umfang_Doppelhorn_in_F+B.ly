\language "deutsch"
#(set! paper-alist (cons '("dynamic" . (cons (* 15 in) (* 2.4 in))) paper-alist))
\paper {
#(set-paper-size "dynamic")
#(define top-margin (* 4))
#(define bottom-margin (* 2))
#(define left-margin (* 5))
#(define right-margin (* 5))
	tagline = ##f
	page-breaking = #ly:one-line-breaking
}

\layout {
 \context {
	\Voice
	 \consists "Horizontal_bracket_engraver"
	  \override HorizontalBracket.bracket-flare = #'(0 . 0)
  }
}


\score {
 \new Staff
  \relative as,, { 
   \clef "bass"
    \hide Staff.BarLine
     \once \hide Staff.TimeSignature
	  \tiny s1*1/5^\markup { \right-align Die Pedaltöne des F-Horns sprechen nur schwer an } g-\tweak HorizontalBracketText.text \markup \tiny \center-column {
												    \line { einige Pedaltöne im }
												     \line { hoch-B-Horn möglich }
												   } \startGroup gis a b\stopGroup | 
   \once \override Glissando.bound-details.right.Y = #-1.8 \normalsize h!1*15/16\glissando_\markup \tiny "2. Teilton des F-Horns + Ventile 1, 2, 3" \once \hide NoteHead \once \hide Stem \override NoteHead.font-size = #-16 a'4*1/16 \clef "treble"  \once \hide NoteHead a''1\glissando \override NoteHead.font-size = #0
\once \override Glissando.style = #'dashed-line f'1*1/2\glissando^\markup \tiny \translate #'(-6 . 9) { \right-column { \line { Teilton: }
									  \line { F = 16. }
									  \line { hoch-B = 12.}
												}
									  }
\tiny \parenthesize b1*3/2^\markup { \translate #'(-3 . 3) "(hoch-B 16. Teilton)" }

	}
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
