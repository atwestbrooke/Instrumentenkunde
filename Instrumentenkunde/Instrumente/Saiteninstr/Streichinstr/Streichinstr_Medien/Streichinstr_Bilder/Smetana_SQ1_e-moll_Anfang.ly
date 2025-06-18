\language deutsch
#(set! paper-alist (cons '("mein Format" . (cons (* 16 in) (* 7.6 in))) paper-alist))
\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #15
}

global = {
	\tempo "Allegro vivo appassionato"
	 \key e \minor
	  \time 4/4
}

e-moll = \relative e' { e fis g a h c d }
begleitung = \relative e' { e8( \repeat unfold 3 { g e } g) | }

ViolinI = \relative h' {
\set Staff.instrumentName = "Violine I "
 \clef "treble"
  <h g' e'>4-.\sff r4 e,8\pp( g e g) | \repeat unfold 15 \begleitung |
  \partial 4
  <es c' g'>4-.\sff \bar ""
}

ViolinII = \relative e' {
\set Staff.instrumentName = "Violine II "
 \clef "treble"
  <e h' g'>4-.\sff r4 g,8\pp( h g h) | \repeat unfold 15 \modalTranspose e g,\e-moll \begleitung |
  \partial 4
  <g es' c'>4-.\sff \bar ""
  
}

Viola = \relative e {
\set Staff.instrumentName = "Viola " 
 \clef "alto"
  <e h' g'>4-.\sff r4 r2 | R1*2 | r2 r4 r8 h''8-.\f | h1(_\markup { \dynamic { sf } \italic { espress. } } | e,4)-.-> r4 r4 r8 fis-. | g1(\sf | h,4)-.-> r4 r r8 dis-. | e2(->\sf g,4)-.-> r8 a8-. | h2(\sf e,4)-. r8 fis8-. | g4(-> e8[ r16 fis)]-- g8([ e g r16 a)]-- | h8([-> e, g r16 a)]-- \tuplet 3/2 { h8(-> e, fis } \tuplet 3/2 { g a ais) } | \tuplet 3/2 { h8(\< e, fis } \tuplet 3/2 { g a ais)\! } \tuplet 3/2 { h(\( cis dis) } e-. r16 fis\)-- | \repeat unfold 2 { g4(\(-> h,8-.)[ r16 dis\)]-- e4(\(-> h8-.)[ r16 fis'\)]-- } | g8(\< h,) dis[\( e] fis[ g a r16 h]\)\!-- |
	\partial 4
	c4-.\sff 
}

Violoncello = \relative e, {
\set Staff.instrumentName = "Violoncello " 
 \clef "bass"
  e4\sff r e2~\pp | \repeat unfold 14 { e1~ } | e( |
	\partial 4
	es4)-.\sff
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



