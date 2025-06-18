\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 15 in) (* 8.6 in))) paper-alist))

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
	   \omit BarLine
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
		   \transpose c es,
			\relative c, { 
			  \clef "bass"
				c1^\markup { 1 }_\markup { Pedal }
				\once \override NoteHead.color = #darkgreen c'^\markup { \with-color #darkgreen 2 }
			    \once \override NoteHead.color = #darkgreen g'^\markup { \with-color #darkgreen 3 }_\markup { \with-color #darkgreen +2 }
				c^\markup { 4 }
				e^\markup { 5 }_\markup { -14 }
				g^\markup { 6 }_\markup { +2 }
				\once \override NoteHead.color = #red \once \override Accidental.color = #red b^\markup { \with-color #red 7 }_\markup { \with-color #red -31 }
			   \clef "treble"
				c^\markup { 8 }
				d^\markup { 9 }_\markup { +4 }
				e^\markup { 10 }_\markup { -14 }
				\once \override NoteHead.color = #red \once \override Accidental.color = #red fis^\markup { \with-color #red 11 }_\markup { \with-color #red -49 }
				g^\markup { 12 }
			}
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
						 	   \remove "Bar_line_engraver" }
		   \transpose c es,
			\relative g {
			\omit Stem
			\clef "bass"
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			\once \override NoteHead.color = #darkgreen 			g1*1/8^\markup { \with-color #darkgreen 3 } 			fis4*1/2^\markup { 2. Ventil }
			f^\markup { 1. Ventil }
			e^\markup { \center-column { "3. od." \line { "1. + 2." } \line { Ventil } } }
			es^\markup { \center-column { "2. + 3." \line { Ventil } } }
			d^\markup { \center-column { "1. + 3." \line { Ventil } } }
			cis^\markup { \center-column { "alle 3" \line { Ventile } } } \once \override NoteHead.color = #darkgreen \once \override Accidental.color = #darkgreen \parenthesize c1*1/8^\markup { \with-color #darkgreen (2) } 
			}
		>>
}

\markup \vspace #5

\score { 
			
		<< \new Staff \with { instrumentName= \markup { "alle Töne/Griffe" }
			\remove "Time_signature_engraver" 
			\remove "Bar_line_engraver"
			}
		   \transpose c es,
			\relative c, {
			\time 12/8
			\omit Stem
			\clef "bass" 
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			
			
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black
			c1*1/8^\markup { 1 }
			h4*1/2 b \ottava #-1 a as g fis
			\override NoteHead.color = #magenta
			\override Accidental.color = #magenta
    		\once \override TextScript.self-alignment-X = #LEFT
    		\once \override TextScript.parent-alignment-X = #LEFT
			f^\markup { \column \with-color #magenta { "+ Quartventil, ggf. mit"
								   \line { "teilweiser Verwendung" }
								   \line { "des 5. Ventils " }
								  }
					   }
			e es d cis 

			\time 7/8
			\override NoteHead.color = #blue
			\override Accidental.color = #blue

			\once \override NoteHead.color = #darkgreen
			\once \override Accidental.color = #darkgreen 			\ottava #0 c''1*1/8^\markup { \with-color #darkgreen 2 } 			h4*1/2 b a as g fis 
			\once \override NoteHead.color = #darkgreen
			\once \override Accidental.color = #darkgreen 			g'1*1/8^\markup { \with-color #darkgreen 3 } 			fis4*1/2 f e es d cis 
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black 			c'1*1/8^\markup { 4 } h4*1/2 b a as g fis 
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black
 
			\break
			e'1*1/8^\markup { 5 } es4*1/2 d cis c h b
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black 			g'1*1/8^\markup { 6 } fis4*1/2 f e es d cis
			\once \override NoteHead.color = #red 
			\once \override Accidental.color = #red
			b'1*1/8^\markup { \with-color #red 7 } 
			\override NoteHead.color = #(x11-color 'MediumVioletRed)
			\override Accidental.color = #(x11-color 'MediumVioletRed)
			a4*1/2 as g fis f e 
			
			
			\clef "treble"
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black 			c'1*1/8^\markup { 8 } h4*1/2 b a as g fis 
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black
 
			\break
			d'1*1/8^\markup { 9 } cis4*1/2 c h b a as
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black
			e'1*1/8^\markup { 10 } es4*1/2 d cis c h b

			\override NoteHead.color = #(x11-color 'MediumVioletRed)
			\override Accidental.color = #(x11-color 'MediumVioletRed)
			\once \override NoteHead.color = #red
			\once \override Accidental.color = #red
			fis'1*1/8^\markup { \with-color #red 11 }
			f4*1/2 e es d cis c 
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black
			g'1*1/8^\markup { 12 }
			fis4*1/2 f e es d cis
			}
		>>
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions
