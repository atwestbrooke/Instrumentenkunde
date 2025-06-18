\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 12 in) (* 11
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
	\tempo "Grave"
	  \time 4/4
s1*3 | s8 \tempo \markup { \bold \larger "rit." }  s4. \bar "||" 

}

FirstHn = \relative f' {
 \clef "treble"
  \transposition f
   f8.-_\pp^\markup { \italic "mit Dämpfer" } g16---. as2~-__\markup { \italic "ben marc." } as8 as16-_ as-_ | f8-_ g-_ c,2.-_ | f8.-_ g16---. as2~-_ as8 as16-_ b-_ | \time 2/4 c4.-_ g8-_ \bar "||"
}

ThirdHn = \relative e' {
 \clef "treble"
  \transposition f
   R1*3 | \time 2/4 e2\ppp_\markup { \italic \translate #'(2 . 0) "(ged.)" } \bar "||"
}

SecondHn = \relative g' {
 \clef "treble"
  \transposition f
   R1*3 | \time 2/4 g2\ppp^\markup { \italic \translate #'(-2 . 0) "(ged.)" } \bar "||"
}

FourthHn = \relative c' {
 \clef "treble"
  \transposition f
   R1*3 | \time 2/4 c2\ppp_\markup { \italic \translate #'(3.5 . -2.8) "(ged.)" } \bar "||" 
}

Tamtam =  {
  R1 | r2 h4\ppp^\markup { \italic "(klingen lassen)" } r | R1 | \time 2/4 R2 \bar "||"
}

HarfeIoben = \relative as {
 \clef "treble"
  r4\p_\markup { \italic "flag." } \tuplet 3/2 { as4\flageolet b8~\flageolet } \tuplet 3/2 { b\flageolet as\flageolet b\flageolet } r4 | R1 | r4_\markup { \italic "flag." } \tuplet 3/2 { as4\flageolet b8~\flageolet } \tuplet 3/2 { b\flageolet as\flageolet b\flageolet } r4 | \time 2/4 R2 \bar "||"
}

HarfeIunten = \relative f {
 \clef "bass"
 r4 \tuplet 3/2 { f4\flageolet g8~\flageolet } \tuplet 3/2 { g\flageolet f\flageolet g\flageolet } r4 | R1 | r4 \tuplet 3/2 { f4\flageolet g8~\flageolet } \tuplet 3/2 { g\flageolet f\flageolet g\flageolet } r4 | \time 2/4 R2 \bar "||" 
}

HarfeIIoben = \relative des {
 \clef "bass"
  r4\p_\markup { \italic "flag." } \tuplet 3/2 { des4\flageolet des8~\flageolet } \tuplet 3/2 { des\flageolet des\flageolet des\flageolet } r4 | R1 | r4_\markup { \italic "flag." } \tuplet 3/2 { des4\flageolet des8~\flageolet } \tuplet 3/2 { des\flageolet des\flageolet es\flageolet } r4 | \time 2/4 R2 \bar "||"
}

HarfeIIunten = \relative b, {
 \clef "bass"
  r4 \tuplet 3/2 { r4 b8~_\flageolet } \tuplet 3/2 { b_\flageolet des_\flageolet b_\flageolet } r4 | R1 | r4 \tuplet 3/2 { r4 b8~_\flageolet } \tuplet 3/2 { b_\flageolet des_\flageolet b_\flageolet } r4 | \time 2/4 R2 \bar "||"
}

CelestaVn = \relative b''' {
 \clef "treble"
  <b b,>1:32~\ppp \repeat unfold 2 { <b b,>1:32~ } | \time 2/4 <b b,>4:32 <a a,>4: \bar "||"
}

CelestaUnten = \relative b' {
 \clef "treble"
 R1*3 | \time 2/4 R2 \bar "||"
}

Fritz = \relative a' {
 \clef "treble"
  \hide NoteHead
   \autoBeamOff
   R1 | r4^\markup { \bold \underline "Fritz:" } a16^\markup { \italic "(schwer atmend heiser)" } a a a r2 | r4 r16 a a a r a a a r4 | \time 2/4 r16 a a a a8 r \bar "||"
}

lyricsFritz = \lyricmode {

Sa -- ge Ru -- dolf, ich will es voll -- en -- den. Der letz -- te Akt…

}

Bratschen = \relative des'' {
\set Staff.instrumentName = "Bratschen " 
 \clef "treble"
  R1 | r4^\markup { \italic "3 Pulte Flag." } 
  <<
  { des4.\flageolet\pp\< \once \hide DynamicText f8(\p as8.-_\flageolet as16)-_\flageolet }
  \\
  { b,4.\flageolet c8( des!8.-_\flageolet des16)-_\flageolet }
  >>
  R1 | \time 2/4 R2 \bar "||"
  } 

Violoncelli = \relative as' {
\clef "tenor"
  R1 | r4^\markup { \italic "2 Pulte Flag." } 
  <<
  { as4.\flageolet\pp\< \once \hide DynamicText ges8(\p f8.-_\flageolet f16)-_\flageolet }
  \\
  { f4.\flageolet es8( des8.-_\flageolet des16)-_\flageolet }
  >>
  R1 | \time 2/4 R2 \bar "||"			
}

\score {
   \new GrandStaff \with { 
\override StaffGrouper.staff-staff-spacing.basic-distance = #14 }

	<<
	\new GrandStaff
    <<
	\new Staff \with { instrumentName = "Hn I, III" }  		 <<  \global \partcombine \FirstHn \ThirdHn >>

	\new Staff \with { instrumentName = "Hn II, IV" }  		 <<  \global \partcombine \SecondHn \FourthHn >>
    >>

	\new StaffGroup \with { instrumentName = "Tamtam" }
	<<
	\new DrumStaff \with { \override StaffSymbol.line-count = #1 }
		<< \global \Tamtam >>
	>>
	\new GrandStaff \with { instrumentName = "Harfe I" }
		 << 
		  \new Staff = "HarfeIoben" <<
		   \global
		    \HarfeIoben
         >>
		  \new Staff = "HarfeIunten" <<
		   \global
		    \HarfeIunten
		  >>
		 >>

	\new GrandStaff \with { instrumentName = "Harfe II" }
		 << 
		  \new Staff = "HarfeIIoben" <<
		   \global
		    \HarfeIIoben
         >>
		  \new Staff = "HarfeIIunten" <<
		   \global
		    \HarfeIIunten
		 >>
		 >>

	\new GrandStaff \with { instrumentName = "Celesta" }
		 << 
		  \new Staff = "CelestaOben" <<
		   \global
		    \CelestaVn
          >>
		  \new Staff = "CelestaUnten" <<
		   \global
		    \CelestaUnten
		  >>
		 >>
	
    \new StaffGroup \with { instrumentName = "Fritz" }
	<<
		\new Staff = "Fritz"
		<<
			\new Voice = "FritzMusik" {
				\Fritz }
			\new Lyrics
			 \lyricsto "FritzMusik" {
				\lyricsFritz }
		>>
    >>

	\new StaffGroup = "Strings" \with { 
	\override StaffGrouper.staff-staff-spacing.basic-distance = #8 }

	<<
		
    	\new Staff \with { instrumentName = "Violine I" } 
		 << \global
		  \CelestaVn >>
	 
	\new Staff \with { instrumentName = "Bratschen" }
		<<
		 \global
		  \Bratschen >>
	 
	\new Staff \with { instrumentName = "Violoncelli" } 
		 <<
		  \global
		   \Violoncelli >>
	>> 
  >>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions



