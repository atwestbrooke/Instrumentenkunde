\language deutsch
#(set! paper-alist (cons '("mein Format" . (cons (* 20 in) (* 9 in))) paper-alist))
\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #15
}

global = {
	\tempo "(Adagio.)"
	  \time 3/4
}

Abwaertslauf = {  r8 as~([\ff as16 g32 f es d c b] as g f es d c b as) | g8(\> a b h c cis | \once \hide Staff.DynamicText \once \override TextScript.extra-offset = #'( -1.5 . 2.5) d4)\pp_\markup { "(" \dynamic { pp } ")"  } r4*2 }

Flauto = \relative es''' {
\set Staff.instrumentName = "Flauto "
 \clef "treble"
  \key b \major
	R2.*2 | r8 es~([\mf\cresc es16 d32 c b a g fis)] r16 as32([ g)] c( b) f'!( es) | \Abwaertslauf |
  }

Oboe = \relative b'' {
\set Staff.instrumentName = "Oboe "
 \clef "treble"
  \key b \major
   R2. | r8 b~([\p\cresc b16 a32 g f e d cis)] r16 e32([ d)] g( fis) h( \once \hide Staff.DynamicText a)\f | R2.*4 |
  }

Clarinetto = \relative b'' {
\set Staff.instrumentName = \markup { "Clarinetto in Si" \super \flat "/B" }
 \clef "treble"
  \transposition b
   \key c \major
    r8 b~([\p\cresc b16 a32 g f e d cis)] r16 e32([ d)] g( fis) b( a) | R2.*2 |  \Abwaertslauf |
}

Corno = \relative c'' {
\set Staff.instrumentName = "Corno in Fa/F. "
 \clef "treble"
  \transposition f
   \key c \major
	R2.*6 |
}

Fagotto = \relative as' {
\set Staff.instrumentName = "Fagotto. " 
 \clef "bass"
  \key b \major
	R2.*3 | \clef "tenor" \Abwaertslauf |
  }

Violino = \relative h' {
\set Staff.instrumentName = "Violino "
 \clef "treble"
  \key b \major
   <h d,>2:8\pp <c c,>8 <c c,> | <cis e,>2:8\cresc <d d,>8 <d d,> | <es fis,>2:8 <es g,>8 <es g,> | as\ff <as, b,>8 <as b,>2: | g2.\> | <fis a,>8\pp <fis a,> <fis a,> <fis a,> <g a,> <g a,> |
  }

Viola = \relative as' {
\set Staff.instrumentName = "Viola. " 
 \clef "alto"
  \key b \major
   as2:8\pp g8 g | b2:8\cresc a8 a | c2:8 b8 b | <d f,>\ff <d, f,>8 <d f,>2: | g,2.\> | a8\pp d d d es es |
  } 

Violoncello = \relative f {
\set Staff.instrumentName = "Violoncello. " 
 \clef "bass"
  \key b \major
   f2(\pp e4)| \slurDotted g2(\cresc fis4) | \slurDotted a2( b4)~ | b8\ff <b, d,> <b d,>2:8 | \override Hairpin.style = #'dashed-line es,2.(\> | d2)\(\pp c4\) |

  }

Contrabasso = \relative es {
\set Staff.instrumentName = "Contrabasso. " 
 \clef "bass"
  \transposition c
   \key b \major 
    f2(\pp e4)| g2(\cresc fis4) | a2( b4)~ | b8\ff b, b2:8 | es2.( | d4) r r |

}


\score {

   \new StaffGroup \with { 
\override StaffGrouper.staff-staff-spacing.basic-distance = #14 }

<<
 

\new Staff = "Flauto" {
		 \global
		  \Flauto
		}

\new Staff = "Oboe" {
		 \global
		  \Oboe
		}

\new Staff = "Clarinetto" {
		 \global
		  \Clarinetto
		}

\new Staff = "Corno" {
		 \global
		  \Corno
		}

\new Staff = "Fagotto" {
		 \global
		  \Fagotto
		}

    \new Staff = "Violin" {
		 \global
		  \Violino
		}
	 
	\new Staff = "Viola" {
		 \global
		  \Viola
		}
	 
	\new Staff = "Violoncello" {
		 \global
		  \Violoncello
		}

\new Staff = "Contrabasso" {
		 \global
		  \Contrabasso
		}
	 
   >>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



