\language deutsch
#(set! paper-alist (cons '("mein Format" . (cons (* 15 in) (* 6 in))) paper-alist))
\paper { tagline = ##f
#(set-paper-size "mein Format")
}

global = {
	  \time 6/8
}

doubleBass = \relative d'' {
\set Staff.instrumentName = "Contrabasso " 
 \clef "treble"
  \key g \major
   \partial 8
    d8^\markup { \translate #'( 0 . 6 ) { "(klingt eine gr. 6" \super { "te" } "tiefer als notiert)" } } | \repeat volta 2 { e16-. d,-. \acciaccatura fis e\trill-. d-. d'-. d,-. c'-. d,-. \acciaccatura fis e\trill-. d-. h'-. d,-. | d'-. d,-. \acciaccatura fis e\trill-. d-. c'-. d,-. a'-. d,-. \acciaccatura fis e\trill-. d-. a'-. d,-. | h'-. d,-. \acciaccatura fis e\trill-. d-. c'-. d,-. e'-. d,-. \acciaccatura fis e\trill-. d-. d'-. d,-. | }

	\alternative {
		{ h'8 \clef "bass" \tuplet 3/2 { g,16([\p\< h) h-.] } \tuplet 3/2 
		{ h16([ d) d-.] } \tuplet 3/2 { d16([ g) g-.] } \clef "treble" \tuplet 
		3/2 { g16([ h) h-.] } \tuplet 3/2 { h16([ d) d-.\!] | }
		} 
		{ g,8~[ \tuplet 3/2 { g16\flageolet-. h\flageolet-. d\flageolet-.] } \tuplet 3/2 { g16 h\flageolet-. d\flageolet-. } g8\flageolet r d,\upbow | }
		}

	\repeat volta 2  { <<
		{ d16 d,_( c d) \clef "bass" h_( d) h([ d)] e([ d)] g,([ d')] | fis, d'( \acciaccatura fis e d) d,( d') es, d'( es d) 		d,( d') | fis, d'(\acciaccatura fis e d) d,( d') c, 		d'(\acciaccatura fis e d) a,( d') }
		 \\
		{ \skip 4. \skip 8 a8 g | fis[ r d] es[ r d] | fis[ r16. e!32 d8] c[ r16. h32 a8] }
		>>
		}
	\alternative {
		{ g8 \tuplet 3/2 { g'16([\p\< h) h-.] } \tuplet 3/2 
		{ h16([ d) d-.] } \tuplet 3/2 { d([ g) g-.] } \clef "treble" \tuplet 
		3/2 { g([ h) h-.] } \tuplet 3/2 { h([ d) d-.\!] | }
		}
		{ \clef "bass" g,,,8 g'32([ h d g] \clef "treble" h\flageolet d\flageolet g\flageolet h\flageolet) d8\flageolet \clef "bass" <fis,, d,> <fis 		d,> | }
		}
<g d h> g,32([ h d g] \clef "treble" h\flageolet d\flageolet g\flageolet h\flageolet) d8\flageolet \clef "bass" <fis,, d,> <fis d,> | <g d h>4 r8 \clef "treble" <d' h'>4\flageolet r8 | \clef "bass" g,,,2.\fermata \bar "|."
	}

klavierRH = \relative f {
\clef "bass"
 \key b \major
  \partial 8
   f8 | \repeat volta 2 { d( f b d b f) | es( f a c a f) | es( f a c a f) | }
	\alternative {
				 { d8( f b d b f) | }
		         { d8( f b d b f) | }
	}
	\repeat volta 2 { d( f b d b f) | es( f a c a f) | es( f a c a f) | }
	\alternative {
				 { d8( f b d b f) | }
		         { <b f d> r r r \clef "treble" <a'' es c a >\f <a es c a > | }
	}
 <b d, b> r r r <a es c a > <a es c a > | <b d, b>4 r8 <d f, d>4 r8 | <b, f d>2.\fermata \bar "|."
		}

klavierLH = \relative b, {
\clef "bass"
 \key b \major
  \partial 8
   r8 | \repeat volta 2 { <b b,>8 r r r4 r8 | <f f,>8 r r r4 r8 | <f f,>8 r r r4 r8 | }
		\alternative { 
					 { <b b,>8 r r r4 r8 | } 
		             { <b b,>8 r r r4 r8 | }
	}
 \repeat volta 2 { <b b,>8 r r r4 r8 | <f f,>8 r r r4 r8 | <f f,>8 r r r4 r8 | }
		\alternative { 
					 { <b b,>8 r r r4 r8 | } 
		             {  <b b,>8 r r r <f' f,> <f f,> | }
	}

<b, b,> r r r <f' f,> <f f,> | <b, b,>4 r8 <b' f d b>4 r8 | <b, b,>2.\fermata \bar "|."
		}

\score {
  <<
   
    \new Staff = "doubleBass" {
		 \global
		  \doubleBass
     }
	\new GrandStaff \with { instrumentName = "Piano" } <<
	\new Staff = "RH" {
		\global
		 \klavierRH
		  }
	\new Staff = "LH" {
		\global
		 \klavierLH
		  }
	>>
   >>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



