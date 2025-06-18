\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 24 in) (* 13
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #0
system-separator-markup = \bigSeparator 
}

\layout {
 \context {
  \Score
   \remove "Bar_number_engraver"
	\overrideTimeSignatureSettings
	2/2
	1/4
	1,1,1,1
	#'()
	\overrideTimeSignatureSettings
	9/4
	1/4
	1,1,1,1,1,1,1,1,1
	#'()

	}
}
global = {
	\tempo \markup { \fontsize #3 "(sehr rasch)" }
	 \accidentalStyle dodecaphonic-first
	  \time 2/2
}

% ///////////////

trioleauf = \relative { \tuplet 3/2 { b8 d, b' } }
trioleaufchromatisch = \relative { \tuplet 3/2 { b8 d, b' } h4 }
trioleaufganzton = \relative { \tuplet 3/2 { b8 d, b' } c4 }

trioleab = \inversion ges ges \trioleauf
trioleabchromatisch = \inversion g g \trioleaufchromatisch
trioleabganzton = \inversion g g \trioleaufganzton

DKlarFloskel = { \tuplet 3/2 { e,8 gis, e' } | f4 \tuplet 3/2 { fis8 ais, fis' } g4 \tuplet 3/2 { gis8 his, gis' } | }

BKlarFloskel = { e,4 | \tuplet 3/2 { f8 a, f' } fis4 \tuplet 3/2 { g8 h, g' } gis4 | }

BassAbschnittI = \relative e, { \tuplet 3/2 { r8 e\fff a } \tuplet 3/2 { d g c } f2 | \tuplet 3/2 { r8 e,, a } \tuplet 3/2 { d g c } f4~ \tuplet 3/2 { f8 e,,\fff a } | \time 9/4 \tempo \markup { 
					\concat {
						( { \char ##x2009 }
						\smaller \general-align #Y #DOWN \note #"2." #1
						" = "
						\smaller \general-align #Y #DOWN \note #"2" #1
						{ \char ##x2009 } )
					}
				}
d4 g c f r r r2 r4 \bar "||" }

BassAbschnittII = \relative e, { \time 2/2 \tuplet 3/2 { r8 e\ff( a } \tuplet 3/2 { d g c } f) r r4 | \tuplet 3/2 { r8 f( c } \tuplet 3/2 { g d a } e) r r4 | \tuplet 3/2 { r f''-> c-> } \tuplet 3/2 { g-> d-> a-> } \mark "rit." r  e2.\sf }

StreicherBassAbschnitt = \relative ges' { ges4->\fff | des-> as-> es-> b8.-> f16-> | f4-> r r ges''-> | c,-> as-> d,-> b8.-> e,16-> | e4-> r r f''->\< | c-> g-> d-> a8.-> e16-> | e4->\! r r2 }

% //////////////

Floete = \relative c'' {
\set Staff.instrumentName = "Fl."
 \clef "treble"
   \key c \major
	r2 <<  { s2\f }  \\ { \transpose e c''' \relative \trioleabganzton } >> \transpose e gis'' \trioleabganzton \transpose e e'' \relative \trioleabganzton | r2 r4 <<  { s2\f }  \\ { \transpose b as'' \relative \trioleaufchromatisch } >> { \transpose b h'' \relative \trioleauf } c'4 \tuplet 3/2 { cis8 f, cis' } d4 r4 r << { s4\< | s1 | s4\! } \\ { \transpose b b'' \relative \trioleaufchromatisch \transpose b c''' \relative \trioleaufchromatisch \transpose b d''' \relative \trioleauf | es4 } >> r4 r << { s4\ff | s4 } \\ { \transpose b es''' \relative \trioleaufchromatisch } >> \transpose b f''' \relative \trioleaufchromatisch \tuplet 3/2 { g8-> h, g' } | \repeat unfold 2 { r4 \tuplet 3/2 { c,8 f c } \tuplet 3/2 { g8 c g } \tuplet 3/2 { d8 g d } } |

\time 9/4 \tempo \markup { 
					\concat {
						( { \char ##x2009 }
						\smaller \general-align #Y #DOWN \note #"2." #1
						" = "
						\smaller \general-align #Y #DOWN \note #"2" #1
						{ \char ##x2009 } )
					}
				}
\tuplet 3/2 { c'8 f c } \tuplet 3/2 { g8 c g } \tuplet 3/2 { d8 g d } a4 r r r2 r4 | \time 2/2 r2 r4 f''8.( ges16 | f8. a16) r4 r c,8.( des16 | c8. e16) r4 r g,8.( as16 \mark "rit." g8. h16) r4 r2 \bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 R1. | << { f,1.->\fp } \\ { s4. s2\< s16 s2\> s16\! } >>
    \bar "" 
}

Oboe = \relative c'' {
\set Staff.instrumentName = "Ob."
 \clef "treble"
   \key c \major
	R1 | << { \transpose b b' \relative \trioleaufganzton }  \\  { s2\f } >> \transpose b d'' \trioleaufganzton | r2 r4  c\f | \transpose b des'' \relative \trioleaufganzton \tuplet 3/2 { e8 gis, e'} f4 | \transpose b ges'' \relative \trioleaufganzton r d4\< | \transpose cis ais' \relative \trioleabchromatisch \transpose cis gis' \trioleabchromatisch | a4\! r r g'\ff | \tuplet 3/2 { b,8 ges' b, } a4 \tuplet 3/2 { as8 e' gis, } g4 |

\tuplet 3/2 { g8 d g } \tuplet 3/2 { c8 g c } r4 \tuplet 3/2 { g8 d g } | \tuplet 3/2 { c8 g c } \tuplet 3/2 { f8 c f } r4 \tuplet 3/2 { g,8 d g } | \time 9/4 \tempo \markup { 
					\concat {
						( { \char ##x2009 }
						\smaller \general-align #Y #DOWN \note #"2." #1
						" = "
						\smaller \general-align #Y #DOWN \note #"2" #1
						{ \char ##x2009 } )
					}
				}
 \tuplet 3/2 { g8 d g } \tuplet 3/2 { c8 g c } \tuplet 3/2 { f c f } c4 r r r2 r4 | \time 2/2 r4 \tuplet 3/2 { c8 f, f' } h2~ | h1~ | h4 \tuplet 3/2 { c8 f f, } h,2~( \mark "rit." h4 a)\sf r2 \bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 R1. | << { as'1.->\pp } \\ { s4. s2\< s16 s2\> s16\! } >>
    \bar "" 
}

EnglHn = \relative a' {
\set Staff.instrumentName = \markup \left-column { Engl. \line { Hn. } }
 \clef "treble"
   \key c \major
	R1 | \tuplet 3/2 { a8\f cis, a' } h4 \tuplet 3/2 { cis8 f, cis' } dis4 | r2 r4  h\f | \transpose b c'' \relative \trioleaufganzton \transpose b es'' \relative \trioleaufchromatisch | \transpose b f'' \relative \trioleaufganzton r << { s4\< | s1 | s4\! } \\ { \tuplet 3/2 { f'8 des' f, } | e4 \transpose e dis'' \relative \trioleabchromatisch \transpose e cis'' \trioleabchromatisch } >> r r \tuplet 3/2 { b8\ff ges' b, } | a4 \tuplet 3/2 { as8 e' as, } g4 \tuplet 3/2 { fis8 d' fis, } |

\transpose g a' \relative { \tuplet 3/2 { g8 d g } \tuplet 3/2 { c8 g c } r4 \tuplet 3/2 { g8 d g } | \tuplet 3/2 { c8 g c } \tuplet 3/2 { f8 c f } r4 \tuplet 3/2 { g,8 d g } | \time 9/4 \tempo \markup { 
					\concat {
						( { \char ##x2009 }
						\smaller \general-align #Y #DOWN \note #"2." #1
						" = "
						\smaller \general-align #Y #DOWN \note #"2" #1
						{ \char ##x2009 } )
					}
				}
 \tuplet 3/2 { g8 d g } \tuplet 3/2 { c8 g c } \tuplet 3/2 { f c f } c4 } r r r2 r4 | \time 2/2 r4 \transpose c g' \relative { \tuplet 3/2 { c8 f, f' } h2~ | h1~ | h4 \tuplet 3/2 { c8 f f, } h2~( \mark "rit." h4 a)\sf r2 }\bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 R1. | << { d1.->\pp } \\ { s4. s2\< s16 s2\> s16\! } >>
    \bar "" 
}

DClar = \relative fis' {
\set Staff.instrumentName = \markup \left-column { Klar. \line { in D } }
 \clef "treble"
  \key b \major
	r2 <<  { s2\f }  \\ { \transpose e e'' \relative \trioleabganzton } >> \transpose e d'' \trioleabganzton \transpose e c'' \relative \trioleabganzton | r2 r4 dis\f( | gis cis fis h8. e16) | e4 r4 r << { s4\< | s1 | s4\! } \\ { \DKlarFloskel a4 } >> r r4 << { s4\ff | s1 | } \\ { \transpose e a''' \relative \DKlarFloskel } >> | \repeat unfold 2 { r4 \tuplet 3/2 { f8 h f } \tuplet 3/2 { c8 f c } \tuplet 3/2 { g8 c g } } |

\time 9/4 \tempo \markup { 
					\concat {
						( { \char ##x2009 }
						\smaller \general-align #Y #DOWN \note #"2." #1
						" = "
						\smaller \general-align #Y #DOWN \note #"2" #1
						{ \char ##x2009 } )
					}
				}
 \tuplet 3/2 { f'8 h f } \tuplet 3/2 { c8 f c } \tuplet 3/2 { g8 c g } c,4 r r r2 r4 | \time 2/2 \transpose c b \relative { r4 \tuplet 3/2 { c'8 f, f' } h2~ | h1~ | h4 \tuplet 3/2 { c8 f f, } h,2~( \mark "rit." h4 a)\sf r2 \bar "||" } \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 R1. | << { cis1.->\pp } \\ { s4. s2\< s16 s2\> s16\! } >>
    \bar ""
}

BClar = \relative fis' {
\set Staff.instrumentName = \markup \left-column { Klar. \line { in B } } \clef "treble"
  \key d \major
	r2 <<  { s2\f }  \\ { \transpose e e'' \relative \trioleabganzton } >> \transpose e d'' \trioleabganzton \transpose e c'' \relative \trioleabganzton | r2 r4 g,\f( | c f b es8. as16) | as4 r4 r << { s4\< | s1 | s4\! } \\ { \transpose e e''' \relative \BKlarFloskel a4 } >> r r4 << { s4\ff | s1 | } \\ { \transpose e a''' \relative \BKlarFloskel } >> | \repeat unfold 2 { r4 \tuplet 3/2 { e'8 a e } \tuplet 3/2 { h8 e h } \tuplet 3/2 { fis8 h fis } } |
\time 9/4 \tempo \markup { 
					\concat {
						( { \char ##x2009 }
						\smaller \general-align #Y #DOWN \note #"2." #1
						" = "
						\smaller \general-align #Y #DOWN \note #"2" #1
						{ \char ##x2009 } )
					}
				}
 \tuplet 3/2 { e'8 a e } \tuplet 3/2 { h8 e h } \tuplet 3/2 { fis8 h fis } e'4 r r r2 r4 | \time 2/2 \transpose c d \relative { r2 r4 f''8.( ges16 | f8. as16) r4 r c,8.( des16 | c8. e16) r4 r g,8.( as16 \mark "rit." g8. h16) r4 r2 \bar "||" } \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 R1. | << { d,1.->\pp } \\ { s4. s2\< s16 s2\> s16\! } >>
    \bar ""
}

BassClar = \relative e {
\set Staff.instrumentName = \markup \left-column { Baßkl. \line { in B } }
 \clef "bass"
  \transposition b
   \key d \major
	e4(\< fis as  b | c2.\!) \tuplet 3/2 { d,8\f fis, d' } | es4 \tuplet 3/2 { e8 gis, e' } f4 \tuplet 3/2 { fis8 b, fis' } | g4 r r \tuplet 3/2 { dis8 g, dis' } | e4 \tuplet 3/2 { fis!8 b, fis' } as4 \tuplet 3/2 { b8 d, b' } | h4 r r \tuplet 3/2 { e,8\< gis, e' } | f4 \tuplet 3/2 { g8 h, g' } as4 \tuplet 3/2 { a8 cis, a' } | b4\! r r2 | \transpose e, fis, \relative { \BassAbschnittI \BassAbschnittII } \bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 R1. | R1.^\markup "in A" \bar ""
}

Fag = \relative e {
\set Staff.instrumentName = "Fag."
 \clef "bass"
   \key c \major
	b4(\< c d  e | fis2.\!) \tuplet 3/2 { gis,8\f c, as' } | \tuplet 3/2 { a8 cis, a' } b4 \tuplet 3/2 { h8 es, h' } c4 | \tuplet 3/2 { cis8 eis, cis' } dis4 r a | \tuplet 3/2 { b8 d, b' } c4 \tuplet 3/2 { d8 fis, d' }    e4 | \tuplet 3/2 { f8 a, f' } fis4 r b,\< | \tuplet 3/2 { ces8 es, ces' } des4 \tuplet 3/2 { d8 fis, d' } es4 | \tuplet 3/2 { e8 gis, e' } f4\! r2 | { \BassAbschnittI \BassAbschnittII } \bar "||" \time 6/4 R1. | \clef "tenor" << { b'1.->\pp } \\ { s4. s2\< s16 s2\> s16\! } >> \bar ""
}

KFag = \relative e {
\set Staff.instrumentName = \markup \left-column { Ktr.- \line { fag. } }
 \clef "bass"
   \key c \major
	\transpose e fis \relative { e4(\< fis as  b | c2.\!) \tuplet 3/2 { d,8\f fis, d' } | es4 } \tuplet 3/2 { fis8 b, fis' } g4 \tuplet 3/2 { as8 c, as' } | a4  r r \tuplet 3/2 { f8 a, f' } | ges4 \tuplet 3/2 { as8 c, as' } b4 \tuplet 3/2 { c8 e, c' } | cis4 r r \tuplet 3/2 { ges8\< b, ges' } | g4 \tuplet 3/2 { a8 cis, a' } b4 \tuplet 3/2 { h8 dis, h' } | c4\! r r2|{ \BassAbschnittI \BassAbschnittII } \bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 R1. | \clef "tenor" << { g'1.->\pp } \\ { s4. s2\< s16 s2\> s16\! } >> \bar ""
}

HornI = \relative f'' {
 \clef "treble"
  \transposition f
   \key c \major
	\partcombineApart r2^\markup "1. gedämpft" \tuplet 3/2 { r8 f\p es } \tuplet 3/2 { cis h a } | g8. f16 es8 r \tuplet 3/2 { r g'\f f } \tuplet 3/2 { es des h } | \partcombineChords \tuplet 3/2 { fis' e d } cis r r4 \tuplet 3/2 { a8 f' a, } | gis4 \tuplet 3/2 { fis8 d' fis, } f4 \tuplet 3/2 { e8 c' e, } | dis4 r^\markup "1. offen" r \clef "bass" h,\ff-> | e-> a-> \clef "treble" d'-> g8.-> c16-> | c2-> r4 c\fff-> | g-> d-> a-> \clef "bass" e,8.-> h16-> | h1~-> | \tuplet 3/2 { h4 e\fff \clef "treble" a' } \tuplet 3/2 { d g c } |
\time 9/4 \tempo \markup { 
					\concat {
						( { \char ##x2009 }
						\smaller \general-align #Y #DOWN \note #"2." #1
						" = "
						\smaller \general-align #Y #DOWN \note #"2" #1
						{ \char ##x2009 } )
					}
				}
g2.~ g4 r r r2 r4 |\time 2/2 R1*2 | \partcombineApart r2 fis2~\ff | fis4 e r2 \bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 \partcombineAutomatic R1. | R1. \bar "" 
}

HornII = \relative h {
 \clef "treble"
  \transposition f
   \key c \major
	\partcombineApart \tuplet 3/2 { r8 h\p cis } \tuplet 3/2 { es f g } a8. h16 cis8 r |\tuplet 3/2 { r f,,\p g } \tuplet 3/2 { a h cis } es8. f16 g8 r | \partcombineChords \tuplet 3/2 { fis e d } cis r r4 \transpose a f' \relative { \tuplet 3/2 { a8 f' a, } | gis4 \tuplet 3/2 { fis8 d' fis, } f4 \tuplet 3/2 { e8 c' e, } | dis4 } r r \clef "bass" h,,\ff-> | e-> a-> \clef "treble" d'-> g8.-> c16-> | c2-> r4 c\fff-> | g-> d-> a-> \clef "bass" e,8.-> h16-> | h1~-> | \tuplet 3/2 { h4 e\fff \clef "treble" a' } \tuplet 3/2 { d g c } |
\time 9/4 \tempo \markup { 
					\concat {
						( { \char ##x2009 }
						\smaller \general-align #Y #DOWN \note #"2." #1
						" = "
						\smaller \general-align #Y #DOWN \note #"2" #1
						{ \char ##x2009 } )
					}
				}
d2.~ d4 r r r2 r4 | \time 2/2 R1*2 | \partcombineApart R1 | r4 e,\f r2 \bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 \partcombineAutomatic R1. | R1. \bar "" 
}

ViolinI = \relative as' {
\set Staff.instrumentName = "I. Viol."
 \clef "treble"
  \key c \major
   r4 \tuplet 3/2 { as8\f c, as' } b4 \tuplet 3/2 { c8 e, c' } | d4 \tuplet 3/2 { e8 gis, e'} fis4 \tuplet 3/2 { fis8\f d' fis, } | f4 \tuplet 3/2 { e8 c' e, } es4 \tuplet 3/2 { d8 b' d, } cis4 r r  \tuplet 3/2 { a'8 f' a, } | gis4 \tuplet 3/2 { fis8 d' fis, } e4 \tuplet 3/2 { d8 b' d, } cis4 r r \tuplet 3/2 { d'8\< b' d, } | cis4 \tuplet 3/2 { h8 g' h, } b4 \tuplet 3/2 { a8 f' a, } | gis4\! r \tuplet 3/2 { r8 e,\fff a } \tuplet 3/2 { d g c } | \repeat unfold 2 { f2~-> \tuplet 3/2 { f8 c g } \tuplet 3/2 { d a e } } |
\time 9/4 \tempo \markup { 
					\concat {
						( { \char ##x2009 }
						\smaller \general-align #Y #DOWN \note #"2." #1
						" = "
						\smaller \general-align #Y #DOWN \note #"2" #1
						{ \char ##x2009 } )
					}
				}
f''2.~\fff f4 c g d a e | \time 2/2 f1~->^\markup "G-Saite" | f4 f2\downbow f4\downbow | f1~\downbow | \tuplet 3/2 { f4 f-> f-> } \tuplet 3/2 { f-> f-> f-> } \bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
 \time 6/4 | f\pp r r r2 r4 | R1. \bar ""
  }

ViolinII = \relative fis' {
\set Staff.instrumentName = "II. Viol."
 \clef "treble"
  \key c \major
   R1 | r4 \tuplet 3/2 { fis8 d' fis,} e4 \tuplet 3/2 { d8\f b' d, } | \tuplet 3/2 { a'8 f' a, } as4 \tuplet 3/2 { g8 es' g, } ges4 | \tuplet 3/2 { f8 des' f, } e4 r2 | \tuplet 3/2 { c'8 as' c, } b4 \tuplet 3/2 { as8 e' as, } fis4 | \tuplet 3/2 { f8 cis' f, } e4 r2 | \tuplet 3/2 { f'8\< des' f, } es4 \tuplet 3/2 { d8 b' d, } cis4 | \tuplet 3/2 { c8\! as' c, } h4 \tuplet 3/2 { r8 e,:16\fff a:16 } \tuplet 3/2 { d:16 g:16 c:16 } | \repeat unfold 2 { f2~-> \tuplet 3/2 { f8:16 c:16 g:16 } \tuplet 3/2 { d:16 a:16 e:16 } } |
\time 9/4 \tempo \markup { 
					\concat {
						( { \char ##x2009 }
						\smaller \general-align #Y #DOWN \note #"2." #1
						" = "
						\smaller \general-align #Y #DOWN \note #"2" #1
						{ \char ##x2009 } )
					}
				}
f''2.~\fff f4 c:16 g:16 d:16 a:16 e:16 | \time 2/2 c1~-> | c4 c2\downbow c4\downbow | c1~\downbow | \tuplet 3/2 { c4 c-> c-> } \tuplet 3/2 { c-> c-> c-> } \bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 | c\pp r r r2 r4 | R1. \bar ""
  }

Bratsche = \relative fis {
\set Staff.instrumentName = "Br." 
 \clef "alto"
  \key c \major
   fis8. e16 d4 r \tuplet 3/2 { fis'8\f d' fis, } | e4 \tuplet 3/2 { d8 b' d, } c4 \tuplet 3/2 { b8\mf ges' b, } | \tuplet 3/2 { cis8 a' cis, } c4 \tuplet 3/2 { h8 h' h, } b4 | \tuplet 3/2 { a8 f' a, } gis4 r2 | \tuplet 3/2 { e'8 c' e, } d4 \tuplet 3/2 { c8 as' c, } b4 | a r r2 | \clef "treble" \tuplet 3/2 { a'8\< f' a, } g4 \tuplet 3/2 { fis8 d' fis, } f4 | e\! r4 \clef "alto" \tuplet 3/2 { r8 e,:16\fff a:16 } \tuplet 3/2 { d:16 g:16 c:16 } | \repeat unfold 2 { f2~-> \tuplet 3/2 { f8:16 c:16 g:16 } \tuplet 3/2 { d:16 a:16 e:16 } } |
\time 9/4 \tempo \markup { 
					\concat {
						( { \char ##x2009 }
						\smaller \general-align #Y #DOWN \note #"2." #1
						" = "
						\smaller \general-align #Y #DOWN \note #"2" #1
						{ \char ##x2009 } )
					}
				}
f''2.~\fff f4 c:16 g:16 d:16 a:16 e:16 | \time 2/2 <g d>1~-> | <g d>4 <g d>2\downbow <g d>4\downbow | <g d>1~\downbow | \tuplet 3/2 { <g d>4 <g d>-> <g d>-> } \tuplet 3/2 { <g d>-> <g d>-> <g d>-> } \bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 | <g d>\pp r r r <f\harmonic c> <b\harmonic f> | R1. \bar ""
  } 

Cello = \relative d {
\set Staff.instrumentName = "Vlc."
 \clef "bass"
  \key c \major
   d4 \tuplet 3/2 { e8 gis, e' } fis4 \tuplet 3/2 { as8 c, as' } | b8. c16 d2 \StreicherBassAbschnitt \BassAbschnittI \time 2/2 <a, e>1~-> | <a e>4 <a e>2\downbow <a e>4\downbow | <a e>1~\downbow | \tuplet 3/2 { <a e>4 <a e>-> <a e>-> } \tuplet 3/2 { <a e>-> <a e>-> <a e>-> } \bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 | <a e>\pp r r r2 r4 | R1. \bar ""}

Contrabass = \relative as, {
\set Staff.instrumentName =  "Kb." 
 \clef "bass"
  \key c \major
   R1 | r2 r4 \StreicherBassAbschnitt \BassAbschnittI \time 2/2 e1~-> | c4 e2\downbow e4\downbow | e1~\downbow | e4 r r2 \bar "||" \tempo \markup { \center-column {
								 \line { \fontsize #3 { viel langsamer } }
								 \line { \normal-text \italic { (langsame Viertel) } }
								}
							}
\time 6/4 | \ottava #1 { e''4^\flageolet_\markup { \dynamic pp "Flag." } a^\flageolet d\flageolet g\flageolet } r2 | R1. \bar ""
}

\score {
   \new GrandStaff

  <<
	\new StaffGroup \with {
	\override VerticalAxisGroup.staff-staff-spacing.basic-distance = #5 }
	<<		    
	\new Staff = "Floete" {
		 \global
		  \Floete
		}
		\new GrandStaff	
    	<<
			\new Staff = "Oboe" {
		 	 \global
		 	 \Oboe
			}
    
			\new Staff = "EnglHn"	 {
		 	 \global
		  	 \EnglHn
			}
		>>
		\new GrandStaff \with {
	\override VerticalAxisGroup.staff-staff-spacing.basic-distance = #5 }
	
		<<	    
			\new Staff = "DClar" {
		 	 \global
		  	  \DClar
			}
		    
			\new Staff = "BClar" {
			 \global
		 	  \BClar
			}
		    
			\new Staff = "BassClar" {
			 \global
		 	  \BassClar
			}
		>>

	\new GrandStaff \with {
	\override VerticalAxisGroup.staff-staff-spacing.basic-distance = #5 }

		<<
		    
			\new Staff = "Fag" {
		 	\global
		  	\Fag
			}
		    
			\new Staff = "KFag" \with {
	\override VerticalAxisGroup.staff-staff-spacing.basic-distance = #6 } {
		 	 \global
		  	  \KFag
			}
		>>
	>>
	
	\new StaffGroup \with {
	\override VerticalAxisGroup.staff-staff-spacing.basic-distance = #6 }
	<<		    
	\new Staff = "1. 2. Horn in F" \with { instrumentName =  \markup \left-column { \line { Hn. I. II } \line { in F } } } {
		 \global
		  \partcombine \HornI \HornII
		}

	>>

	\new StaffGroup  \with {
	\override VerticalAxisGroup.staff-staff-spacing.basic-distance = #5 }

	<<
		\new GrandStaff \with {
		\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5 }
		<<
    	\new Staff = "ViolinI" {
		 \global
		  \ViolinI
		}

    	\new Staff = "ViolinII" {
		 \global
		  \ViolinII
		}
		>>
	 
	\new Staff = "Bratsche" {
		 \global
		  \Bratsche
		}
	 
	\new Staff = "Cello" {
		 \global
		  \Cello
		}
	 
	\new Staff = "Ctrb" {
		 \global
		  \Contrabass
		}
  >>
>>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



