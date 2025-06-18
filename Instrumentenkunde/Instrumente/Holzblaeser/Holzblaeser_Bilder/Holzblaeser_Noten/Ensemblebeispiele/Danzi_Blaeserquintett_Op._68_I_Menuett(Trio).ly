\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 12 in) (* 5.8 in))) paper-alist))

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
	\tempo "Minuetto allegretto (trio)"
	  \time 3/4
}

Thema = { a4(\sf g) e2 | g4(\sf fis) d2 | a4-. a-. e'-. e8( fis) }


Oboe = \relative e'' {
 \clef "treble"
  \key d \major
   \partial 4
	r4 | R2. | r2 \repeat volta 2 {
		e8(\p d) | cis2 d8( e) | a,2 h'8( a) | gis2 a8( h) | a2 e8( d) | cis2 d8( e) | a,2 fis'8( gis) | a4.( h8) gis8[( a]) | fis2
	}
\repeat volta 2 {
		cis8( d) | e2 fis8( e) | d2 gis8( a) | h2 cis8( h) | a2 cis,8( d) | e2 fis8( e) | d2 d8( e) | fis4.( g8) e8[( fis]) | d2
	}

  }

AKlarinette = \relative f {
 \clef "treble"
  \transposition a
   \key f \major
    \partial 4
	 f4\p |
	 \repeat unfold 5 { f }
	 \repeat volta 2 { 
	  \repeat unfold 21 { f } e | a2
  	 }
	 \repeat volta 2 {
	  r4 | \repeat unfold 3 { e' } |
      \repeat unfold 6 { f } |
      \repeat unfold 6 { e } |
      \repeat unfold 5 { f } e | f2
     }
}

EHorn = \relative d'' {
 \clef "treble"
  \transposition e
   \key c \major
	\partial 4
	 d4\p |
	 \repeat unfold 5 { d }
     \repeat volta 2 {
	  d | \repeat unfold 3 { es } |
      \repeat unfold 3 { d } |
      \repeat unfold 3 { cis } |
      \repeat unfold 3 { d } |
      \repeat unfold 3 { es } |
      \repeat unfold 5 { d } cis | d2
  	 }
	 \repeat volta 2 {
	  r4 | \repeat unfold 3 { es } |
      \repeat unfold 3 { d } | e! e e |
      \repeat unfold 3 { c } |
      \repeat unfold 3 { es } | d d e! | f f es | d2
     }
}

Fagott = \relative a { 
 \clef "bass"
  \key d \major
    \partial 4
	 a4\p |
	 \repeat unfold 5 { a }
	 \repeat volta 2 { 
	  \repeat unfold 7 { a } 
	 \repeat unfold 14 { a } h | a2
  	 }
	 \repeat volta 2 {
	  r4 | \repeat unfold 14 { a, } ais |
      \repeat unfold 3 { h } | a! a a | d2
     }

}

\score {
  <<
	\new StaffGroup 
   <<
	\new Staff \with { instrumentName = "Oboe" }  		 {\global \Oboe }

	\new Staff \with { instrumentName = "Klarinette in A" }		{  \global \AKlarinette }

	\new Staff \with { instrumentName = "Horn in E" }
		{  \global \EHorn }

	\new Staff \with { instrumentName = "Fagott" } 		{ \global \Fagott }
   >>
  >>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



