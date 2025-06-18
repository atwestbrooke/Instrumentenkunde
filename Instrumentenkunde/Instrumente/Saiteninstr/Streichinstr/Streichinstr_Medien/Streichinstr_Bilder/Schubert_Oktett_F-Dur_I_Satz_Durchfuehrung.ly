\language deutsch
#(set! paper-alist (cons '("mein Format" . (cons (* 20 in) (* 7 in))) paper-alist))
\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #15
}

global = {
	\tempo "(Allegro.)"
	  \time 4/4
       \override DynamicTextSpanner.style = #'none
}

Clarinetto = \relative h' {
\set Staff.instrumentName = "Clarinetto in B. "
 \clef "treble"
  \transposition b
   \key g \major
    \partial 2
	r2 | b(-.\pp b4-. b4-.) | \repeat unfold 2 { d4.->( c8) c4 r } | R1 | c2(-. c4-.\cresc c4-.) | \repeat unfold 2 { es4.->( d8) d4 r } | R1 | r2 b'4.->(\fp g8) | g4 r b4.->( g8) | g1\ff\> |
}

Corno = \relative c'' {
\set Staff.instrumentName = "Corno in F. "
 \clef "treble"
  \transposition f
   \key c \major
    \partial 2
	r2 | b(-.\pp b4-. b4-.) | \repeat unfold 2 { es4.->( d8) d4 r } | R1 | c2(-. c4-.\cresc c4-.) | \repeat unfold 2 { f4.->( e8) e4 r } | R1 | r2 c4.->(\fp es8) | es4 r c4.->( es8) | c1\ff\> |
}

Fagotto = \relative es {
\set Staff.instrumentName = "Fagotto. " 
 \clef "bass"
  \key f \major
   \partial 2
	es8.(-> es'16) es4 | c2(-. c4-. c4-.) | \repeat unfold 2 { es4.-> es8 es4 r } | R1 | des2(-. des4-.\cresc des4-.) | \repeat unfold 2 { f4.-> f8 f4 r } | R1 | r2 des4.->\fp des8 | des4 r des4.-> des8 | f,1\ff\> |
  }

ViolinI = \relative g'' {
\set Staff.instrumentName = "Violino I "
 \clef "treble"
  \key f \major
   \partial 2
	g8(-. es-. des-. b-.) | as4 r r2 | r2 g'4.(->\pp as8) | as4-. r g4.(-> as8) | as4(\< b\> des c) | b4\p r r2 | r2 a!4.(-> b8) | b4-. r a4.(-> b8) | b4-. f-.\< f-. f-.\! | as4.(\fp f8) f4 r |  as4.(\fp f8)\cresc f4 r | <a! c,>4.(\ff\> f8) f4-.\!\p r4 |
  }

ViolinII = \relative b' {
\set Staff.instrumentName = "Violino II "
 \clef "treble"
  \key f \major
   \partial 2
  b4.( g8) | as4 r r2 | r2 b4.(->\pp as8) | as4-. r b4.(-> as8) | as4(\< b4. c16\!\> des es4) | des4\!\p r r2 | r2 c4.(-> b8) | b4-. r c4.(-> b8) | b4-. des-.\< des-. c-.\! | h4.\fp h8 h4 r |  h4.\fp h8\cresc h4 r | <es f,>4.(\ff\> c8) c4-.\!\p r4 |
}

Viola = \relative des' {
\set Staff.instrumentName = "Viola. " 
 \clef "alto"
  \key f \major
   \partial 2
   des2( | c4) r r2 | r2 des4.(->\pp c8) | c4-. r des4.(-> c8) | c4(\< des2\!\> a!4) | b4\!\p r r2 | r2 es4.(-> des8) | des4-. r es4.(-> des8) | des4-. f-.\< f-. f-.\! | f4.(\fp as8) as4 r |   f4.(\fp as8)\cresc as4 r | f4.(\ff\> a!8) a4-.\p r4 |
  } 

Violoncello = \relative es {
\set Staff.instrumentName = "Violoncello. " 
 \clef "bass"
  \key f \major
   \partial 2
  r2 | R1 | r2 es4.(->\pp as8) | as4-. r es4.(-> as8) | as4(\< ges4\!\> f2) | b,4\!\p r r2 | r2 f'4.(-> b8) | b4-. r f4.(-> b8) | b4-. b-.\< b-. c-.\! | des4.\fp des8 des4 r |  des4.(\fp des8)\cresc des4 r | c4.(\ff\> es8) es4-.\!\p r4 |
  }

Contrabasso = \relative es {
\set Staff.instrumentName = "Contrabasso. " 
 \clef "bass"
  \transposition c
   \key f \major 
    \partial 2
  r4 es | as8-.\pp g-. as-. b-. c-. as-. g-. f-.  | \repeat unfold 2 { es-. as-. c-. \repeat unfold 5 { es-. } } | as,8-.\< as,-. ges-. ges'-. f,\>-. f'-. f-. f-. | b-.\p a-. b-. c-. des-. b-. a-. b-. | f-. b-. des-. \repeat unfold 5 { f-. } | f,-.\cresc b-. des-. \repeat unfold 5 { f-. } | b,-.  b,-.\< des-. f-. b-. b,-. c-. c'-. |  des-.\> des,-. f-. as-.\! \repeat unfold 4 { des-. } | des-.\> des,-. f-. as-.\! des-.\cresc des-. des-. des-. | f,4\!_\markup { \dynamic { ffp } } r4 r2 |
}


\score {
   \new StaffGroup <<

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

\new Staff = "Contrabasso" {
		 \global
		  \Contrabasso
		}

	 
   >>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



