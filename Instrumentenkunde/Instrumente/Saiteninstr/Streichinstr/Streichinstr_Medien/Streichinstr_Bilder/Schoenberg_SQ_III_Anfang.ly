\language deutsch

%% http://lsr.di.unimi.it/LSR/Item?id=843
%% see also http://lilypond.org/doc/v2.18/Documentation/notation/graphic

% contrinuted by harm6
% after an idea by Nathan
% see http://lists.gnu.org/archive/html/lilypond-user/2012-07/msg00036.html
% thanks to Mark Knoop

hauptStart = \markup {
  \path #0.5 #'((moveto 0 0)
                 (lineto 0 -2)
                 (moveto 0 -1)
                 (lineto 1 -1)
                 (moveto 1 0)
                 (lineto 1 -2)
                 (moveto 1 0)
                 (lineto 1.8 0))}

nebenStart = \markup {
  \path #0.5 #'((moveto 0 -2)
                 (lineto 0 0)
                 (lineto 1 -2)
                 (lineto 1 0)
                 (lineto 1.8 0))
}

stimmeEnd = \markup {
  \path #0.5 #'((moveto 0 0)
                 (lineto 0.8 0)
                 (lineto 0.8 -0.8))
}

hauptstimmeStart =
#(define-music-function (parser location )()
#{
          \once \override TextSpanner.before-line-breaking = 
              #(lambda (grob)
                  (let* ((sz (ly:grob-property grob 'font-size 0.0))
                         (mult (magstep sz)))
                  (begin
                     (ly:grob-set-property! grob 'style 'none)
                     (ly:grob-set-nested-property! grob 
                               '(bound-details left text) 
                                  (markup #:scale (cons mult mult) hauptStart))
                     (ly:grob-set-nested-property! grob 
                               '(bound-details right text) 
                                  (markup #:scale (cons mult mult) stimmeEnd))
                     ;;Perhaps you may want to uncomment the following lines
                     ;;and adjust the value (currently -0.5)
                     (ly:grob-set-nested-property! grob 
                              '(bound-details right padding) -1.5)
                     (ly:grob-set-nested-property! grob 
                               '(bound-details left-broken text) #f)
                     (ly:grob-set-nested-property! grob 
                               '(bound-details right-broken text) #f))))
          $(make-music 'EventChord 'elements (list 
          		               (make-music
          		                 'TextSpanEvent
          		                 'span-direction -1)))
#})

nebenstimmeStart =
#(define-music-function (parser location )()
#{
          \once \override TextSpanner.before-line-breaking = 
              #(lambda (grob)
                  (let* ((sz (ly:grob-property grob 'font-size 0.0))
                         (mult (magstep sz)))
                  (begin
                     (ly:grob-set-property! grob 'style 'none)
                     (ly:grob-set-nested-property! grob 
                               '(bound-details left text) 
                                  (markup #:scale (cons mult mult) nebenStart))
                     (ly:grob-set-nested-property! grob 
                               '(bound-details right text) 
                                  (markup #:scale (cons mult mult) stimmeEnd))
                     ;;Perhaps you may want to uncomment the following lines
                     ;;and adjust the value (currently -0.5)
                     ;;(ly:grob-set-nested-property! grob 
                     ;;          '(bound-details right padding) -0.5)
                     (ly:grob-set-nested-property! grob 
                               '(bound-details left-broken text) #f)
                     (ly:grob-set-nested-property! grob 
                               '(bound-details right-broken text) #f))))
          $(make-music 'EventChord 'elements (list 
          		               (make-music
          		                 'TextSpanEvent
          		                 'span-direction -1)))
#})

hauptstimmeEnd = \stopTextSpan
nebenstimmeEnd = \stopTextSpan

#(set! paper-alist (cons '("mein Format" . (cons (* 16 in) (* 8
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #30
system-separator-markup = \bigSeparator 
}

\layout {
 \context {
  \Score
   \override BarNumber.break-visibility = #end-of-line-invisible
   barNumberVisibility = #(every-nth-bar-number-visible 5)
   \override BarNumber.font-size = #4
   \override BarNumber.stencil
     = #(make-stencil-boxer 0.2 0.5 ly:text-interface::print)
  }
}

global = {
	\tempo \markup { \fontsize #5 "Moderato" } 2 = 100
	 \accidentalStyle dodecaphonic-first
	  \time 2/2
}

% ///////////////

accompI = \relative g' { g8 e e es' es a, a c, | R1 }
accompII = \relative gis' { gis8 eis eis fis' fis h, h d, | R1 }

% //////////////

ViolinI = \relative h'' {
\set Staff.instrumentName = "I. Gg."
 \clef "treble"
  \key c \major
   R1*4 | r4 \hauptstimmeStart h2.(-> | b1) | r4 cis2( gis4-.) | d1 | r4 f'2( h,4) | h(-> fis2.~)| fis4 d'2.(-> | ais) \hauptstimmeEnd r4 | r4 des,,2( b4) | R1 \bar ""
  }

DynamikVnI = { s1*4 | r4 s8\p s8\> s4 s16 s16\! s8\< | s16 s8.\! s2.\! | s4 s4...\< s32\! s4 | s8 s4.\> s4 s4\! | s8 s8\< s8\!\> s8\! s2 | s1 | s4 s2\>  s4\!\< | s32 s8..\!\> s8\! s8 s2 | s1 | }

ViolinII = \relative fis' {
\set Staff.instrumentName = "II. Gg."
 \clef "treble"
  \key c \major
    g8-.\f e-. e-. es'-. es-. a,-. a-. c,-. | R1 | << { \accompI } \\ { s1_\markup { \dynamic "p" \italic "sempre stacc." } | s1 } >> | << { \accompI } \\ { s1\p  | s1 } >> | \repeat unfold 3 { \accompI } | { \accompII } \bar ""
  }

Bratsche = \relative g {
\set Staff.instrumentName = "Br." 
 \clef "alto"
  \key c \major
   R1 | g8-.\mf e-. e-. es'-. es-. a,-. a-. c,-. | R1 | \transpose g' g \relative { << { \accompI } \\ { s1_\markup { \dynamic "pp" \italic "sempre stacc." } | s1 } >> | << { \accompI } \\ { s1\p | s1 } >> | \repeat unfold 3 { \accompI } } | as'8 f f fis' fis h, h d,  \bar ""
  } 

Cello = \relative eis, {
\set Staff.instrumentName = "Vcl."
 \clef "bass"
  \key c \major
   R1*7 | r4 eis2.(-> | fis1) | r2 r4 gis4~-> | gis2 cis,~-> | cis2. r4 | r2 \hauptstimmeStart g'~-> | g4 e2. \hauptstimmeEnd \bar ""}

DynamikVc = { s1*7 | r4 s2\p s8. s16\< | s16 s16\!\> s8 s2.\! | s2... s16\> | s4 s4.\! s4.\> | s1\! | s2 s2\p | s4\< s4\!\> s2\! | }

\score {
   \new StaffGroup \with { 
\override StaffGrouper.staff-staff-spacing.basic-distance = #16 }

<<
    	\new Staff = "ViolinI"
		{
		 \global
		  \ViolinI
		}
		
		\new Dynamics \with {
		\override VerticalAxisGroup.nonstaff-relatedstaff-spacing.basic-distance = #0 }
		 { \DynamikVnI }

    	\new Staff = "ViolinII" {
		 \global
		  \ViolinII
		}
	 
	\new Staff = "Bratsche" {
		 \global
		  \Bratsche
		}
	 
	\new Staff = "Cello" {
		 \global
		  \Cello
		}
		
		\new Dynamics \with {
		\override VerticalAxisGroup.nonstaff-relatedstaff-spacing.basic-distance = #0 }
		 { \DynamikVc }
>>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions
