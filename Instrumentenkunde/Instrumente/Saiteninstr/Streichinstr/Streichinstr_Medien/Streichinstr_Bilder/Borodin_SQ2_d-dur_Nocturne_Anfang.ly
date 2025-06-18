\language deutsch
#(set! paper-alist (cons '("mein Format" . (cons (* 10 in) (* 3.5 in))) paper-alist))
\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #15
}

global = {
	\tempo "Andante" 4 = 60
	 \key a \major
	  \time 3/4
}

ViolinI = \relative h' {
\set Staff.instrumentName = "Violine I "
 \clef "treble"
  R2.*8 |
  \partial 8
	r8 \bar ""
}

ViolinII = \relative e' {
\set Staff.instrumentName = "Violine II "
 \clef "treble"
   <e cis>8(-. <e cis>4-. <e cis>-. <e cis>8)-. | \repeat unfold 3 { <d h>(-. <d h>4-. <d h>-. <d h>8)-. } | <ais>-.^\markup { \italic  { segue } } ais4-. ais-. ais8-. | h-. h4-. d d8-. | a-.  a4-. a-. a8-. | <d h>(-. <d h>4-. <d h>-. <d h>8)-. | 
	\partial 8
    cis-. \bar ""
  
}

Viola = \relative a {
\set Staff.instrumentName = "Viola " 
 \clef "alto"
   \repeat unfold 3 { a8-.(  a4-. a-. a8-.) } | <e' gis,>(-. <e gis,>4-. <e gis,>-. <e gis,>8)-. | <cis g>-.^\markup { \italic  { segue } } <cis g>4-. <cis g>-. <cis g>8-. | fis,-. fis4-. fis fis8-. | f-.  f4-. f-. f8-. | <a e>(-. <a e>4-. <a e>-. <a e>8)-. |  
	\partial 8
    a-. \bar "" 
}

Violoncello = \relative a' {
\set Staff.instrumentName = "Violoncello " 
 \clef "bass"
  r4^"Solo." a2->_\markup { \italic { cantabile ed espressivo } } | \grace { gis16( a } \tuplet 3/2 { gis8)\(-.-- fis-.-- gis\)-.-- } e2 | d16(-.-- e-.-- d-.-- e)-.-- fis2 | e4(->\> h8)\! r8 e4~-> | e8\< ais,( fis'4.->\! e8) | \grace { d16( e } \tuplet 3/2 { d8)\(-.-- cis-.-- d\)-.-- } h2 |  r8 h(-.--\< cis-.-- d)-.-- \grace { cis16( d16 } cis8)\( h\)\! | e4(->\> h8)\! r8 e4~-> |
	\partial 8
	e8 \bar ""
  }

\score {
   \new StaffGroup <<
    \new Staff = "ViolinI" {
		 \global
		  \ViolinI
		}

	\new Staff = "ViolinII" {
		 \global
		  \ViolinII
		}
	 
	\new Staff = "Viola" {
		 \global
		  \Viola
		}
	 
	\new Staff = "Violoncello" {
		 \global
		  \Violoncello
		}
	 
   >>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



