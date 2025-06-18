\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 15 in) (* 7 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #20
ragged-right = ##f
}

\layout {
  \context {
    \Voice
    \override TextScript.self-alignment-X = #CENTER
    \override TextScript.parent-alignment-X = #CENTER
  }
	\context {
	 \Score
	  \omit BarNumber
	}
}

\score {
		<< \new Staff \with { instrumentName= \markup {
   							 \column { "überblasene"
      						 \line { "Naturtöne"} 
									}
								}
							 \remove "Time_signature_engraver"
							 }

			\relative c { 
			  \clef "treble"
				\once \override NoteHead.color = #grey c1^\markup { \with-color #grey 1 }_\markup { \with-color #grey Pedal } \bar "" \once \override NoteHead.color = #darkgreen c'^\markup { \with-color #darkgreen 2 } \bar "" \once \override NoteHead.color = #darkgreen g'^\markup { \with-color #darkgreen 3 }_\markup { \with-color #darkgreen +2 } \bar "" c^\markup { 4 } \bar "" e^\markup { 5 }_\markup { -14 } \bar "" g^\markup { 6 }_\markup { +2 } \bar "" \once \override NoteHead.color = #red \once \override Accidental.color = #red b^\markup { \with-color #red 7 }_\markup { \with-color #red -31 } \bar "" c^\markup { 8 } \bar "" d^\markup { 9 }_\markup { +4 } \bar "" }
		 >>
}

\markup \vspace #3.5

\score {
		<< \new Staff \with { instrumentName= \markup {
												        \column { "Ventilgriffe" 
												         \line { "(Beispiel)" }
												    }
												}
							  \remove "Time_signature_engraver" 
							   \remove "Bar_line_engraver" }			\relative g' {
			\omit Stem
			\clef "treble"
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			\once \override NoteHead.color = #darkgreen 			g1*1/8^\markup { \with-color #darkgreen 3 } 			fis4*1/2^\markup { 2. Ventil }
			f^\markup { 1. Ventil }
			e^\markup { \center-column { "3. od." \line { "1. + 2." } \line { Ventil } } }
			es^\markup { \center-column { "2. + 3." \line { Ventil } } }
			d^\markup { \center-column { "1. + 3." \line { Ventil } } }
			cis^\markup { \center-column { "alle 3" \line { Ventile } } } \once \override NoteHead.color = #darkgreen \once \override Accidental.color = #darkgreen \parenthesize c1*1/8^\markup { \with-color #darkgreen (2) } \bar ""
			}
		>>
}

\markup \vspace #7

\score { 
			
		<< \new Staff \with { instrumentName= \markup { "alle Töne/Griffe" }
			\remove "Time_signature_engraver" 
			\remove "Bar_line_engraver"
			}
			\relative c' {
			\time 7/8
			\omit Stem
			\clef "treble"
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			
			\once \override NoteHead.color = #darkgreen 			c1*1/8^\markup { \with-color #darkgreen 2 } 			h4*1/2 b a as g fis \bar ""
			\once \override NoteHead.color = #darkgreen 			g'1*1/8^\markup { \with-color #darkgreen 3 } 			fis4*1/2 f e es d cis \bar ""
			\once \override NoteHead.color = #black 			c'1*1/8^\markup { 4 } h4*1/2 b a as g fis \bar ""
			\once \override NoteHead.color = #black 			e'1*1/8^\markup { 5 } es4*1/2 d cis c h b \bar ""
			\break
			\once \override NoteHead.color = #black 			g'1*1/8^\markup { 6 } fis4*1/2 f e es d cis \bar ""
			\once \override NoteHead.color = #black

			\once \override NoteHead.color = #red 
			\once \override Accidental.color = #red
			b'1*1/8^\markup { \with-color #red 7 } 
			\override NoteHead.color = #(x11-color 'MediumVioletRed)
			\override Accidental.color = #(x11-color 'MediumVioletRed)
			a4*1/2 as g fis f e \bar ""

			
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			\once \override NoteHead.color = #black 			c'1*1/8^\markup { 8 } h4*1/2 b a as g fis \bar ""
			\once \override NoteHead.color = #black 			d'1*1/8^\markup { 9 } cis4*1/2 c h b a as \bar ""
			
			}
		>>
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions
