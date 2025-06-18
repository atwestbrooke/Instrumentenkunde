\language "deutsch"
#(set! paper-alist (cons '("dynamic" . (cons (* 15 in) (* 1.2 in))) paper-alist))
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
	  \override NoteHead.color = #blue \override Accidental.color = #blue \tiny s1*1/5 g\startGroup gis a b\stopGroup 
	\normalsize
	 
<< {
	\override Glissando.thickness = #2
	 \override NoteHead.color = #(x11-color 'MediumVioletRed)
	  \override Accidental.color = #(x11-color 'MediumVioletRed)
	   \override Glissando.color = #(x11-color 'MediumVioletRed)
h!1*2                                                                                                                                                                                                                                       \glissando \hide NoteHead e'1*5/2
	  \override NoteHead.color = #(x11-color 'OrangeRed)
	   \override Accidental.color = #(x11-color 'OrangeRed)
		\override Glissando.color = #(x11-color 'OrangeRed) 
g'1*2\glissando \undo \hide NoteHead b'1 }
	\\
   { 
	\override Glissando.thickness = #2
	 \override Glissando.color = #darkgreen
	  \hide NoteHead
		s1. a,,,1*31/16\glissando \override NoteHead.font-size = #-16 \override NoteHead.no-ledgers = ##t  d'1*1/16 \clef "treble"   c1*3/2\glissando d' s2 } >>
	}
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
