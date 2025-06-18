\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 3 in) (* 18
 in))) paper-alist))

\paper { tagline = ##f
 #(set-paper-size "mein Format")
 top-margin = 8
 system-system-spacing.basic-distance = #12
 oddHeaderMarkup = \markup \null
 evenHeaderMarkup = \markup \null
}

\layout {
 indent = #40
 line-width = #60
 \context {
  \Score
   \remove "Bar_number_engraver"
 }
 \context {
  \Staff
   \remove "Time_signature_engraver"
	\remove "Bar_engraver"
	}
}

C-Alto = { c'1 }

	\new Staff = "C-Alto" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Hoch C }
							 \line {
							   \with-color #grey { \italic "C/Ut/Do alto" }
							  }
						}
					} 
				}
		{ \C-Alto
	}
	\new Staff = "H-Alto" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Hoch H }
							 \line {
							   \with-color #grey { \italic "B-natural alto/" }
							}
							 \line {
							   \with-color #grey { \italic "Si alto" }
							  }
						}
					} 
				}
		{  \transpose c h, { \C-Alto }
	}
	\new Staff = "B-Alto" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Hoch B }
							 \line {
							   \with-color #grey { \italic "B-flat alto/" }
							}
							 \line {
							   \with-color #grey { \italic "Si bémol alto/" }
							}
							 \line {
							   \with-color #grey { \italic "Si bemolle alto" }
							}
						}
					} 
				}
		{  \transpose c b, { \C-Alto }
	}
	\new Staff = "A-Alto" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Hoch A }
							 \line {
							   \with-color #grey { \italic "A alto" }
							}
							 \line {
							   \with-color #grey { \italic "La alto" }
							}
						}
					} 
				}
		{  \transpose c a, { \C-Alto }
	}
	\new Staff = "As" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ As }
							 \line {
							   \with-color #grey { \italic "A-flat/" }
							}
							 \line {
							   \with-color #grey { \italic "La bémol/" }
							}
							 \line {
							   \with-color #grey { \italic "La bemolle" }
							}
						}
					} 
				}
		{  \transpose c as, { \C-Alto }
	}
	\new Staff = "G" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ G }
							 \line {
							   \with-color #grey { \italic "Sol" }
							}
						}
					} 
				}
		{  \transpose c g, { \C-Alto }
	}
	\new Staff = "Fis" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Fis }
							 \line {
							   \with-color #grey { \italic "F-sharp/" }
							}
							 \line {
							   \with-color #grey { \italic "Fa diése/" }
							}
							 \line {
							   \with-color #grey { \italic "Fa diesis" }
							}
						}
					} 
				}
		{  \transpose c fis, { \clef "bass" \C-Alto }
	}
	\new Staff = "F" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ F }
							 \line {
							   \with-color #grey { \italic "Fa" }
							}
						}
					} 
				}
		{  \transpose c f, { \clef "bass" \C-Alto }
	}
	\new Staff = "E" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ E }
							 \line {
							   \with-color #grey { \italic "Mi" }
							}
						}
					} 
				}
		{  \transpose c e, { \clef "bass" \C-Alto }
	}
	\new Staff = "Es" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Es }
							 \line {
							   \with-color #grey { \italic "E-flat/" }
							}
							 \line {
							   \with-color #grey { \italic "Mi bémol/" }
							}
							 \line {
							   \with-color #grey { \italic "Mi bemolle" }
							}
						}
					} 
				}
		{  \transpose c es, { \clef "bass" \C-Alto }
	}
	\new Staff = "D" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ D }
							 \line {
							   \with-color #grey { \italic "Re" }
							}
						}
					} 
				}
		{  \transpose c d, { \clef "bass" \C-Alto }
	}
	\new Staff = "Des" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Des }
							 \line {
							   \with-color #grey { \italic "D-flat/" }
							}
							 \line {
							   \with-color #grey { \italic "Re bémol/" }
							}
							 \line {
							   \with-color #grey { \italic "Re bemolle" }
							}
						}
					} 
				}
		{  \transpose c des, { \clef "bass" \C-Alto }
	}

	\new Staff = "C-basso" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Tief C }
							 \line {
							   \with-color #grey { \italic "C/Ut/Do basso" }
							  }
						}
					} 
				}
		{  \transpose c c, {  \clef "bass" \C-Alto }
	}
	\new Staff = "H-basso" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Tief H }
							 \line {
							   \with-color #grey { \italic "B-natural basso/" }
							}
							 \line {
							   \with-color #grey { \italic "Si basso" }
							  }
						}
					} 
				}
		{  \transpose c h,, { \clef "bass" \C-Alto }
	}
	\new Staff = "B-basso" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Tief B }
							 \line {
							   \with-color #grey { \italic "B-flat basso/" }
							}
							 \line {
							   \with-color #grey { \italic "Si bémol basso/" }
							}
							 \line {
							   \with-color #grey { \italic "Si bemolle basso" }
							}
						}
					} 
				}
		{  \transpose c b,, { \clef "bass" \C-Alto }
	}
	\new Staff = "A-basso" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Tief A }
							 \line {
							   \with-color #grey { \italic "A basso" }
							}
							 \line {
							   \with-color #grey { \italic "La basso" }
							}
						}
					} 
				}
		{  \transpose c a,, { \clef "bass" \C-Alto }
	}
	\new Staff = "As" \with { instrumentName = 
						   \markup { 
							\center-column {
							 \line	{ Tief As }
							 \line {
							   \with-color #grey { \italic "A-flat basso/" }
							}
							 \line {
							   \with-color #grey { \italic "La bémol basso/" }
							}
							 \line {
							   \with-color #grey { \italic "La bemolle basso" }
							}
						}
					} 
				}
		{  \transpose c as,, { \clef "bass" \C-Alto }
	}






\version "2.20.0"  % necessary for upgrading to future LilyPond versions



