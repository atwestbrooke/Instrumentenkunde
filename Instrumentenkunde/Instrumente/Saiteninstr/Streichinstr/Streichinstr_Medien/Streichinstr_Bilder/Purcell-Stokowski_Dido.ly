\language deutsch
#(set! paper-alist (cons '("mein Format" . (cons (* 13 in) (* 4 in))) paper-alist))
\paper { tagline = ##f
#(set-paper-size "mein Format")
}

global = {
	 \key g \minor
	  \time 3/2
}

ViolinI = \relative d' {
\set Staff.instrumentName = "Violin I "
 \clef "treble"
\repeat unfold 2 { d1( d2) } |g1(-- c,2)-- | d1(-- d2)-- | es2(-- d1)-- | d1( g2) | a1( b4 a) | g2( fis g) | fis1  r2 | r1 r4 d'4 | d4.(-- d8)-- d1 | 
}

ViolinII = \relative b {
\set Staff.instrumentName = "Violin II "
 \clef "treble"
b1(-- b2)-- | c1( d2) | d( c1) | c( b2) | a(-- a1)-- | g(-- b2)-- | c( d1) | d2( c1) | c(-- g'2)-- | g1( fis2) |g1 \skip2 \bar ""
}

Viole = \relative g {
\set Staff.instrumentName = "Viola " 
 \clef "alto"
  g1(-- g2) | a1(-- a2)-- | g1(-- g2)-- | a1( g2) | g1( fis2) | g1(-- g2)-- | a1(-- a2)-- | b(-- c1)-- | a(-- d2)-- | es2( d1) | d1 \skip2 \bar ""
}

celloSolo = \relative g {
\set Staff.instrumentName = "Violoncello solo" 
 \clef "bass"
  g2 a( b) | b( a) h | c4.( b8) a4.( g8 fis4. g8) | fis1 d'4.( es8) | d4.( c8) b2( c4-- a--) | b1 es2 | es4(-- a,)-- a2( d) | d4(-- g,)-- a2( g) | a1 r2 | R1. | \skip1.
}

Violoncelli = \relative g, {
\set Staff.instrumentName = "Violoncello " 
 \clef "bass"
  g1(^- g'2)-- | fis1(-- f2)-- | e1(-- es2)-- | d1(-- b2)-- | c2( d2-- d,2)-- | g1(^- g'2)-- | fis1(-- f2)-- | e1(-- es2)-- | d1(-- b'2)-- | a2( b2-- a2)-- | b1 \skip2 \bar ""
}

doubleBass = \relative g, {
\set Staff.instrumentName = "Double Bass " 
 \clef "bass"
  \repeat unfold 2 { g1(^- g'2)-- | fis1(-- f2)-- | e1(-- es2)-- | d1(-- b'2)-- | c2( d2-- d,2)-- } | g,1. \bar ""
}

\score {
  <<
   \new StaffGroup  <<
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

   \new StaffGroup  <<
	\new Staff = "celloSolo" {
		 \global
		  \celloSolo
		}
	 \new Staff = "Violoncelli" {
		 \global
		  \Violoncelli
		}
    >>
    \new Staff = "doubleBass" {
		 \global
		  \doubleBass
     }
   >>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



