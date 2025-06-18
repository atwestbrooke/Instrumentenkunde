\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 24 in) (* 9.5
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #30
system-separator-markup = \bigSeparator 
}

\layout {
 \context {
  \Score
   \remove "Bar_number_engraver"
	}
}
global = {
	\tempo "(Allegro spiritoso)"
	  \time 2/2
}

Thema = { a4(\sf g) e2 | g4(\sf fis) d2 | a4-. a-. e'-. e8( fis) }

FlautoI = \relative cis''' {
 \clef "treble"
  \key d \major
	cis1 | d | cis | d2 e\sf | cis1 | d | cis | d4 r d d, | d' e, d' fis, | d' g, d' fis, | d' e, d' d, | cis r r2 | r h'(\sf | a) r | r f(\sf | a) r | r h(\sf | a) r | r cis | d1 | cis | d | cis | d4 r h r | a r r2 | cis,4 r r2 | R1 | r4 h\(\p-. cis-. dis-. | e-. fis-. g-. a-. | h-. cis-. dis-. e-.\) | R1 | r4 a,,\(-. h -. cis-. | d-.  e-. fis-. g-. | a-. h-. cis-. d\) | cis1( | h2) e\sf | d1( | cis2) g\sf | h1(\> | a2 g) | \once \hide DynamicText | fis\p r4 e4(\pp | g2) r4 e( | 
\partial 2
d2) \bar ""
  }

FlautoII = \relative cis''' {
 \clef "treble"
  \key d \major
	R1*22 | cis1 | d4 r h r | a r r2 | cis,4 r r2 | R1*16 | 
\partial 2
r2 \bar ""
  }

OboeI = \relative a'' {
 \clef "treble"
  \key d \major
   a1~| a~| a~| a2 e\sf | a1~| a~| a | fis4 r r d | r e r fis | r g r fis | r e r d | cis r r2 | r h'(\sf | a) r | r f(\sf | a) r | r h(\sf | a) r | r  g | a1~ | a~ | a~ | a~ | a4 r h r | a r r2 | cis4 r r2 | R1*16 |
   \partial 2
   r2 \bar ""
  }

OboeII = \relative a'' {
 \clef "treble"
  \key d \major
   a1 | d, | g | fis2 e\sf | g1 | fis | g | fis4 r r d | r e r fis | r g r fis | r e r d | cis r r2 | r d(\sf | cis) r | r f(\sf | a) r | r d,(\sf | cis) r | r e | \repeat unfold 2 { d1 | e } | d4 r d r | fis r r2 | e4 r r2 | R1*16 |
   \partial 2
   r2 \bar ""
  }

ClarinettoI = \relative e'' {
 \clef "treble"
  \transposition a
   \key f \major
    e1 | f | g2 e4 e | f2 g\sf | e1 | f | g | \repeat unfold 7 { f2 } r2 | e4 r r2 | r f(\sf | e) r| r f(\sf | g) r | r f(\sf | e) r | r g | f1 | e | f | e | f4 r d r | c r r2 | e4 r r2| R1*16
   \partial 2
   r2 \bar ""  
}

ClarinettoII = \relative e'' {
 \clef "treble"
  \transposition a
   \key f \major
     c1 | c | b2 e4 e | f2 g\sf | b,1 | a | e' | f2 \repeat unfold 6 { f, } r2 | c'4 r r2 | r d(\sf | c) r | r f(\sf | g) r | r d(\sf | c) r | r e | \repeat unfold 3 { c1~ } | c | a4 r b r | a r r2 | g4 r r2 | R1*16
   \partial 2
   r2 \bar ""  
}

Fagotti = \relative a {
\set Staff.instrumentName = "2 Fagotti " 
 \clef "bass"
  \key d \major
   \Thema | d2 e\sf | \Thema | d4 r r a' | r h r c | r h r a | r g r gis | a r r2 | r gis(\sf | a) r | r d(\sf | cis) r | r gis(\sf | a) r | r g | fis8( g a h cis d e fis) | g( fis e d cis h a g) |  fis( g a h cis d e fis) | g(^\markup { \bold "a2" } fis e d cis h a g) | fis4 r g r | a r r2 | a,4 r r2 | R1*16
   \partial 2
   r2 \bar ""
  }

CornoI = \relative c'' {
 \clef "treble"
  \transposition d
   \key c \major
	\transpose c b' { \relative \Thema } | c2 d\sf | \transpose c' b { \relative g'' \Thema } | c2 r | R1*2  c1\( | g'2\) r | r \once \partcombineApart d\(\sf | g\) r | r \once \partcombineApart c,\(\sf | d\) r | r \once \partcombineApart d\(\sf | g\) r | r d | \repeat unfold 2 { e1 | d | } \once \partcombineApart c4 r \once \partcombineApart c r | e r r2 | d4 r r2 | R1*16
   \partial 2
   r2 \bar "" 
}

CornoII = \relative c'' {
 \clef "treble"
  \transposition d
   \key c \major
	\transpose c b' { \relative \Thema } | c2 d\sf | \transpose c' b { \relative g'' \Thema } | c2 r | R1*2 c1( | g2) r | r d'(\sf | g,) r | r c(\sf | g) r | r d'(\sf | g,) r | r g | \repeat unfold 2 { c1 | g | } c4 r c r | c r r2 | g4 r r2 | R1*16
   \partial 2
   r2 \bar "" 
}

ClarinoI = \relative d'' {
 \clef "treble"
  \transposition f
   d2 r | R1 | d1 | \partcombineApart c2 d\sf  | \undo \partcombineApart R1*2 | d1 | \once \partcombineApart c2 \repeat unfold 7 { c } | \once \partcombineApart g2 r | R1*2 | r2 \once \partcombineApart c\(\sf | d\) r | r \once \partcombineApart d\(\sf | g\) r | r d | \repeat unfold 2 { e1 | d | } \once \partcombineApart c4 r \once \partcombineApart c r | e r r2 | d4 r r2 | R1*16
   \partial 2
   r2 \bar ""
}

ClarinoII = \relative d'' {
 \clef "treble"
  \transposition f
   \key c \major
	g,2 r | R1 | g1 | c2 d\sf | R1*2 | g,1 | c2 \repeat unfold 7 { c,2 } | g'2 r | R1*2 | r2 c(\sf | g) r | r d'(\sf | g,) r | r  g | \repeat unfold 2 { c1 | g | } c4 r c r | c r r2 | g4 r r2 | R1*16
   \partial 2
   r2 \bar ""
}

Timpani = \relative a, {
\set Staff.instrumentName = "2 Timpani (D, A) "
 \clef "bass"
   \key c \major
	a2 r | R1*6 | \repeat unfold 8 { d2 } | a r | R1*2 | r2 d\sf | a r | R1*2 | r2 a | \repeat unfold 2 { \repeat unfold 2 { d2:8 } \repeat unfold 2 { a2: } } | d4 r d r | d r r2 | a4 r r2  | R1*16
   \partial 2
   r2 \bar ""
}

VioliniI = \relative a' {
\set Staff.instrumentName = "Violini I "
 \clef "treble"
  \key d \major
   a4 cis2 e4 | a, d2 fis4 | g8( fis) e-. d-. cis4-. cis-. | d2 e\sf | a,4 cis2 e4 | a, d2 fis4 | g8( fis) e-. d-. cis4-. cis-. | e( d) d' d, | d' e, d' fis, | d' g,  d' fis, | d' e, d' d, | cis-. a'8( gis) a4-. a8( gis) | a2 h\sf | a4-. a8( gis) a4-. a8( gis) | a2 \acciaccatura { g8 } f4\sf e8 d | a'4-. a8( gis) a4-. a8( gis) | a2 h\sf | a4-. a8( gis) a4-. a8( gis) | a4-. a h cis | \repeat unfold 2 { d8 cis h a g fis e d | cis d e fis g a h cis } | d4 r h r | a r r2 | <cis, e,>4 r r2 | dis1(\p | c'2 h) | a( g | fis e) | d( cis | h' a) | g( fis | e) d\sf | cis1( | h2) e\sf | d1( | cis2) g'\sf | h1(\> | a2 g) | \once \hide DynamicText fis\p r4 e(\pp | g2) r4 e( |
	\partial 2
	d2) \bar ""
  } 

VioliniII = \relative cis'' {
\set Staff.instrumentName = "Violini II "
 \clef "treble"
  \key d \major
   cis8 a a a a2:8 | a: a: | <a g>2: <a g>2: | <a fis>4 r e r | cis8 a' a a a2: | a: a: | <a g>2: <a g>2: | <a fis>4 r \repeat unfold 6 { r <d d,> } r h |  a-. cis8( d) cis4-. cis8( d) | cis2 d\sf | \repeat unfold 2 { cis4-. cis8( d) cis4-. cis8( d) | cis2 d\sf } | cis4-. cis8( d) cis4-. cis8( d) | cis4-. cis, d e | \repeat unfold 2 { d8 e fis g a h cis d | e d cis h a g fis e } | d4 r d' r | fis r r2 | <cis e,>4 r r2 | a1~\p | a | h,( | a'2 g) | fis( e | d cis) | h'( a | g) fis\sf | e1( | d2) g\sf | fis1( | e2) d'\sf | g1(\> | fis2 e) | \once \hide DynamicText d\p r | h\pp r4 g( |
   \partial 2
   fis2) \bar ""
  }

Viole = \relative a' {
\set Staff.instrumentName = "Viole " 
 \clef "alto"
  \key d \major
  \Thema | d2 e\sf | \Thema | d2 r4 a | r h r c | r h r a | r h r h | e e e e | e2 e\sf | e4 e e e | a2 f\sf | a4 e e e | e2 e\sf | e4 e e e | e e g, g | \repeat unfold 2 { fis8 g a h cis d e fis | g fis e d cis h a g } | fis4 r g r | a r r2 | g4 r r2 | fis1~ | fis | g( | a2 h) | a( g | fis e) | d1~ | d2 fis\sf | g( a | h) g\sf | a( h | cis) d\sf | e1(\> | fis4 g a2) | \once \hide DynamicText a\p r | g\pp r |
   \partial 2	
   a \bar ""
  } 

Bassi = \relative f {
\set Staff.instrumentName = \markup {
			\center-column { "Violoncelli" }
			\line { "e Contrabassi" }
			} 
 \clef "bass"
  \key d \major
   \Thema | d2 e\sf | \Thema | d2 r4 fis | r g r a | r h r a | r g r gis | a a a a | a2 gis\sf | a4 a a a | a2 b\sf | a4 a a a | a2 gis\sf | a4 a a a | g g g g | \repeat unfold 2 { fis fis fis fis | g g g g } fis4 r g r | a r r2 | a,4 r r2 | h'1~ | h | e,~ | e | a~ | a | d,1~ | d2 d\sf | e( fis | g) e\sf | fis( g | a) h\sf | cis1~\> | cis | \once \hide DynamicText d2\p r | g,\pp r |
   \partial 2	
   a \bar ""  
}

\score {
   \new GrandStaff \with { 
\override StaffGrouper.staff-staff-spacing.basic-distance = #14 }

  <<
	\new StaffGroup \with { 
	\override StaffGrouper.staff-staff-spacing.basic-distance = #8 }

	<<
	\new Staff \with { instrumentName = "2 Flauti" }  		 <<  \global \partcombine \FlautoI \FlautoII >>

	\new Staff \with { instrumentName = "2 Oboi" }
		<<  \global \partcombine \OboeI \OboeII >>

	\new Staff \with { instrumentName = "Clarinetti in A" }
		<<  \global \partcombine \ClarinettoI \ClarinettoII >>

	\new Staff = "Fagotti" {
		 \global
		  \Fagotti
		}
	>>
	\new StaffGroup \with { 
	\override StaffGrouper.staff-staff-spacing.basic-distance = #8 }

	<<
	\new Staff \with { instrumentName = "2 Corni (D)" }
		<<  \global \partcombine \CornoI \CornoII >>

	\new Staff \with { instrumentName = "2 Clarini (D)" }
		<<  \global \partcombine \ClarinoI \ClarinoII >>
	>>

\new StaffGroup \with { 
	\override StaffGrouper.staff-staff-spacing.basic-distance = #8 }

	<<
\new Staff = "Timpani" {
		 \global
		  \Timpani
		}
	>>
	\new StaffGroup \with { 
	\override StaffGrouper.staff-staff-spacing.basic-distance = #8 }

	<<
		\new GrandStaff 
		<<
    	\new Staff = "VioliniI" {
		 \global
		  \VioliniI
		}

    	\new Staff = "VioliniII" {
		 \global
		  \VioliniII
		}
		>>
	 
	\new Staff = "Viole" {
		 \global
		  \Viole
		}
	 
	\new Staff = "Bassi" {
		 \global
		  \Bassi
		}
	>> 
  >>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



