\language deutsch
#(set! paper-alist (cons '("mein Format" . (cons (* 16 in) (* 5.5 in))) paper-alist))
\paper { tagline = ##f
#(set-paper-size "mein Format")
}

global = {
   \hide Score.BarNumber
	\tempo Adagio
	 \key d \major
	  \override NoteHead.style = #'petrucci
	   \override Flag.style = #'mensural 
	    \override Staff.TimeSignature.style = #'numbered
	     \time 3/2
}

GambeI = \relative d' {
\set Staff.vocalName = "Viola da Gamba I "
 \clef "mensural-c1"
  \skip1.*4 |
   \tempo Praeſto
 d4_"(forte)" e fis g a g8 fis | e4 fis g a h a8 g | fis4 g a g8 fis e4 fis | g fis8 e d4 e fis e8 d | cis4 e_"pian" fis e fis d | cis2. cis4 h2 | d4_"forte" e fis g a g8 fis | e4 fis g a h a8 g | fis4 g a g8 fis e4 fis | g fis8 e d4 e fis e8 d | cis4 fis_"pian" e fis e fis | e2. d4 d2 |
}

GambeII = \relative fis' {
\set Staff.vocalName = "Viola da Gamba II "
 \clef "mensural-c3"
  fis2 d1\fermata | d2 g1\fermata | cis,2 fis1\fermata | h,1.\fermata |
   \tempo Praeſto
 fis'4_"(forte)" e d cis8 h a4 h | cis d e2 e | d4 e fis e8 d cis4 d | e d8 cis h4 cis d cis8 h | a4 a_"(pian)" a a a h | ais2. fis4 fis2 | fis'4_"(forte)" e d cis8 h a4 h | cis d e2 e | d4 e fis e8 d cis4 d | e d8 cis h4 cis d cis8 h | a4 a_"pian" a a a a | a1 a2 |
}

GambeIII = \relative a {
\set Staff.vocalName = "Viola da Gamba III " 
 \clef "mensural-c4"
  a2 h1\fermata | h2 h1\fermata | a2 a1\fermata | g1.\fermata |
   \tempo Praeſto
h2_forte h a | a e'4 d8 cis h4 cis | d4 cis8 h a4 h cis h8 a | g4 a h a8 g fis4 g | a e_"pian" d e d fis | fis2. dis4 dis2 | fis_"forte" h a | a e'4 d8 cis h4 cis | d4 cis8 h a4 h cis h8 a | g4 a h a8 g fis4 g | e d_"pian" e d e d | e1 fis2 |
}

GambeIV = \relative d {
\set Staff.vocalName = "Viola da Gamba IV " 
 \clef "mensural-f"
  \bar "|:" d2 h1\fermata | g2 e1\fermata | fis2 d1\fermata | e1.\fermata |
   \tempo Praeſto
 h'4_"(forte)" cis d e fis g | a2 e,4 fis g a | h a8 g8 fis4 g a g8 fis | e4 fis g fis8 e d4 e | fis cis'_"pian" d cis d h | fis'2 fis,2 h2 | h4_forte cis d e fis g | a2 e,4 fis g a | h a8 g fis4 g a g8 fis | e4 fis g fis8 e d4 e | a d_"pian" cis d cis d | a1 d2 |
}

\score {
   \new StaffGroup <<
    \new MensuralStaff = "gambeI" {
		 \global
		  \GambeI
		}

	\new MensuralStaff = "GambeII" {
		 \global
		  \GambeII
		}
	 
	\new MensuralStaff = "GambeIII" {
		 \global
		  \GambeIII
		}
	 
	\new MensuralStaff = "GambeIV" {
		 \global
		  \GambeIV
		}
	 
   >>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



