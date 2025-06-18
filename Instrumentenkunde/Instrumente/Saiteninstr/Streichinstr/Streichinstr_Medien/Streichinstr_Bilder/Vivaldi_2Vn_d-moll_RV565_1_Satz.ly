\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 24 in) (* 12
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #30
system-separator-markup = \bigSeparator 
}

\layout {
 \context {
  \Score
	}
}
global = {
	\tempo "Allegro"
	 \time 3/4
	  \key d \minor
}

vnI = \relative d' {
\override Staff.InstrumentName.self-alignment-X = #RIGHT
\set Staff.instrumentName = \markup { "I" \super "o      " }
 \clef "treble"
   r8 d_\markup { "(" \dynamic f ")" } f a d d, | d f a d f d, | d a' d f a d,, | d d' f a d d,, | d a'' d d,, d a'' | d a d c16 b a g f e | d8 d, d d d a' | d a d c16 b a g f e | d8 d d d d d | d16 d f e d f e d a' cis h a | d8 d, d d d d | d16 a' cis h a cis h a d f e d | a'8 d,, d d d d | d16 d' f e d f e d a' cis h a | d8 d,, d d d d | d16 a'' g a f g e f d a h cis | d8 d, d d d d | d16 a' h cis d a h cis d f, g a | d,8 d d d d d | d4 r4 r4 | R2.*10 | R2.^\fermataMarkup \bar "|."
  } 

vnII = \relative d' {
\override Staff.InstrumentName.self-alignment-X = #RIGHT
 \set Staff.instrumentName = \markup { \right-column { "II" } \super "o      "  }
 \clef "treble"
  r4 r8 d_\markup { "(" \dynamic f ")" } f a | d d, d f a d | f d,  d a' d f | a d,, d d' f a | d d,, d a'' d d,, | d d d d d a'' | d a d c16 b a g f e | d8 d, d d d a' | d a d c16 b a g f e | d8 d d d d d | d16 d f e d f e d a' cis h a | d8 d, d d d d | d16 a' cis h a cis h a d f e d | a'8 d,, d d d d | d16 d' f e d f e d a' cis h a | d8 d,, d d d d | d16 a'' g a f g e f d a h cis | d8 d, d d d d | d16 a' h cis d a h cis d f, g a | d,4 r4 r4 | R2.*10 | R2.^\fermataMarkup \bar "|."
  }

vcConc = \relative d' {
\set Staff.instrumentName = \markup {
			\center-column { Violoncello
			\line { concertante } }
			} 
 \clef "bass"
R2.*19 | r16 d_\markup { "(" \dynamic f ")" } c d a d c d a c b a | b g f g d g f g d f e d | e c' b c g c b c g b a g | a f e f c f e f c e d c | d b' a b f b a b f g a b | g b a b g c b c g a b c | a c b c a d c d a h c d | h e d e h e d e h cis d e | cis8 a d f, a, cis' | d a d c16 b a g f e | d8 a d c16 b a g f e | d2.\fermata \bar "|."
}

vcRip = \relative d {
\set Staff.instrumentName = "Continuo"
 \clef "bass"
  R2.*19 | d8_\markup { "(" \dynamic f ")" }^"(1 Solo)" \repeat unfold 5 { d } | \repeat unfold 6 { g, } | \repeat unfold 6 { c } |  \repeat unfold 6 { f, } |  \repeat unfold 4 { b }  d d | \repeat unfold 6 { e } | f f  \repeat unfold 4 { fis } | g g  \repeat unfold 4 { gis } | a4 d, a | d r r | d r r | d,2.\fermata \bar "|."
}

continuoFigures = \figures {  
  s2.*23 | s2 <6>4 | \repeat unfold 2 { <5>4 <6>2 } | <5 _!>4 <6>2 | < _+ >2 < _+ >4 | s2.*3 |
}

\score {
	<<
	\new StaffGroup \with { \override StaffGrouper.staff-staff-spacing.basic-distance = #8 
						     instrumentName = \markup {
							 \center-column { Violini  \line { concertanti } }
						     }
						   }
	<<
	\new Staff 
  		 <<  \global \vnI >>

	\new Staff
		<<  \global \vnII >>
	>>

	\new StaffGroup \with { \override StaffGrouper.staff-staff-spacing.basic-distance = #8 }
	<<
	\new Staff 
  		 <<  \global \vcConc >>

	\new Staff
		<<  
		\new Voice { \global \vcRip }
	 	\new FiguredBass { \continuoFigures }
	  >>
	>>
  >>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



