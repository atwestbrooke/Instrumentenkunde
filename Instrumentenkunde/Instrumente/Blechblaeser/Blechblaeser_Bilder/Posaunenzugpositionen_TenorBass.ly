\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 15 in) (* 7.5 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #18
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
		   \transpose c b, {
			\relative c, { 
			  \clef "bass"
				 c1^\markup { 1 }_\markup { Pedal }
				 \once \override NoteHead.color = #darkgreen \once \override Accidental.color = #darkgreen c'^\markup { \with-color #darkgreen 2 }
				 \once \override NoteHead.color = #darkgreen \once \override Accidental.color = #darkgreen g'^\markup { \with-color #darkgreen 3 }_\markup { \with-color #darkgreen +2 }
				 c^\markup { 4 }
				 e^\markup { 5 }_\markup { -14 }
				 \clef "treble" g^\markup { 6 }_\markup { +2 }
				 \once \override NoteHead.color = #red \once \override Accidental.color = #red b^\markup { \with-color #red 7 }_\markup { \with-color #red -31 }
				 c^\markup { 8 }
				 d^\markup { 9 }_\markup { +4 } e^\markup { 10 }_\markup { -14 }  }
							}
		 >>
}

\markup \vspace #3.5

\score {
		<< \new Staff \with { instrumentName= \markup {
												        \column { "Zugpositionen" 
												         \line { "(Beispiel)" }
												    }
												}
							  \remove "Time_signature_engraver" 
							    }
			\transpose c b, {
			\relative g {
			\omit Stem
			\clef "bass"
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			\once \override NoteHead.color = #darkgreen 			g1*1/8^\markup { \center-column {  "(1. Zugposition)" 
									   \line \with-color #darkgreen { "3" }
									  }
							}
 			fis4*1/2^\markup { 2. Zugposition }
			f^\markup { 3. Zugposition }
			e^\markup { 4. Zugposition }
			es^\markup { 5. Zugposition }
			d^\markup { 6. Zugposition }
			cis^\markup { 7. Zugposition } 
			\once \override NoteHead.color = #darkgreen
			\once \override Accidental.color = #darkgreen \parenthesize c1*1/8^\markup { \center-column {  "(1. Zugposition)" 
									   \line \with-color #darkgreen { "3" }
									  }
							} 
			}
	}
		>>
}

\markup \vspace #7.7

\score { 
			
		<< \new Staff \with { instrumentName= \markup { \column { "alle Töne/"
												          \line { "Zugpositionen" }
												        }
												}
												\remove "Time_signature_engraver"
											}
			\transpose c b, {
			\relative c, {
			\time 12/8
			\omit Stem
			\clef "bass"
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black 
			\once \override TextScript.self-alignment-X = #LEFT
    		\once \override TextScript.parent-alignment-X = #LEFT			c1*1/8^\markup { 1 (Pedaltöne) }
			h4*1/2 b a as g fis
			\override NoteHead.font-size = #-3
			\override Accidental.font-size = #-3
			\override NoteHead.color = #(x11-color 'SkyBlue)
			\override Accidental.color = #(x11-color 'SkyBlue)			f^\markup { \column \with-color #(x11-color 'SkyBlue) { "(F-Pedaltöne"
												     \line { "eher mit" }
												     \line { "Baßposaune)" }
												     }
					   }
			e es d
			\once \override NoteHead.color = #(x11-color 'salmon) 
			\once \override Accidental.color = #(x11-color 'salmon)
			cis^\markup { \column \with-color #(x11-color 'salmon) { "(unsichere"
												     \line { "Intonation)" }
												     }
						 }
			
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			\override NoteHead.font-size = #1
			\override Accidental.font-size = #1
			\once \override NoteHead.color = #darkgreen
			\once \override Accidental.color = #darkgreen 			c''1*1/8^\markup { \with-color #darkgreen 2 } 			h4*1/2 b a as g fis 
			\override NoteHead.color = #(x11-color 'CornflowerBlue)
			\override Accidental.color = #(x11-color 'CornflowerBlue)
			f^\markup { \with-color #(x11-color 'CornflowerBlue) \column { "Töne mit Quart-" 
												  \line { "ventil erreichbar" } 
												        }
												  }
			e dis d
			\once \override NoteHead.color = #(x11-color 'salmon) 
			\once \override Accidental.color = #(x11-color 'salmon)
			cis^\markup { \column \with-color #(x11-color 'salmon) { "(unsichere"
												     \line { "Intonation)" }
												     }
						 }
			\time 7/8
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			\once \override NoteHead.color = #darkgreen
			\once \override Accidental.color = #darkgreen 			g''1*1/8^\markup { \with-color #darkgreen 3 } 			fis4*1/2 f e es d cis 
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black 			c'1*1/8^\markup { 4 } h4*1/2 b a as g fis \bar ""
			\break
			\once \override NoteHead.color = #black
			e'1*1/8^\markup { 5 } es4*1/2 d cis c h b 
			\clef "treble"
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black 			g'1*1/8^\markup { 6 } fis4*1/2 f e es d cis 
			\once \override NoteHead.color = #black

			\once \override NoteHead.color = #red 
			\once \override Accidental.color = #red
			b'1*1/8^\markup { \with-color #red 7 } 
			\override NoteHead.color = #(x11-color 'MediumVioletRed)
			\override Accidental.color = #(x11-color 'MediumVioletRed)
			a4*1/2 as g fis f e 

			
			\override NoteHead.color = #blue
			\override Accidental.color = #blue
			\once \override NoteHead.color = #black
			\once \override Accidental.color = #black 			c'1*1/8^\markup { 8 } h4*1/2 b a as g fis 
			\once \override NoteHead.color = #black 			d'1*1/8^\markup { 9 } cis4*1/2 c h b a as 
			\once \override NoteHead.color = #black 			e'1*1/8^\markup { 10 } es4*1/2 d cis c h b 
			}
		}
		>>
}


\version "2.20.0"  % necessary for upgrading to future LilyPond versions
