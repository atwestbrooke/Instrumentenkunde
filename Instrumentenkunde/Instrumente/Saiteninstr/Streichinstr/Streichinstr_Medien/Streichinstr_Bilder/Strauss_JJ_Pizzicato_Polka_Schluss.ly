\language deutsch
#(set! paper-alist (cons '("mein Format" . (cons (* 13 in) (* 12 in))) paper-alist))
\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #24
system-separator-markup = \bigSeparator
}

\layout {
  \context {
    \Score
    \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #15
    \override StaffGrouper.staff-staff-spacing.basic-distance = #15
\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #15
\omit BarNumber
  }
}

global = {
	 \key c \major
	  \time 2/4
	   \override BreathingSign.text = \markup {
		\musicglyph #"scripts.caesura.straight" }
		 }

ViolinI = \relative c''' {
\set Staff.instrumentName = "Violine I "
 \clef "treble"
  \partial 8
   c8^"pizz."\p \breathe |
	h h h16 f h f | e8 e e16 c e c | f8 h, f' h, | e\< g g c\f  \breathe | h\p h h16 f h f | e8 e e16 c e c | a'8 h, f' h, | r4\fermata r8 c'\pp | h a g f | e d c a | g a g a | g c e c' | h a g f | e d c a | g gis a h | c g' d g | e g d g | c, e'\>-> c g | e c g e | c\p r r4 | c8 r r4 | <c g e' c'>8\ff->^"div." r r4 \bar "|."
}

ViolinII = \relative e'' {
\set Staff.instrumentName = "Violine II "
 \clef "treble"
  \partial 8
   e8^"pizz."\p | f f f16 h, f' h, | c8 c c16 g c g | h8 g h g | c\< <c e,> <c e,> e\f \breathe | f\p f f16 h, f' h, | c8 c c16 g c g | f'8 g, f' g, | r4\fermata r8 g'\pp | f e d d | c h a es | d f d f| e e g g' | f e d d | c h a es | e r f r | e g h g | c g h g | c c'\f\>-> g e | c g e c | g\p r r4 | g8 r r4 | <g e' c' g'>8\ff-> r r4 \bar "|."
}

Viole = \relative f' {
\set Staff.instrumentName = "Viola " 
 \clef "alto"
  \partial 8
   r8 \breathe | r <f d>\pp^"pizz." r <f d> |  r <e c> r <e c> | r <f d> r <f d> | g\< g g e\f \breathe | r <f d>\p r <f d> | r <e c> <e c> <e c> | r <f d> r <f d> | r4\fermata r8 e'\pp | d c h gis | a f e c | h r h r | c c e e'| d c h gis | a f e c | c r d r | e g f g | e g f g | e g'\f\>-> e c | g e c g | e\p r r4 | e8 r r4 | <c, g' e' c'>8\ff-> r r4 \bar "|."
}

Violoncelli = \relative d {
\set Staff.instrumentName = "Violoncello " 
 \clef "bass"
  \partial 8
  r8 \breathe | d\pp^"pizz." g g, g' | c, g' e g | d g g, g' | c,\< g' c g\f \breathe | d\pp g g, g' | c, g' e g | d g g, g' | r4\fermata r8 <g' e>\pp | <f d> <e c> <d h> <d h> | <e c> gis, a fis | g r g r | c, <e g> <g c> <e' g> | <f d> <e c> <d h> <d h> | <e c> gis, a fis | g r g r | <g c,> r g r | c r g r | c <g' e>\f->\> <e c> <c g> | r c,,\p\> e g | c\p r r4 | c8 r8 r4| <c, g' e' c'>8\ff-> r r4 \bar "|."
}

doubleBass = \relative d {
\set Staff.instrumentName = "Kontrabaß " 
 \clef "bass"
  \partial 8
  r8 \breathe | d\pp^"pizz." r g, r | c r e r | d r g, r | c\< r e\! r \breathe | d\pp r g, r | c r e r | d r g, r | r4\fermata r8 r | R2 | r8 gis' a fis | g r g r | c, r r4 | R2 | r8 gis' a fis | g r g r | c, r g' r | c, r g r | c r r4 | r8 c\p\> e g | c,\p r r4 | c8 r8 r4 | c8\ff-> r8 r4 \bar "|."
}

\score {
  <<
   \new StaffGroup  
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

	\new Staff {
		 \global
		  \Viole
		}

		 \new Staff = "Violoncelli" {
		 \global
		  \Violoncelli
		}

    \new Staff = "doubleBass" {
		 \global
		  \doubleBass
     }
   >>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



