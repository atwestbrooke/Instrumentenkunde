\language deutsch
#(set! paper-alist (cons '("mein Format" . (cons (* 10 in) (* 3 in))) paper-alist))
\paper { tagline = ##f
#(set-paper-size "mein Format")
}

global = {
	\tempo Allegro
	 \key c \major
	  \time 4/4
}

C-Dur = \relative c' { c d e f g a h }
motif = \relative c' { c4.( d8) e4-! e-! | e8( d f e) d4 r4 | }
dynamics = {s1\p | R1*7 |
	\partial 4
	R4 | }

ViolinI = \relative c' {
\set Staff.instrumentName = "Violine I "
 \clef "treble"
 \motif \modalTranspose c d \C-Dur \motif | a'4.( h8 c4) c-! | c( h) a-! g-! | g( f) e-! d-! |
  \partial 4
  c-! \bar ""
}

ViolinII = \relative c' {
\set Staff.instrumentName = "Violine II "
 \clef "treble"
  c4.\p( h8) c4-! c-! | c8( h d c) h4 r4 | \modalTranspose c h, \C-Dur \motif | d2.( a'4) | a( g) f-! e-! | e( d) c-! h-! |
  \partial 4
  c-! \bar ""
}

Viola = \relative g {
\set Staff.vocalName = "Viola " 
 \clef "alto"
  g1\p~ | \once \tieDashed g2~ g8( h d h) | g1~ | g2~ g8 e'( g e) | c2( a4 d) | g,2 r | g r |
	\partial 4
	r8 \skip8 \bar ""
}

Violoncello = \relative c {
\set Staff.vocalName = "Violoncello " 
 \clef "bass"
  c\p \repeat unfold 7 c8 | \repeat unfold 4 g g4 r | \repeat unfold 8 g8 | \repeat unfold 4 c c4 r | \repeat unfold 8 fis8 | \repeat unfold 8 g | \repeat unfold 8  g, |
	\partial 4
	c-! \skip8 \bar ""
}

\score {
   \new StaffGroup <<
    \new Staff = "ViolinI" {
		 \global
		  \ViolinI
		}
	\new Dynamics = "DynamicsVnI" {
		\dynamics
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



