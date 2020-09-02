%% This is file `Alon.cls', modified version of `Book.cls'

%%% Created by Shashi Kumar / ITC [August 2012]


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{Alon}
              [2013/06/05 v1.13
 Standard LaTeX document class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility
\DeclareOption{Alon1}{\@Alonatrue}
\newif\if@Alona
\DeclareOption{Alon2}{\@Alonbtrue}
\newif\if@Alonb
\DeclareOption{Alon3}{\@Alonctrue}
\newif\if@Alonc
\DeclareOption{Alon4}{\@Alondtrue}
\newif\if@Alond
\DeclareOption{Alon5}{\@Alonetrue}
\newif\if@Alone
\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}
    }
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{Alon1}{\@Alonatrue}
\newif\if@Alona
\DeclareOption{Alon2}{\@Alonbtrue}
\newif\if@Alonb
\DeclareOption{Alon3}{\@Alonctrue}
\newif\if@Alonc
\DeclareOption{Alon4}{\@Alondtrue}
\newif\if@Alond
\DeclareOption{Alon5}{\@Alonetrue}
\newif\if@Alone
    
\fi
\DeclareOption{singlecolor}{\@singlecolortrue}
\newif\if@singlecolor\@singlecolortrue
\global\@singlecolorfalse
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\newif\ifappendix
\global\appendixfalse

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@numbysec
\DeclareOption{numbysec}{\@numbysectrue}
\newif\if@numberinsequence
\DeclareOption{numberinsequence}{\@numberinsequencetrue}
\newif\if@nocaptionbreak
\DeclareOption{NoCaptionBreak}{\@nocaptionbreaktrue}
\newif\if@sevenbyten
\DeclareOption{sevenbyten}{\@sevenbytentrue}
\newif\if@cip
\DeclareOption{cip}{\@ciptrue}
\newif\if@times
\DeclareOption{times}{\@timestrue}
\newif\if@chapnumonly
\DeclareOption{chapnumonly}{\@chapnumonlytrue}
\newif\if@ChapterResetsPage
\DeclareOption{ChapterResetsPage}{\@ChapterResetsPagetrue}
\newif\if@ChapterTOCs
\DeclareOption{ChapterTOCs}{\@ChapterTOCstrue}
\newif\if@EOCRefs
\DeclareOption{EOCRefs}{\@EOCRefstrue}%
\newif\if@SuperscriptCites
\DeclareOption{SuperscriptCites}{\@SuperscriptCitestrue}%
\newif\if@UnnumberedReferences
\DeclareOption{UnnumberedReferences}{\@UnnumberedReferencestrue}%
\newif\if@pdf
\DeclareOption{pdf}{\@pdftrue}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\ExecuteOptions{letterpaper,10pt,twoside,onecolumn,final,openright}
\ProcessOptions

\if@singlecolor
\def\redink{\special{color cmyk 0 0 0 1.0}}
\else
\def\redink{\special{color cmyk 0 1.0 1.0 0}}
\fi
\def\blackink{\special{color cmyk 0 0 0 1.0}} %  


%%%%%%%%%%%%%%%%%%%

\def\helv@scale{.82}
%
\DeclareFontFamily{T1}{helvetica}{}%
\DeclareFontShape{T1}{helvetica}{m}{n}{<->s*[\helv@scale]phvr8t}{}%
\DeclareFontShape{T1}{helvetica}{m}{it}{<->s*[\helv@scale]phvro8t}{}%
\DeclareFontShape{T1}{helvetica}{m}{sc}{<->s*[\helv@scale]phvrc8t}{}%
\DeclareFontShape{T1}{helvetica}{b}{n}{<->s*[\helv@scale]phvb8t}{}%
\DeclareFontShape{T1}{helvetica}{b}{it}{<->s*[\helv@scale]phvbo8t}{}%
\DeclareFontShape{T1}{helvetica}{m}{sl}{<->s*[\helv@scale]phvro8t}{}%
\DeclareFontShape{T1}{helvetica}{b}{sc}{<->s*[\helv@scale]phvbc8t}{}%
\DeclareFontShape{T1}{helvetica}{b}{sl}{<->s*[\helv@scale]phvbo8t}{}%
\DeclareFontShape{T1}{helvetica}{bx}{n}{<->s*[\helv@scale]phvb8t}{}%
\DeclareFontShape{T1}{helvetica}{bx}{it}{<->s*[\helv@scale]phvbo8t}{}%
\DeclareFontShape{T1}{helvetica}{bx}{sc}{<->s*[\helv@scale]phvbc8t}{}%
\DeclareFontShape{T1}{helvetica}{bx}{sl}{<->ssub * helvetica/b/it}{}%

\DeclareFontFamily{OT1}{helvetica}{}%
\DeclareFontShape{OT1}{helvetica}{m}{n}{<->s*[\helv@scale]phvr7t}{}%
\DeclareFontShape{OT1}{helvetica}{m}{it}{<->s*[\helv@scale]phvro7t}{}%
\DeclareFontShape{OT1}{helvetica}{m}{sc}{<->s*[\helv@scale]phvrc7t}{}%
\DeclareFontShape{OT1}{helvetica}{b}{n}{<->s*[\helv@scale]phvb7t}{}%
\DeclareFontShape{OT1}{helvetica}{b}{it}{<->s*[\helv@scale]phvbo7t}{}%
\DeclareFontShape{OT1}{helvetica}{m}{sl}{<->s*[\helv@scale]phvro7t}{}%
\DeclareFontShape{OT1}{helvetica}{b}{sc}{<->s*[\helv@scale]phvbc8t}{}%
\DeclareFontShape{OT1}{helvetica}{b}{sl}{<->s*[\helv@scale]phvbo7t}{}%
\DeclareFontShape{OT1}{helvetica}{bx}{n}{<->s*[\helv@scale]phvb7t}{}%
\DeclareFontShape{OT1}{helvetica}{bx}{it}{<->s*[\helv@scale]phvbo7t}{}%
\DeclareFontShape{OT1}{helvetica}{bx}{sc}{<->s*[\helv@scale]phvbc8t}{}%
\DeclareFontShape{OT1}{helvetica}{bx}{sl}{<->s*[\helv@scale]phvbo7t}{}%

%%%%%%%%%%%%%%%%%%%%%


\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
%
\clubpenalty=0         % 'Club line'  at bottom of page.
\widowpenalty=10000    % 'Widow line' at top of page.
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

%  ****************************************
%  *            PAGE LAYOUT               *
%  ****************************************
%
% All margin dimensions measured from a point one inch from top and side
% of page.
%
% SIDE MARGINS:
%
\oddsidemargin  6pc %5pc
\evensidemargin 5.7pc %5pc
\marginparwidth 4pc
\marginparsep   1pc
\topmargin  12pt %0pt
\headheight 12pt
\headsep    18pt
\footskip   2pc
%
% DIMENSION OF TEXT:
\newdimen\trimheight
\newdimen\trimwidth
\newdimen\normaltextheight
\newdimen\tempa
\newdimen\tempdimen
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Parameter Initializaton %%%%%%%%%%%%%%%%%%%%%%%%%%
% 
\newdimen\htrim
\newdimen\vtrimtop
\newdimen\vtrimbot

\setlength\trimheight{9in}
\setlength\trimwidth{6in}
%
\newdimen\totalwidth

%
\if@Alona
\textheight 45pc%\baselineskip
  %\advance\textheight by \topskip
\addtolength\textheight{3pt}
  \textwidth 28pc
\addtolength\textwidth{.5pt}
  \topmargin0in
  \oddsidemargin1.1875in
  \evensidemargin1.1875in
  \htrim.7365in
  \vtrimtop1.068in
  \vtrimbot1.068in
  \hoffset-15pt
  \voffset39pt
\let\normaltextheight\textheight
\let\totalwidth\textwidth
\else\if@Alonb
  \textheight = 51pc
%  \advance\textheight by \topskip
  \textwidth 33pc
  \topmargin0in
  \oddsidemargin.5in
  \evensidemargin.5in
  \htrim.75in
  \vtrimtop.8607in
  \vtrimbot1.027in
  \hoffset-.1in
  \voffset-.15in%.04in
\let\normaltextheight\textheight
\let\totalwidth\textwidth
\else\if@Alonc
\special{papersize=9.5in,12in}
   \setlength\paperheight {12in}%
    \setlength\paperwidth  {9.5in}
  \textheight = 56pc
%  \advance\textheight by \topskip
  \textwidth 36pc
  \marginparwidth=6pc
\totalwidth42pc
  \topmargin0in
  \oddsidemargin.5in
  \evensidemargin1.5in
  \htrim.764in
  \vtrimtop1.0107in
  \vtrimbot1.042in
  \hoffset-.2in
  \voffset-.05in%.04in
\let\normaltextheight\textheight
\else\if@Alond
  \textheight = 42pc
%  \advance\textheight by \topskip
  \textwidth 24pc
  \topmargin0in
  \oddsidemargin.5in
  \evensidemargin.5in
  \htrim.757in
  \vtrimtop1.0857in%.8607in
  \vtrimbot0.787in%1.027in
  \hoffset0.75in
  \voffset0.75in%.04in
\let\normaltextheight\textheight
\let\totalwidth\textwidth
\else\if@Alone
  \textheight = 45pc
%  \advance\textheight by \topskip
  \textwidth 30pc
  \topmargin0in
  \oddsidemargin0.25in
  \evensidemargin0.25in
  \htrim1.257in
  \vtrimtop87pt%1.0857in%.8607in
  \vtrimbot65.5pt%0.787in%1.027in
  \hoffset0.5in
  \voffset0.5in%.04in
\let\normaltextheight\textheight
\let\totalwidth\textwidth
\else
\textheight = 45pc%\baselineskip
  %\advance\textheight by \topskip
\addtolength\textheight{3pt}
  \textwidth 28pc
\addtolength\textwidth{.5pt}
  \topmargin0in
  \oddsidemargin1.1875in
  \evensidemargin1.1875in
  \htrim.7365in
  \vtrimtop1.068in
  \vtrimbot1.068in
  \hoffset-15pt
  \voffset39pt
\let\normaltextheight\textheight
\let\totalwidth\textwidth

%%\textheight = 43\baselineskip
%%  %\advance\textheight by \topskip
%%\addtolength\textheight{3pt}
%%  \textwidth 26pc
%%\addtolength\textwidth{.5pt}
%% \topmargin0in
%%  \oddsidemargin1.1875in
%%  \evensidemargin1.1875in
%%  \htrim5.05pc
%%  \vtrimtop7.7pc
%%  \vtrimbot5.44pc
%%%  \hoffset-5pt
%%  \voffset45pt
%%\let\normaltextheight\textheight
  \fi\fi\fi
\fi\fi
%
\columnsep 1pc
\columnseprule 0pt
%
% FOOTNOTES
%
\footnotesep 6.65pt
\skip\footins 12pt plus 3pt minus 1.5pt
%

%%%%  Trim marks %%%%%%%%%%%
\newsavebox\ul@box
\newsavebox\ur@box
\newsavebox\ll@box
\newsavebox\lr@box
\def\top@cornermarks{%
  \hskip-\htrim
  \if@Alonc
  \vbox to 0\p@{\vskip-\vtrimtop\rlap{\ifodd\c@page\hspace*{-0.35in}\else\hspace*{-1.35in}\fi\copy\ul@box}\vss}%
  \vbox to 0\p@{\vskip-\vtrimtop\rlap{\ifodd\c@page\hskip\totalwidth\else\hskip\textwidth\fi\hskip2\htrim\copy\ur@box}\vss}%
  \vbox to 0\p@{\vskip\textheight\vskip\vtrimbot\rlap{\ifodd\c@page\hspace*{-0.40in} \else\hspace*{-1.35in}\fi\copy\ll@box}\vss}%
  \vbox to 0\p@{\vskip\textheight\vskip\vtrimbot\rlap{\ifodd\c@page\hskip\totalwidth\else\hskip\textwidth\fi\hskip2\htrim\copy\lr@box}  \vss}%
\else
  \vbox to 0\p@{\vskip-\vtrimtop\llap{\copy\ul@box}\vss}%
  \vbox to 0\p@{\vskip-\vtrimtop\rlap{\hskip\totalwidth\hskip2\htrim\copy\ur@box}\vss}%
  \vbox to 0\p@{\vskip\textheight\vskip\vtrimbot\llap{\copy\ll@box}\vss}%
  \vbox to 0\p@{\vskip\textheight\vskip\vtrimbot\rlap{\hskip\totalwidth\hskip2\htrim\copy\lr@box}\vss}%
  \fi\hskip\htrim}
\def\make@cornermarks{%
  \sbox\ul@box{\rule{18\p@}{.25\p@}\hskip8\p@\hbox to.25\p@{\vbox to26\p@{\noindent\rule{.25\p@}{18\p@}}}}%
  \sbox\ur@box{\hbox to.25\p@{\vbox to26\p@{\noindent\rule{.25\p@}{18\p@}}}\hskip8\p@\rule{18\p@}{.25\p@}}%
  \sbox\ll@box{\rule{18\p@}{.25\p@}\hskip8\p@\lower34\p@\hbox to.25\p@{\vbox to26\p@{\noindent\rule{.25\p@}{18\p@}}}}%
  \sbox\lr@box{\lower34\p@\hbox to.25\p@{\vbox to26\p@{\noindent\rule{.25\p@}{18\p@}}}\hskip8\p@\rule{18\p@}{.25\p@}}}

%%%%%%%%%%%%%%%%%%%%  End Trim Marks %%%%%%%%%%%%


%%%\def\ps@plain{\let\@mkboth\@gobbletwo
%%%     \let\@oddhead\top@cornermarks%\@empty
%%%     \def\@oddfoot{\reset@font\hfil\thepage
%%%     \hfil}\let\@evenhead\@empty\let\@evenfoot\@oddfoot}
%
\def\ps@folio{\let\@mkboth\@gobbletwo
     \let\@oddhead\top@cornermarks5%\@empty
     \def\@oddfoot{\hbox to \textwidth{\hss\hbox to \textwidth{\hfill$\redink\overline{\blackink\hbox{\hspace*{3pt}\dropfoliofont\thepage\hspace*{3pt}}}$}}}%
     \let\@evenhead\@empty
     \def\@evenfoot{\hbox to \textwidth{\hss\hbox to \textwidth{{\dropfoliofont\thepage}\hfill}}}}
%



%%%\def\even@head{%
%%%\top@cornermarks
%%%  {\@the@page\RunningHeadFont
%%%    \hfil
%%%\leftmark
%%%    }\hfil}
%%%\def\odd@head{%
%%%\top@cornermarks
%%%  \hfil{\RunningHeadFont
%%%\rightmark
%%%    }
%%%\hfil
%%%    \@the@page
%%%  }
%%%\def\@the@page{{\PageNumFont\thepage}}


\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\top@cornermarks\RunningHeadFont\if@Alonc\hspace*{-6pc}\hbox to \textwidth{{\bfseries\thepage}\hskip7.3pt\ddbox\hskip7pt\leftmark\hfill}\hfill\else{\bfseries\thepage}\hskip7.3pt\ddbox\hskip7pt\leftmark\hfill\fi}%
      \def\@oddhead{\top@cornermarks\if@Alonc\hbox to \totalwidth{\hfill\RunningHeadFont{\rightmark}\hskip7.4pt\ddbox\hskip7.1pt{\bfseries\thepage}}\else\hfill\RunningHeadFont{\rightmark}\hskip7.4pt\ddbox\hskip7.1pt{\bf\thepage}\fi}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {%\MakeUppercase
       {%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
%%            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {%\MakeUppercase
								{%
        \ifnum \c@secnumdepth >\z@
%%          \thesection. \ %
        \fi
        ##1}}}}
%%%\def\ps@headings{%
%%%  \let\@mkboth\@gobbletwo
%%%  \if@pdf
%%%    \let\@evenhead\@empty
%%%    \let\@oddhead\@empty
%%%    \def\@oddfoot{\@cip\hfil}%
%%%    \def\@evenfoot{\@cip\hfil}%
%%%  \else
%%%\let\@oddfoot\@empty
%%%\let\@evenfoot\@empty
%%%    \let\@evenhead\even@head
%%%    \let\@oddhead\odd@head
%%%  \fi
%%%  }
\else
  \def\ps@headings{\let\@mkboth\@gobbletwo%
\if@pdf
    \let\@evenhead\@empty
    \let\@oddhead\@empty
    \def\@oddfoot{\@cip\hfil}%
    \def\@evenfoot{\@cip\hfil}%
  \else
\let\@oddfoot\@empty
\let\@evenfoot\@empty
    \let\@evenhead\even@head
    \let\@oddhead\odd@head
  \fi
}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
\def\ps@empty{%
  \let\@mkboth\@gobbletwo
  \if@pdf
    \let\@evenhead\@empty
    \let\@oddhead\@empty
    \def\@oddfoot{\@cip\hfil}%
    \def\@evenfoot{\@cip\hfil}%
  \else
    \make@cornermarks
    \let\@oddhead\top@cornermarks
    \let\@evenhead\top@cornermarks
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
  \fi
  }
  
  \font\dbox=msam10 at 9pt
\def\ddbox{\hbox{\redink\dbox\char'004}\blackink}

%
\def\ps@folio{\let\@mkboth\@gobbletwo
     \let\@oddhead\top@cornermarks%\@empty
     \def\@oddfoot{\hbox to \textwidth{\hss\hbox to \textwidth{\hfill$\redink\overline{\blackink\hbox{\hspace*{3pt}\dropfoliofont\thepage\hspace*{3pt}}}$}}}%
     \let\@evenhead\@empty
     \def\@evenfoot{\hbox to \textwidth{\hss\hbox to \textwidth{{\dropfoliofont\thepage}\hfill}}}}
%

%%%\def\ps@folio{%
%%%  \let\@mkboth\@gobbletwo
%%%  \if@pdf
%%%    \let\@evenhead\@empty
%%%    \let\@oddhead\@empty
%%%    \def\@oddfoot{\@cip\hfil}%
%%%    \def\@evenfoot{\@cip\hfil}%
%%%  \else
%%%\let\@oddhead\top@cornermarks
%%%    \def\@oddfoot{%
%%%      \parindent\z@
%%%      \baselineskip7\p@
%%%      \hbox{%
%%%        \textwidth\@ciprulewidth
%%%        \vbox{%
%%%          \if@cip\rule{\@ciprulewidth}{.25pt}\par
%%%            \hbox{\vbox{\noindent\copy\@cipboxa\par\noindent\copy\@cipboxb}}\fi}}
%%%      \hfill\@the@page}
%%%    \let\@evenhead\top@cornermarks%\odd@head
%%%    \let\@evenfoot\@oddfoot
%%%  \fi
%%%  }
\newcommand\HeadingsBookChapter{%
  \def\chaptermark##1{%
    \markboth{\@title}{%
      ##1}}%
  \def\sectionmark##1{}}
\def\HeadingsChapterSection{%
  \def\chaptermark##1{%
    \markboth{%
      ##1}{}}%
  \def\sectionmark##1{%
    \markright{%
      ##1}}}
\def\pdfon{\@pdftrue}
\def\pdfoff{\@pdffalse}
\if@pdf
  \def\@cip{{\fontsize{6\p@}{8\p@}\selectfont\copyright 2001 by CRC Press LLC}}
\else
  \newsavebox\@cipboxa
  \newsavebox\@cipboxb
  \newdimen\@ciprulewidth
  \def\@cip#1#2{%
    \sbox\@cipboxa{\fontsize{6\p@}{8\p@}\selectfont #1}%
    \sbox\@cipboxb{\fontsize{6\p@}{8\p@}\selectfont #2}%
    \@ciprulewidth\wd\@cipboxa
    \ifnum\@ciprulewidth<\wd\@cipboxb\@ciprulewidth\wd\@cipboxb\fi}%
\fi
\if@pdf
\else
  \AtBeginDocument{%
    \@cip{\rule{0pt}{9pt}0-8493-0052-5/00/\$0.00+\$.50}%
      {\copyright\ \ 2001 by CRC Press LLC}}%
\fi
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
{\parindent \z@ \raggedright \baselineskip \z@ \lineskip \z@ \parskip \z@
    \vbox{
    \vskip -7bp
    {\baselineskip 10bp\lineskip 10bp\NameFont\uppercase{\@author}\par}
    \vskip 6bp
    \AffiliationFont \@affiliation
    \vskip -2bp
    \crcrule
    \vskip 22bp
    {\baselineskip 24bp\lineskip 24bp\TitlePageTitleFont\@title\par}}}
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
%  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{empty}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
{\parindent \z@ \raggedright \baselineskip \z@ \lineskip \z@ \parskip \z@
    \vbox{
    \vskip -7bp
    {\baselineskip 10bp\lineskip 10bp\NameFont\uppercase{\@author}\par}
    \vskip 6bp
    \AffiliationFont \@affiliation
    \vskip 10bp
    \crcrule
    \vskip 26bp
    {\baselineskip 24bp\lineskip 24bp\TitlePageTitleFont\@title\par}}}
  \par
  \vskip 1.5em}
\fi

%%%%%%%%%%%%%% Font Defined %%%%%%%%%%%%%%%%%

 \def\@xipt{11}
  \def\@xviiipt{18}
 \def\@xxivpt{24}
 \def\@xxxpt{30}
 \def\@xxxxviiipt{48}


%%%%%%%% Font Definition %%%%%%%%

\newcommand\ContributorAffiliationFont{\reset@font\fontsize{10}{12}\raggedright\selectfont}
\newcommand\ContributorNameFont{\reset@font\fontsize{10}{12}\bfseries\raggedright\selectfont}

\newcommand\FMHeadFont{\fontsize{20}{22}\sffamily\itshape\selectfont}
\newcommand\NameFont{\fontsize{10}{12}\itshape\selectfont}
\newcommand\AffiliationFont{\fontsize{8}{10}\selectfont}
\newcommand\TitlePageTitleFont{\fontsize{24}{28}\sffamily\itshape\selectfont}
\def\RunningHeadFont{\fontsize{10}{10}\sffamily\selectfont}%
\def\foliofont{\fontsize{10}{12}\bfseries\selectfont}%
\def\dropfoliofont{\reset@font\fontsize{10}{10}\sffamily\bfseries\selectfont}%
\def\Partnumfont{\fontsize{48}{52}\selectfont}%
\def\Parttitlefont{\fontsize{18}{22}\sffamily\selectfont}%\bfseries
\def\Chapternumfont{\fontsize{24}{24}\selectfont}%
\def\Chapternamefont{\fontsize{10}{10}\sffamily\selectfont}%
\def\Chaptertitlefont{\fontsize{30}{36}\sffamily\selectfont}%
\def\sectionfont{\fontsize{12}{14}\sffamily\selectfont\uppercase}%
\def\subsectionfont{\fontsize{11}{13}\sffamily\selectfont}
\def\subsubsectionfont{\fontsize{10.5}{12.5}\sffamily\itshape\selectfont}
\def\paragraphfont{\reset@font\fontsize{11}{14}\selectfont}%
\def\subparagraphfont{\reset@font\fontsize{11}{14}\itshape\selectfont}%
\def\figureNofont{\fontsize{9}{11}\sffamily\selectfont}
\def\figurecaptionfont{\reset@font\fontsize{11}{14}\selectfont}
\def\TableNumberFont{\fontsize{9}{11}\sffamily\selectfont}
\def\TableTitleFont{\reset@font\fontsize{9}{11}\selectfont}
\def\tablefont{\reset@font\fontsize{9}{12}\selectfont}%
\def\tchfont{\reset@font\fontsize{9}{11}\bfseries\selectfont}%
\def\tabnotefont{\fontsize{9}{11}\selectfont}%
\def\indexfont{\fontsize{8}{10}\selectfont}%\rightskip11pc
\def\Initialfont{\reset@font\fontsize{33}{33}\selectfont}
\def\bibfont{\reset@font\fontsize{10}{12}\selectfont}
\newcommand\VfFont{\fontsize{9}{11}\sffamily\selectfont}
\newcommand\CAPlusOneFont{\fontsize{12}{14}\bfseries\selectfont}
\newcommand\CAAPlusOneFont{\fontsize{10}{12}\itshape\selectfont}


\def\Parttocfont{\fontsize{12}{15}\bfseries\selectfont}
\def\chtocfont{\reset@font\fontsize{12}{15}\sffamily\selectfont}
\def\chtocnamefont{\reset@font\fontsize{12}{15}\sffamily\scshape\selectfont}
\def\sectocfont{\fontsize{11}{14}\sffamily\selectfont}
\def\subsectocfont{\reset@font\fontsize{11}{14}\selectfont}
\def\subsubsectocfont{\reset@font\fontsize{11}{14}\selectfont} %%%removed italics -MF
\def\fmtocfont{\reset@font\fontsize{12}{14}\sffamily\selectfont}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{\make@cornermarks%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{folio}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\protect\pnumberline{\thepart}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont\vspace*{-138.5pt}
     \ifnum \c@secnumdepth >-2\relax
%%       \huge\bfseries \partname\nobreakspace
{\redink\Partnumfont\thepart\blackink}
       \par\vspace*{-6.5pt}
%%%\hbox to \textwidth{\hfill$\redink\underline{\redink\hbox{\hspace*{48pt}\Partnumfont\thepart\hspace*{48pt}}}$\hfill\blackink}
{\redink\vrule height 1pt width100pt\blackink}
       \vskip 13pt
     \fi
     \vbox{\def\spreadoutfactor{1.2}\spreadout{\Parttitlefont #2}}\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}

\if@ChapterTOCs
  \newwrite\@chaptoc
  \def\secnumwidth{21pt}\def\subsecnumwidth{30pt}\def\ssubsecnumwidth{36pt}\def\subsubsecnumwidth{66pt}\fi
\long\def\@trplarg#1{\@ifnextchar[{\@xtrplarg{#1}}{\@ztrplarg{#1}}}
\long\def\@xtrplarg#1[#2]{\@ifnextchar[{#1[#2]}{\@ytrplarg{#1}[{#2}]}}
\long\def\@ytrplarg#1[#2]#3{#1[{#2}][{#2}]{#3}}
\long\def\@ztrplarg#1#2{#1[{#2}][{#2}]{#2}}

%\newbox\tempbox
\newdimen\tempdim
%
\def\chapterinitial#1#2{%
 \setbox\tempbox\hbox{\Initialfont#1\hskip2pt}%
 \tempdim\wd\tempbox
 %\advance\tempdim12pt
 %\advance\tempdim2pt
 \tempdimen\hsize
 \advance\tempdimen-\tempdim
 \par\vskip-13pt\parshape3 \tempdim \tempdimen \tempdim \tempdimen 0pt \hsize
 \vbox to 0pt{\vskip7pt{\Initialfont\noindent#1}}{\noindent{\sc#2}}}
%

\font\cdbox=msam10 at 5pt
\def\cndbox{\raise2pt\hbox{\blackink\cdbox\char'004}}

\def\pnumberline#1{\hb@xt@\@tempdima{\chtocfont#1\hfil\redink}}


%\def\numberline#1{{#1\hspace*{13.5pt}}}

\newdimen\chwd

\def\chwd{70pt}


\def\chnumberline#1{\@hangfrom{\hbox to \chwd{{\chtocnamefont Chapter}~#1\hskip3pt\cndbox\hskip3.2pt}\hfill}\redink}

\def\appnumberline#1{\@hangfrom{\hbox to \chwd{{\chtocnamefont Appendix}~#1\hskip3pt\cndbox\hskip3.2pt}\hfill}\redink}


%%%\def\appnumberline#1{{#1\hskip3pt\cndbox\hskip3.2pt\redink}}

\def\spreadoutfactor{1}

\def\spreadout#1{%
  \gdef\temp{#1}\dimen0 = \spreadoutfactor pt
  \expandafter\dospreadout\temp\endmark}

\def\dospreadout{%
  \afterassignment\findospreadout
  \let\next= }

\def\findospreadout{%
   \ifx\next\endmark
      \let\nextaction = \relax
   \else
      \let\nextaction = \dospreadout
      \next
      \kern\dimen0
   \fi
   \nextaction}


\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{folio}
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\@mainmattertrue\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
\ifappendix
      \addcontentsline{toc}{chapter}%
                                   {\protect\appnumberline{\thechapter}#1}%
\else
                         \addcontentsline{toc}{chapter}%
                                   {\protect\chnumberline{\thechapter}#1}%
\fi
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi
  \if@ChapterTOCs\if@filesw\immediate\openout\@chaptoc\thechapter.toc\fi\fi
                      }
\def\@makechapterhead#1{%
\vspace*{-20\p@}
\if@Alona
\textheight45pc
\else\if@Alonb
\textheight50.80pc
\else\if@Alonc
\textheight56.5pc
\else
\textheight45pc
\fi\fi\fi
\advance\textheight2.5pt%%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
	\ifappendix
	 \rightline{\redink\def\spreadoutfactor{2.0}\spreadout{\Chapternamefont APPENDIX}\space {\Chapternumfont\thechapter}\blackink}
			\par\nobreak\vspace*{-7pt}
	\noindent{\vrule height 1pt width\textwidth}
\else
	\rightline{\redink\def\spreadoutfactor{2.0}\spreadout{\Chapternamefont CHAPTER}\space {\Chapternumfont\thechapter}\blackink}
			\par\nobreak\vspace*{-7pt}
	\noindent{\vrule height 1pt width\textwidth}
\fi
        \vskip 23.5\p@
      \fi
    \fi
    \interlinepenalty\@M
    \vbox{\def\spreadoutfactor{1.2}\spreadout{\Chaptertitlefont #1}}\par\nobreak\vspace*{12pt}
\noindent{\redink\vrule height 3pt width\textwidth\blackink}\vspace*{2pt}
            \if@ChapterTOCs
	      \make@chaptoc
		    \vskip 36\p@
	    \else
		    \vskip 76\p@
	\fi
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \markboth{#1}{#1}
                   \addcontentsline{toc}{fm}{#1}
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{-20\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
\noindent{\vrule height.5pt width\textwidth}\par\vspace*{17.5pt}
    \vbox{\def\spreadoutfactor{1.2}\spreadout{\Chaptertitlefont  #1}}\par\nobreak\vspace*{13pt}
\noindent{\redink\vrule height3pt width\textwidth}\blackink\par
    \vskip 34\p@
  }}

\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec\leavevmode\fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#1}{#3}{#4}{#5}{#6}}%
    {\@trplarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\def\@ssect#1#2#3#4#5#6{%
  \@tempskipa #4\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #5{%
        \@hangfrom{\hskip #2}%
          \interlinepenalty \@M\redink #6\blackink\@@par}%
    \endgroup
    \csname #1mark\endcsname{#6}%
  \else
    \def\@svsechd{#5{\hskip #2\relax #6}\csname #1mark\endcsname{#6}}%
  \fi
  \@xsect{#4}}
\def\@sect#1#2#3#4#5#6[#7][#8]#9{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\redink\@seccntformat{#1}\blackink\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
\ifnum #2=1
      #6{%
\@hangfrom{\hskip #3\relax\@svsec}\interlinepenalty \@M\redink %
          #9\blackink\@@par}\vspace*{-9.4pt}%
\noindent{\vrule height.5pt width\textwidth}\vspace*{-2.4pt}\blackink
\else
      #6{%
\@hangfrom{\hskip #3\relax\@svsec}\interlinepenalty \@M\redink %
          #9\blackink\@@par}%
\fi%
    \endgroup
    \csname #1mark\endcsname{%
      #8}%
\ifappendix
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}% %%%%Added previous 5 lines to fix appendix toc error, seems to work -MF
\else
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
\fi
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec\redink #9\blackink}%
      \csname #1mark\endcsname{%
        #8}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

%%Change mydotted also
\newdimen\secwd
\newdimen\subsecwd
\newdimen\subsubsecwd

\def\secwd{31pt}
\def\subsecwd{36pt}
\def\subsubsecwd{56pt}


\def\ssubnumberline#1{\@hangfrom{\hbox to \secwd{#1\hfill}}}
\def\subnumberline#1{\@hangfrom{\hskip\subsecnumwidth\hbox to \subsecwd{#1\hfill}}}
\def\subsubnumberline#1{\@hangfrom{\hskip\subsubsecnumwidth\hbox to \subsubsecwd{#1\hfill}}}


\newcommand\section{%
  \gdef\chapterauthor{\@caplusone}%
  \gdef\endchapterauthors{\end@casplusone}%
  \@ifstar{\@ssection}{\@trplarg{\@section}}}
\def\@ssection#1{%
  \if@ChapterTOCs
%%%    \myaddcontentsline{\@chaptoc}{chapsection}{\string\makebox[\secnumwidth][l]{}#1}
\fi
  \@startsection{section}{1}{\z@}{-16\p@}{6\p@}{\sectionfont}*{#1}}
\def\@section[#1][#2]#3{%
  \if@ChapterTOCs
    \addtocounter{section}{1}%
    \myaddcontentsline{\@chaptoc}{chapsection}{\protect\ssubnumberline{\thesection}#1}%
    \addtocounter{section}{-1}\fi
  \@startsection{section}{1}{\z@}{-16\p@}{6\p@}{\sectionfont}[#2]{#3}}
\def\sectionauthor#1{\hfill{\ChapTOCAuthorFont #1}}

\newcommand\subsection{\@ifstar{\@ssubsection}{\@trplarg{\@subsection}}}
\def\@ssubsection#1{%
  \if@ChapterTOCs
%%    \myaddcontentsline{\@chaptoc}{chapsubsection}{\string\makebox[\subsecnumwidth][l]{}#1}
\fi
  \@startsection{subsection}{2}{\z@}{-16\p@}{6\p@}{\subsectionfont}*{#1}}
\def\@subsection[#1][#2]#3{%
  \if@ChapterTOCs
    \addtocounter{subsection}{1}%
    \myaddcontentsline{\@chaptoc}{chapsubsection}{\protect\subnumberline{\thesubsection}#1}%
    \addtocounter{subsection}{-1}\fi
  \@startsection{subsection}{2}{\z@}{-16\p@}{6\p@}{\subsectionfont}[#2]{#3}}

\newcommand\subsubsection{\@ifstar{\@ssubsubsection}{\@trplarg{\@subsubsection}}}
\def\@ssubsubsection#1{%
  \if@ChapterTOCs
%%    \myaddcontentsline{\@chaptoc}{chapsubsubsection}{\string\makebox[\subsecnumwidth][l]{}#1}
\fi
  \@startsection{subsubsection}{3}{\z@}{-16\p@}{6\p@}{\subsubsectionfont}*{#1}}
\def\@subsubsection[#1][#2]#3{%
  \if@ChapterTOCs
    \addtocounter{subsubsection}{1}%
        \myaddcontentsline{\@chaptoc}{chapsubsubsection}{\protect\subsubnumberline{\thesubsubsection}#1}%
    \addtocounter{subsubsection}{-1}\fi
  \@startsection{subsubsection}{3}{\z@}{-16\p@}{6\p@}{\subsubsectionfont}[#2]{#3}}


\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}{-16pt plus-1pt}{-1em}{\paragraphfont}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}{-16pt plus-1pt}{-1em}{\subparagraphfont}}


\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
%\newcommand\labelitemi{\textbullet}
\newcommand{\labelitemi}{$\bullet$}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par\appendixtrue
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
               
%%\long\def\@caption#1[#2]#3{%
%%  \par
%%  \addcontentsline{\csname ext@#1\endcsname}{#1}%
%%    {\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
%%  \begingroup
%%    \@parboxrestore
%%    \if@minipage
%%      \@setminipage
%%    \fi
%%    \normalsize
%%    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
%%  \endgroup}

\newif\ifoutsidefloat
\global\outsidefloatfalse
               
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\figurecaptionfont{\redink\figureNofont #1\blackink}\hskip7.8pt#2}%
  \ifdim \wd\@tempboxa >\hsize
  \if@Alonc
      \ifoutsidefloat\ifodd\c@page\else\hspace*{-6pc}\fi\hsize42pc\else\fi\vbox{\figurecaptionfont{\redink\figureNofont #1\blackink}\hskip7.8pt#2}\par
      \else
      \figurecaptionfont{\redink\figureNofont #1\blackink}\hskip7.8pt#2\par
\fi      
  \else
  \if@Alonc
    \global \@minipagefalse
    \ifoutsidefloat\ifodd\c@page\else\hspace*{-6pc}\fi\hsize42pc\else\fi\hb@xt@\hsize{\box\@tempboxa\hfill}%
\else  
    \global \@minipagefalse
    \hb@xt@\hsize{\box\@tempboxa\hfill}%
  \fi\fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}


\newcounter{numauthors}
\newif\if@break
\newif\if@firstauthor

\newcommand\tableofcontents{\cleardoublepage\thispagestyle{folio}%
  \gdef\chapterauthor{\@caplusone}%
  \gdef\endchapterauthors{\end@casplusone}%
  \make@cornermarks
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
  \vspace*{-20\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
\noindent{\vrule height.5pt width\textwidth}\par\vspace*{17.5pt}
    \vbox{\def\spreadoutfactor{1.2}\spreadout{\Chaptertitlefont  Contents}}\par\nobreak\vspace*{13pt}
\noindent{\redink\vrule height3pt width\textwidth}\blackink\par
    \vskip 34\p@}
 %%%    \chapter*{\contentsname
%%%        \@mkboth{%
%%%           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
\markboth{Contents}{Contents}
             {\let\break\space
    \let\author\toc@author
    \reset@authors
    \let\toc@draw\relax
    \@starttoc{toc}
    \toc@draw
    }
    \if@restonecol\twocolumn\fi
    }

\def\draw@part#1#2{%
  \addpenalty{-\@highpenalty}%
  \vskip1em plus\p@
  \@tempdima1.5em
  \begingroup
    \parindent\z@\rightskip\@pnumwidth
    \parfillskip-\rightskip
    \bfseries
    \leavevmode
    \advance\leftskip\@tempdima
    \hskip-\leftskip
       \redink  {\chtocnamefont Section}~#1\hfil\hb@xt@\@pnumwidth{\hss  }\par%\hb@xt@\@pnumwidth{\hss #2}
       \nobreak
         \global\@nobreaktrue
%%%    {#1\hfil}\nobreak
%%%      \if@pdf
%%%      \else
%%%        \hfil\nobreak\hb@xt@\@pnumwidth{\hss #2}%
%%%\fi
    \par
    \penalty\@highpenalty\endgroup}

\let\toc@draw\relax
%
\def\l@part#1#2{% 
\toc@draw
 \gdef\toc@draw{\draw@part{\large #1}{\large #2}}}

  \def\l@fm#1#2{%
  \toc@draw
  \gdef\toc@draw{\draw@fm{#1}{#2}}}
\def\@pnumwidth{1.8em}
\def\draw@fm#1#2{%
  \addpenalty{-\@highpenalty}%
  \vskip1em plus\p@
  \@tempdima1.5em
  \begingroup
    \parindent\z@\rightskip\@pnumwidth
    \parfillskip-\rightskip
    \fmtocfont
    \leavevmode
    \advance\leftskip\@tempdima
    \hskip-\leftskip
    {#1\hfil}\nobreak
      \if@pdf
      \else
        \hfil\nobreak\hb@xt@\@pnumwidth{\hss #2}%
\fi
    \par
    \penalty\@highpenalty\endgroup}
    
\newif\ifnosection
\global\nosectionfalse

  \def\l@chapter#1#2{%
\ifnosection \else  \toc@draw\fi
  \gdef\toc@draw{\draw@chapter{#1}{#2}}}
  
  \def\l@chapter#1#2{%
  \toc@draw
  \gdef\toc@draw{\draw@chapter{#1}{#2}}}
\def\@pnumwidth{1.8em}
\def\draw@chapter#1#2{%
  \addpenalty{-\@highpenalty}%
  \vskip1em plus\p@
  \@tempdima1.5em
  \begingroup
    \parindent\z@\rightskip\@pnumwidth
    \parfillskip-\rightskip
    \chtocfont
    \leavevmode
    \advance\leftskip70pt%\@tempdima
    \hskip-\leftskip
%%%    {#1\hfil}\nobreak
%%%        \hfil\nobreak\hb@xt@\@pnumwidth{\hss #2}%
%%%      \hskip -66.5pt%\leftskip
\redink{#1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par\vspace*{-9.7pt}
\blackink\hskip-70pt\noindent{\vrule height1pt width\textwidth}\par\vskip-6pt
      \penalty\@highpenalty
    \par\vskip4pt
    {\draw@authors}%
    \penalty\@highpenalty\endgroup}
\def\toc@author#1#2{%
  \if@firstauthor
    \@firstauthorfalse
  \else
    \ifx\@authors\@empty
      \xdef\@authors{\last@author}%
    \else
      \@cons{\@authors}{, \last@author}\fi\fi
  \stepcounter{numauthors}%
%%%%%%% commented and deleted below the second part to aviod inaccessible error % shashi % September-2008
%%  \gdef\last@author{#1 {\rm\fontsize{9\p@}{11\p@}\selectfont #2}}
\gdef\last@author{#1}
}
\def\draw@authors{%
  \let\@t\@authors
%        \hskip\leftskip
  \noindent\vbox{\if@Alona\hsize20.1pc\else\hsize26pc\fi\raggedright\small\addvspace{4pt}\ifx\@t\@empty
    \let\@t\last@author\fi
  \ifx\@t\@empty\else
    \hskip\leftskip
    \ifx\@authors\@empty
    \else
      {\scshape\@authors}
      \ifnum\c@numauthors>2,\fi
      \if@break\break\fi
      \  {and} \fi %%%\textnormal%was \normalfont, changed to make author names appear the same -MF
    {\scshape\last@author}\break\fi
  \reset@authors}\par}
\def\reset@authors{%
  \gdef\@authors{}%
  \gdef\last@author{}%
  \@firstauthortrue
  \setcounter{numauthors}{0}}
\newlength\section@toc@skip
\section@toc@skip1.5em
\newlength\SectionTOCWidth
\SectionTOCWidth2.8em
\def\l@section#1#2{%
  \toc@draw
  \gdef\toc@draw{\draw@section{#1}{#2}}}
\def\draw@section#1#2{%
  \@dottedtocline{1}{\section@toc@skip}{\SectionTOCWidth}{\sectocfont\uppercase{#1} }{{
\sectocfont #2}}}
\newlength\subsection@toc@skip
\subsection@toc@skip\section@toc@skip
\advance\subsection@toc@skip\SectionTOCWidth
\newlength\SubSectionTOCWidth
\SubSectionTOCWidth3.6em
\def\l@subsection#1#2{%
  \toc@draw
  \gdef\toc@draw{\draw@subsection{#1}{#2}}}
\def\draw@subsection#1#2{%
  \@dottedtocline{2}{\subsection@toc@skip}{\SubSectionTOCWidth}{\subsectocfont #1}{{
\subsectocfont #2}}}
\newlength\subsubsection@toc@skip
\subsubsection@toc@skip\subsection@toc@skip
\advance\subsubsection@toc@skip\SubSectionTOCWidth
\newlength\SubSubSectionTOCWidth
\SubSubSectionTOCWidth4.1em
\def\l@subsubsection#1#2{%
  \toc@draw
  \gdef\toc@draw{\draw@subsubsection{#1}{#2}}}
\def\draw@subsubsection#1#2{%
  \@dottedtocline{3}{\subsubsection@toc@skip}{\SubSubSectionTOCWidth}{\subsubsectocfont#1}{{
\subsubsectocfont #2}}}
\newlength\paragraph@toc@skip
\paragraph@toc@skip\subsubsection@toc@skip
\advance\paragraph@toc@skip\SubSubSectionTOCWidth
\newlength\ParagraphTOCWidth
\ParagraphTOCWidth4.1em
\def\l@paragraph#1#2{%
  \toc@draw
  \gdef\toc@draw{\draw@paragraph{#1}{#2}}}
\def\draw@paragraph#1#2{%
  \@dottedtocline{4}{\paragraph@toc@skip}{\ParagraphTOCWidth}{#1}{{
\tocfont #2}}}
\newlength\subparagraph@toc@skip
\subparagraph@toc@skip\paragraph@toc@skip
\advance\subparagraph@toc@skip\ParagraphTOCWidth
\def\l@subparagraph#1#2{%
  \toc@draw
  \gdef\toc@draw{\draw@subparagraph{#1}{#2}}}
\def\draw@subparagraph#1#2{%
  \@dottedtocline{5}{\subparagraph@toc@skip}{6em}{#1}{{
\tocfont #2}}}

\def\@dottedtocline#1#2#3#4#5{\blackink%
  \ifnum #1>\c@tocdepth \else
    \vskip.3em% \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
%%     \leaders\hbox{$\m@th
%%        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
        \hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
      
\newcommand\chapterauthors{%
  \def\break{\string\break\ }%
  \def\protect##1{\string ##1 }}
\def\end@cas{}
\def\end@casplusone{\vskip4pt\@doendpe}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\def\make@chaptoc{% chapter author 
  {\parindent\z@
  \newcommand\FolioBoldFont{}%
  \let\@b\bullet
  \def\bullet{\raisebox{2pt}{$\scriptscriptstyle\@b$}}%
  \let\SubsectionItalicFont\it
%\ifx\chapter@author\@empty\else
{\rm\fontsize{10\p@}{10\p@}\bfseries\selectfont
%\the\c@numauthors
    \ifnum\c@numauthors=1
        \chapter@authorone\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationone}\vskip12\p@
            \fi
        \ifnum\c@numauthors=2
                    \chapter@authorone\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationone}\vskip12\p@
                        \chapter@authortwo\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationtwo}
                            \fi
                                \ifnum\c@numauthors=3
                                    \chapter@authorone\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationone}\vskip12\p@
                                        \chapter@authortwo\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationtwo}\vskip12\p@
                                            \chapter@authorthree\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationthree}
                                                \fi
                                                    \ifnum\c@numauthors=4
                                                        \chapter@authorone\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationone}\vskip12\p@
                                                            \chapter@authortwo\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationtwo}\vskip12\p@
                                                                \chapter@authorthree\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationthree}\vskip12\p@
                                                                    \chapter@authorfour\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationfour}
                                                                        \fi
                                                    \ifnum\c@numauthors=5
                                                        \chapter@authorone\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationone}\vskip12\p@
                                                            \chapter@authortwo\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationtwo}\vskip12\p@
                                                                \chapter@authorthree\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationthree}\vskip12\p@
                                                                    \chapter@authorfour\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationfour}\vskip12\p@
                                                                            \chapter@authorfive\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationfive}
                                                                        \fi                                                                        
                                                    \ifnum\c@numauthors=6
                                                        \chapter@authorone\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationone}\vskip12\p@
                                                            \chapter@authortwo\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationtwo}\vskip12\p@
                                                                \chapter@authorthree\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationthree}\vskip12\p@
                                                                    \chapter@authorfour\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationfour}\vskip12\p@
                                                                            \chapter@authorfive\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationfive}\vskip12\p@
                                                                                    \chapter@authorsix\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationsix}
                                                                        \fi                                                                                                                                                
                                                    \ifnum\c@numauthors=7
                                                        \chapter@authorone\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationone}\vskip12\p@
                                                            \chapter@authortwo\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationtwo}\vskip12\p@
                                                                \chapter@authorthree\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationthree}\vskip12\p@
                                                                    \chapter@authorfour\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationfour}\vskip12\p@
                                                                      \chapter@authorfive\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationfive}\vskip12\p@
                                                                       \chapter@authorsix\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationsix}\vskip12\p@
                                                                               \chapter@authorseven\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationseven}
                                                                        \fi                                                                                                                                                
                                                    \ifnum\c@numauthors=8
                                                        \chapter@authorone\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationone}\vskip12\p@
                                                            \chapter@authortwo\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationtwo}\vskip12\p@
                                                                \chapter@authorthree\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationthree}\vskip12\p@
                                                                    \chapter@authorfour\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationfour}\vskip12\p@
                                                                      \chapter@authorfive\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationfive}\vskip12\p@
                                                                       \chapter@authorsix\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationsix}\vskip12\p@
                                                                       \chapter@authorseven\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationseven}\vskip12\p@
                                                                        \chapter@authoreight\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationeight}
                                                                        \fi                                                                                                                                                
                                                    \ifnum\c@numauthors=9
                                                        \chapter@authorone\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationone}\vskip12\p@
                                                            \chapter@authortwo\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationtwo}\vskip12\p@
                                                                \chapter@authorthree\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationthree}\vskip12\p@
                                                                    \chapter@authorfour\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationfour}\vskip12\p@
                                                                      \chapter@authorfive\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationfive}\vskip12\p@
                                                                       \chapter@authorsix\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationsix}\vskip12\p@
                                                                       \chapter@authorseven\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationseven}\vskip12\p@
                                                                        \chapter@authoreight\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationeight}\vskip12\p@
                                                                        \chapter@authornine\vskip6\p@
        {\it\fontsize{10\p@}{10\p@}\selectfont\chapter@affiliationnine}
                                                                        \fi                                                                                                                                                
                                                                       
}
 \gdef\chapter@authorone{}\gdef\chapter@affiliationone{}%
 \gdef\chapter@authortwo{}\gdef\chapter@affiliationtwo{}%
 \gdef\chapter@authorthree{}\gdef\chapter@affiliationthree{}%
 \gdef\chapter@authorfour{}\gdef\chapter@affiliationfour{}%
  \gdef\chapter@authorfive{}\gdef\chapter@affiliationfive{}%
   \gdef\chapter@authorsix{}\gdef\chapter@affiliationsix{}%
    \gdef\chapter@authorseven{}\gdef\chapter@affiliationseven{}%
     \gdef\chapter@authoreight{}\gdef\chapter@affiliationeight{}%
      \gdef\chapter@authornine{}\gdef\chapter@affiliationnine{}%
       \gdef\chapter@authorten{}\gdef\chapter@affiliationten{}%
   \gdef\chapter@authoreleven{}\gdef\chapter@affiliationeleven{}%
    \gdef\chapter@authortwelve{}\gdef\chapter@affiliationtwelve{}%
     \gdef\chapter@authorthirteen{}\gdef\chapter@affiliationthirteen{}%
      \gdef\chapter@authorfourteen{}\gdef\chapter@affiliationfourteen{}%
       \gdef\chapter@authorfifteen{}\gdef\chapter@affiliationfifteen{}%       

  \vskip 14.6\p@
{\leftskip\secnumwidth\def\author##1##2{}
\noindent\redink\hspace*{-20pt}{\fontsize{12}{14}\sffamily\selectfont\uppercase{Contents}}\par\vspace*{-4pt}
\hspace*{-20pt}{\vrule height.5pt width\textwidth}\par\blackink
\@input{\thechapter.toc}\par}%
  }
\reset@authors}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\iffinishedfromone
\global\finishedfromonefalse
%
\newif\iffinishedfromtwo
\global\finishedfromtwofalse
%
\newif\iffinishedfromthree
\global\finishedfromthreefalse
%
\newif\iffinishedfromfour
\global\finishedfromfourfalse
%
\newif\iffinishedfromfive
\global\finishedfromfivefalse
%
\newif\iffinishedfromsix
\global\finishedfromsixfalse
%
\newif\iffinishedfromseven
\global\finishedfromsevenfalse
%
\newif\iffinishedfromeight
\global\finishedfromeightfalse
%
\newif\iffinishedfromnine
\global\finishedfromninefalse
%
\newif\iffinishedfromten
\global\finishedfromtenfalse
%
\newif\iffinishedfromeleven
\global\finishedfromelevenfalse
%
\newif\iffinishedfromtwelve
\global\finishedfromtwelvefalse
%
\newif\iffinishedfromthirteen
\global\finishedfromthirteenfalse
%
\newif\iffinishedfromfourteen
\global\finishedfromfourteenfalse
%
\newif\iffinishedfromfifteen
\global\finishedfromfifteenfalse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\singleauthorchapter{\finishedfromonetrue}
\def\twoauthorchapter{\finishedfromtwotrue}
\def\threeauthorchapter{\finishedfromthreetrue}
\def\fourauthorchapter{\finishedfromfourtrue}
\def\fiveauthorchapter{\finishedfromfivetrue}
\def\sixauthorchapter{\finishedfromsixtrue}
\def\sevenauthorchapter{\finishedfromseventrue}
\def\eightauthorchapter{\finishedfromeighttrue}
\def\nineauthorchapter{\finishedfromninetrue}
\def\tenauthorchapter{\finishedfromtentrue}
\def\elevenauthorchapter{\finishedfromeleventrue}
\def\twelveauthorchapter{\finishedfromtwelvetrue}
\def\thirteenauthorchapter{\finishedfromthirteentrue}
\def\fourteenauthorchapter{\finishedfromfourteentrue}
\def\fifteenauthorchapter{\finishedfromfifteentrue}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\iffinish
\global\finishfalse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newsavebox\@AUonebox
\newsavebox\@AUtwobox
\newsavebox\@AUthreebox
\newsavebox\@AUfourbox
\newsavebox\@AUfivebox
\newsavebox\@AUsixbox
\newsavebox\@AUsevenbox
\newsavebox\@AUeightbox
\newsavebox\@AUninebox
\newsavebox\@AUtenbox
\newsavebox\@AUelevenbox
\newsavebox\@AUtwelvebox
\newsavebox\@AUthirteenbox
\newsavebox\@AUfourteenbox
\newsavebox\@AUfifteenbox

%
\newsavebox\@AUaffonebox
\newsavebox\@AUafftwobox
\newsavebox\@AUaffthreebox
\newsavebox\@AUafffourbox
\newsavebox\@AUafffivebox
\newsavebox\@AUaffsixbox
\newsavebox\@AUaffsevenbox
\newsavebox\@AUaffeightbox
\newsavebox\@AUaffninebox
\newsavebox\@AUafftenbox
\newsavebox\@AUaffelevenbox
\newsavebox\@AUafftwelvebox
\newsavebox\@AUaffthirteenbox
\newsavebox\@AUafffourteenbox
\newsavebox\@AUafffifteenbox

%
\newsavebox\@finalAUboxfromone
\newsavebox\@finalAUboxfromtwo
\newsavebox\@finalAUboxfromthree
\newsavebox\@finalAUboxfromfour
\newsavebox\@finalAUboxfromfive
\newsavebox\@finalAUboxfromsix
\newsavebox\@finalAUboxfromseven
\newsavebox\@finalAUboxfromeight
\newsavebox\@finalAUboxfromnine
\newsavebox\@finalAUboxfromten
\newsavebox\@finalAUboxfromeleven
\newsavebox\@finalAUboxfromtwelve
\newsavebox\@finalAUboxfromthirteen
\newsavebox\@finalAUboxfromfourteen
\newsavebox\@finalAUboxfromfifteen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@ca#1#2{%
%  \def\chapter@author{#1}%
%  \def\chapter@affiliation{#2}%
  \if@filesw%
    \write\@auxout{%
\string\@writefile{toc}{\string\author{#1}{}}%
}%
  \fi
%%%%%%%%%%%%%%%

\ifnum\c@numauthors>8
    \resetcounter{numauthors}
\fi 
\stepcounter{numauthors}
%%\the\c@numauthors
\ifnum\c@numauthors=1 % 
    \sbox\@AUonebox{\vbox{\hsize\textwidth\CAPlusOneFont\raggedright\noindent \CAPlusOneFont#1}}
    \sbox\@AUaffonebox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromone{\copy\@AUonebox}
    \def\chapter@authorone{\copy\@finalAUboxfromone}
    \def\chapter@affiliationone{\copy\@AUaffonebox}
\fi \ifnum\c@numauthors=2
    \sbox\@AUtwobox{\vbox{\hsize\textwidth\CAPlusOneFont\raggedright\noindent \CAPlusOneFont#1}}
    \sbox\@AUafftwobox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromtwo{\copy\@AUtwobox}
    \def\chapter@authortwo{\copy\@finalAUboxfromtwo}
    \def\chapter@affiliationtwo{\copy\@AUafftwobox}
\fi \ifnum\c@numauthors=3
    \sbox\@AUthreebox{\vbox{\hsize\textwidth\CAPlusOneFont\raggedright\noindent \CAPlusOneFont#1}}
    \sbox\@AUaffthreebox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromthree{\copy\@AUthreebox}
    \def\chapter@authorthree{\copy\@finalAUboxfromthree}
    \def\chapter@affiliationthree{\copy\@AUaffthreebox}
\fi \ifnum\c@numauthors=4
    \sbox\@AUfourbox{\vbox{\hsize\textwidth\CAPlusOneFont\raggedright\noindent \CAPlusOneFont#1}}
    \sbox\@AUafffourbox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromfour{\copy\@AUfourbox}
    \def\chapter@authorfour{\copy\@finalAUboxfromfour}
    \def\chapter@affiliationfour{\copy\@AUafffourbox}
\fi \ifnum\c@numauthors=5
    \sbox\@AUfivebox{\vbox{\hsize\textwidth\CAPlusOneFont\raggedright\noindent \CAPlusOneFont#1}}
    \sbox\@AUafffivebox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromfive{\copy\@AUfivebox}
    \def\chapter@authorfive{\copy\@finalAUboxfromfive}
    \def\chapter@affiliationfive{\copy\@AUafffivebox}
\fi \ifnum\c@numauthors=6
    \sbox\@AUsixbox{\vbox{\hsize\textwidth\CAPlusOneFont\raggedright\noindent \CAPlusOneFont#1}}
    \sbox\@AUaffsixbox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromsix{\copy\@AUsixbox}
    \def\chapter@authorsix{\copy\@finalAUboxfromsix}
    \def\chapter@affiliationsix{\copy\@AUaffsixbox}
\fi \ifnum\c@numauthors=7
    \sbox\@AUsevenbox{\vbox{\hsize\textwidth\CAPlusOneFont\raggedright\noindent \CAPlusOneFont#1}}
    \sbox\@AUaffsevenbox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromseven{\copy\@AUsevenbox}
    \def\chapter@authorseven{\copy\@finalAUboxfromseven}
    \def\chapter@affiliationseven{\copy\@AUaffsevenbox}
\fi \ifnum\c@numauthors=8
    \sbox\@AUeightbox{\vbox{\hsize\textwidth\CAPlusOneFont\raggedright\noindent \CAPlusOneFont#1}}
    \sbox\@AUaffeightbox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromeight{\copy\@AUeightbox}
    \def\chapter@authoreight{\copy\@finalAUboxfromeight}
    \def\chapter@affiliationeight{\copy\@AUaffeightbox}
\fi \ifnum\c@numauthors=9
    \sbox\@AUninebox{\vbox{\hsize\textwidth\CAPlusOneFont\raggedright\noindent \CAPlusOneFont#1}}
    \sbox\@AUaffninebox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromnine{\copy\@AUninebox}
    \def\chapter@authornine{\copy\@finalAUboxfromnine}
    \def\chapter@affiliationnine{\copy\@AUaffninebox}
\fi}


\def\@caplusone{\@ifstar{\@scaplusone}{\@ifnextchar[{\@xcaplusone}{\@xcaplusone[]}}}
\def\@xcaplusone[#1]#2#3{%
  \def\@@empty{#1}\ifx\@empty\@@empty\@ca{#2}{#3}\else\@ca{#2}{#1}\fi\@scaplusone{#2}{#3}}
\def\@scaplusone#1#2{%
  \ifhmode\vskip-12pt\fi
%%Shashi Commented
%%%  \noindent\hskip3pc{\CAPlusOneFont\baselineskip14pt #1\def\@t{#2}\ifx\@t\@empty\else,\fi}\hskip6pt{\CAAPlusOneFont #2}\par
}

\def\chapterauthoronly#1#2{\@ca{#1}{}\@scaplusone{#1}{#2}}
\def\myaddcontentsline#1#2#3{\pagebreak[3]%
  \if@filesw
    \begingroup
    \let\label\@gobble\let\index\@gobble\let\glossary\@gobble
    \def\break{\ }%
    \def\protect##1{\string ##1 }%
    \@temptokena{\thepage}%
    \edef\@tempa{\write#1{\string\chapcontentsline{#2}{\string\raggedright\space #3}{\the\@temptokena}}}\@tempa
    \if@nobreak\ifvmode\nobreak\fi\fi
    \endgroup
  \fi}
\def\chapcontentsline#1{\csname l@#1\endcsname}
\def\l@chapsection{\@mydottedtocline{1}{\z@}{6pt}}
\def\l@chapsubsection{\@mydottedtocline{2}{\secnumwidth}{6pt}}
\def\l@chapsubsubsection{\@mydottedtocline{3}{\subsecnumwidth}{36pt}}
\newcount\c@chaptocdepth
\setcounter{chaptocdepth}{3}
\def\@mytocline#1#2#3#4#5{%
  \ifnum #1>\c@chaptocdepth
  \else
    \vskip 2pt plus.2\p@
    \ifnum #1=1\ifnum\c@chaptocdepth>1\addvspace{12pt}\fi\fi
    {\leftskip #2\relax% \rightskip \@tocrmarg \parfillskip -\rightskip
      \interlinepenalty\@M
      \leavevmode
      \@tempdima #3\relax
      \rightskip\z@
      \vbox{\ChapTOCFont #4\nobreak}%
      \par}\fi}
\def\@mydottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@chaptocdepth
  \else
\fontsize{11}{13}\selectfont
{\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     % \parindent #2\relax\@afterindenttrue
      \interlinepenalty\@M
      \leavevmode
      \def\@dotsep{1.2}%
      \@tempdima #3\relax
      \rightskip\z@
%      \advance\hsize-\secnumwidth
%      \hskip-\secnumwidth
\if@Alonb
\hangindent\secnumwidth\hsize370pt\else\hangindent\secnumwidth\hsize310pt\fi 
\if@Alonc
\hangindent\secnumwidth\hsize406pt\fi %478
#4
        \if@pdf
          \hfill
        \else
          \nobreak\leaders\hbox{$\m@th\mkern\@dotsep mu.\mkern\@dotsep mu$}\hfill\nobreak
          \hbox to24\p@{\hfil #5}\fi
      \par}\fi}      

\newcommand\halftitle{\clearpage\thispagestyle{empty}%
      {\parindent \z@ \raggedright \baselineskip 6\p@ \lineskip \z@ \parskip \z@
    \vbox{
    \vskip 22\p@
    \chap@rule
    \vskip -1\p@
    \FMHeadFont Half Title Page
    \vskip 59\p@}}%
    }
    
    \newcommand\booktitle{\cleardoublepage\thispagestyle{empty}%
      {\parindent \z@ \raggedright \baselineskip 6\p@ \lineskip \z@ \parskip \z@
    \vbox{
    \vskip 22\p@
    \chap@rule
    \vskip -1\p@
    \FMHeadFont Title Page
    \vskip 59\p@}}%
    }
    
\newcommand\dedication[1]{\clearpage\thispagestyle{empty}
\vbox{\centering\addvspace{1in}\large #1}}

\newcommand\locpage{\clearpage\thispagestyle{empty}%
  {\parindent \z@ \raggedright \baselineskip 6\p@ \lineskip \z@ \parskip \z@
    \vbox{
    \vskip 22\p@
    \chap@rule
    \vskip -1\p@
    \FMHeadFont LOC Page
    \vskip 59\p@}}%
    }

\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.7em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \@mkboth{\bibname}{\bibname}%
%%%       \addcontentsline{toc}{chapter}{\bibname}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\newenvironment{thefurtherreading}[1]
     {\section*{FURTHER READING}\vspace*{-9.3pt}%
\bibfont
\noindent{\redink\vrule height.5pt width\textwidth}\vspace*{-8.2pt}\blackink
\ifappendix
\else
%\addcontentsline{toc}{section}{Further Reading} %%%Again seems to make a redundancy like exercise list -MF
\fi
%%      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{}%\@biblabel{\@arabic\c@enumiv}
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
%            \advance\leftmargin\labelsep
%\advance\leftmargin7pt
%\itemindent-2pc
\advance\leftmargin5pt%
\itemindent-1.85pc%
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thefurtherreaading' environment}}%
      \endlist}




\newenvironment{theindex}
               {\cleardoublepage\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\indexname}{\indexname}%
                        \markboth{Index}{Index}
                        \pagestyle{headings}
                        \addcontentsline{toc}{fm}{\indexname}
                \thispagestyle{folio}\parindent\z@\raggedright
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{FIGURE}
\newcommand\tablename{TABLE}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\newcommand\crcrule{\hbox to\textwidth{\rule{\textwidth}{.5\p@}}}
\newcommand\chap@rule{\crcrule}
\newcommand\sec@rule{\crcrule}
\def\@affiliate[#1]{\gdef\@affiliation{#1}}
\def\@affiliation{}

\def\def@theequation{%
  \if@numberinsequence
    \def\theequation{%
\if@numbysec\thesection\else\thechapter\fi.%
\@arabic\c@shared}%
  \else
    \def\theequation{%
\if@numbysec\thesection\else\thechapter\fi.%
\@arabic\c@equation}\fi}

\def\affiliation#1{{\AffiliationFont\noindent #1\vskip 36bp}}
\newbox\tempbox

\newdimen\nomenwidth

\newenvironment{symbollist}[1]{%
\addvspace{12pt}
			\setbox\tempbox\hbox{#1\hskip1em}%
   \global\nomenwidth\wd\tempbox
   %\section*{Sumbol Description}
\noindent{\sectionfont{Symbol Description}}\vskip6pt
\begin{multicols}{2}}{%
		\end{multicols}\par\addvspace{12pt}}
\def\symbolentry#1#2{\par\noindent\@hangfrom{\hbox to \nomenwidth{#1\hss}}#2\par}

%%%%%%%%%%%%%%%%%%%%

\def\Boxhead#1{\par\addvspace{3pt plus2pt}\noindent{\centering\bfseries#1\par}\vskip3pt}


\newbox\tempbox%
\newdimen\tempdimen%
%
\newenvironment{shortbox}{\par\addvspace{12pt plus2pt}%
\if@Alona
\setbox\tempbox\vbox\bgroup\hsize27pc%
\else\if@Alonb
\setbox\tempbox\vbox\bgroup\hsize32pc%
\else
\setbox\tempbox\vbox\bgroup\hsize25pc%
\fi\fi
}{%
\egroup%
\noindent\fboxsep6pt\fboxrule.5pt\hspace*{0pt}\fbox{\box\tempbox}
\par\addvspace{12pt plus2pt}}%
%


\def\grayink{\special{color cmyk 0 0 0 0.2}}
\def\blackink{\special{color cmyk 0 0 0 1.0}} %  
\def\whiteink{\special{color cmyk 0 0 0 0}} % 0%

\newenvironment{shadebox}{%
\setbox\tempbox\hbox\bgroup\vbox\bgroup\leftskip12pt\rightskip\leftskip}{\par\addvspace{12pt}
\egroup\egroup\par\addvspace{25pt} 
\tempdimen\ht\tempbox
\advance\tempdimen by 1pc
\noindent{\hbox to \wd\tempbox{\vbox to \ht\tempbox{\hsize\textwidth{\special{color push}\grayink\vspace*{-12pt}\noindent\vrule height\tempdimen width\textwidth 
\special{color pop}\blackink}}}}%
\llap{\unhbox\tempbox}\par\addvspace{12pt}}


%%%%%%%%%% Note %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newbox\tempbox
\newdimen\notewidth
\newenvironment{notelist}[1]{%
\addvspace{6pt}
			\setbox\tempbox\hbox{#1\hskip.57em}%
   \global\notewidth\wd\tempbox
}{%
		\par\addvspace{6pt}}

\def\notes#1#2{\par\noindent\@hangfrom{\hbox to \notewidth{\bf #1\hss}}#2\par}
%%%%%%%%%%%%%%%% wherelist %%%%%%%%%%%%%%%%
\newbox\wherebox
\newdimen\wherewidth
\newenvironment{wherelist}[1]{\leftskip10pt%
\addvspace{6pt}
			\setbox\wherebox\hbox{#1\hskip1em}%
   \global\wherewidth\wd\wherebox
\noindent\hspace*{-14pt} where
}{%
\par\addvspace{6pt}}
\def\whereentry#1#2#3{\par\noindent\@hangfrom{\hbox to \wherewidth{#1\hss}#2\hskip6pt}#3\par}
%%%%%%%%%%%%
\newenvironment{unnumlist}{%
  \ifnum \@enumdepth >3 \@toodeep\else
    \advance\@enumdepth\@ne
    \list{}{%
\leftmargini27.5pt \leftmarginii17.5pt\leftmarginiv17.5pt
%    \leftmargin\parindent
    \advance\leftmargin-.2em
    \advance\leftmarginii.2em
    \advance\leftmarginiii.1em
    \advance\leftmarginiv.2em
    \def\makelabel##1{\hss\llap{##1}}}
    \fi%
}{%
  \endlist}
  %
\newenvironment{extract}{%
		\par\addvspace{11.5pt minus2pt}%
  \leftskip2em\rightskip\leftskip
 \noindent\ignorespaces
}{%
		\par\addvspace{11.5pt minus2pt}%
  \@endparenv}
%
%
\def\VA#1#2{\addvspace{12pt}\raggedleft #1\rightskip3em\par #2\rightskip3em}
%
\newenvironment{VF}{\VfFont%
		\par\addvspace{12pt minus2pt}%
\noindent{\vrule height2pt width\textwidth}\par\vskip7.3pt
  \leftskip3em\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\noindent{{\vrule height2pt width\textwidth}}\par\addvspace{12pt minus2pt}%
  \@endparenv}
%
\def\VTA#1#2{\addvspace{12pt}\raggedleft #1\rightskip3em\par {\it #2}\rightskip3em}
%
%
\def\VT{\par\addvspace{3.5pt}\noindent}

\def\VH#1{{\normalfont\fontsize{12.5}{14.5}\itshape\centering\selectfont #1\par}\addvspace{5.5pt}}
%
\newenvironment{VT1}{\VfFont%
		\par\addvspace{12pt minus2pt}%
\noindent{\vrule height2pt width\textwidth}\par\vskip7.5pt
  \leftskip3em\rightskip\leftskip
%\@afterheading
\parindent0pt
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\noindent{{\vrule height2pt width\textwidth}}\par\addvspace{10pt minus2pt}%
  \@endparenv}
%

%%%%%%%%%%%% Glossary %%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{Glossary}
               {\list{}{\section*{Glossary}\vspace*{-10.3pt}%
\noindent{\redink\vrule height.5pt width\textwidth}\vspace*{-8.4pt}\blackink
\labelwidth\z@\leftmargin18pt \itemindent-18pt
                        \let\makelabel\glosslabel}}
               {\endlist}
\newcommand\glosslabel[1]{\hspace\labelsep\normalfont\bfseries #1:}


\tabcolsep 5pt
\arrayrulewidth .5pt
\doublerulesep 1pt
%\newcounter{subtable}[table]
\newif\if@tablerules\@tablerulestrue
\newif\if@centertable\@centertabletrue
\newif\if@centertabletitle\@centertabletitletrue
\newbox\@tablebox
\newbox\@tabletitlebox
\newdimen\@tablewidth
\newdimen\@tabletitlewidth
\newdimen\max@tablewidth
\newcommand\automaticrules{\@tablerulestrue}
\newcommand\noautomaticrules{\@tablerulesfalse}
\def\thetable{%
\thechapter.%
\@arabic\c@table}
\def\thesubtable{%
\thechapter.%
\@arabic\c@table\alph{subtable}}
\def\resettableletter{\setcounter{subtable}{0}}
\def\@Tabletitle{}
\newcommand\tabletitle{\@ifnextchar[{\@xtabletitle}{\@tabletitlewidth\z@\@ytabletitle}}
\def\@@tabletitle{}
\newif\ifshorttabletitle
\global\shorttabletitlefalse
%\def\@xtabletitle#1{\@tabletitlewidth#1\@ytabletitle}
%
\def\tabnumberline#1{\hbox to 26.5pt{#1\hfil}}

\def\@xtabletitle[#1]#2{%
  \gdef\@@tabletitle{#1}%
  \gdef\@tabletitle{#2}%
  \let\@Tabletitle\@TableTitle
  \refstepcounter{table}%
  {\let\footnotemark\@empty
    \let\footnote\@gobble
    \addcontentsline{\ext@table}{table}{\protect\numberline{\thetable}{\@@tabletitle}}}}
%%%%
%\long\def\@xtabletitle[#1]#2{%
%  \setbox\@ttbox\hbox{#1}\global\shorttabletitletrue
%  \def\@@tabletitle{\ifx\@ttbox\@empty\else#1\fi}%
%  \def\@tabletitle{#2}%
%  \let\@Tabletitle\@TableTitle
%  \refstepcounter{table}%
%  {\let\footnotemark\@empty
%    \let\footnote\@gobble
%    \addcontentsline{\ext@table}{table}{\protect\numberline{\thetable}{%
%\ifshorttabletitle\@@tabletitle\else\@tabletitle\fi}}}}

%%%
%
\long\def\@ytabletitle#1{%
  \def\@tabletitle{#1}%
  \let\@Tabletitle\@TableTitle
  \refstepcounter{table}%
  {\let\footnotemark\@empty
    \let\footnote\@gobble
    \addcontentsline{\ext@table}{table}{\protect\numberline{\thetable}{\@tabletitle}}}}
\def\tabletitlelet{\@ifnextchar[{\@xtabletitlelet}{\@tabletitlewidth\z@\@ytabletitlelet}}
\def\@xtabletitlelet[#1]{\@tabletitlewidth#1\@ytabletitlelet}
\long\def\@ytabletitlelet#1{%
  \def\@tabletitle{#1}%
  \let\@Tabletitle\@TableTitle
  \ifnum\c@subtable=0\stepcounter{table}\fi
  \let\@currentlabel\thesubtable
  {\let\footnotemark\@empty
    \let\footnote\@gobble
    \addcontentsline{\ext@table}{table}{\protect\numberline{\thetable}{\@tabletitle}}}}
\def\@TableTitle{%
\if@Alonc  
\ifoutsidefloat\ifodd\c@page\else
  \hspace*{-6pc}\fi\noindent{%
  \vbox{{\redink\TableNumberFont TABLE\ \thetable}\hskip9pt\blackink\TableTitleFont\@tabletitle}}
  \else
  \fi
\else
 \noindent{%
  \vbox{{\redink\TableNumberFont TABLE\ \thetable}\hskip9pt\blackink\TableTitleFont\@tabletitle}}
  \fi}
\def\table{%
  %\long\def\caption##1{\tabletitle{##1}\@TableTitle\par}%
  \@float{table}}
\@namedef{table*}{%
  \long\def\caption##1{\tabletitle{##1}\@TableTitle\par}%
  \@dblfloat{table}}

\def\@tabular{%
  \leavevmode
  \if@centertable\hfil\fi
  \vbox\bgroup
  \setbox\@tablebox\hbox\bgroup
  \baselineskip11pt
  \global\let\@fn\@empty
  \def\footnote##1{\footnotemark\gdef\@fn{##1}}
  \renewcommand{\arraystretch}{.916666666667}%
  $\let\@acol\@tabacol
  \let\@classz\@tabclassz
  \let\@classiv\@tabclassiv
  \let\\\@tabularcr
  \@tabarray}
\def\endtabular{%
  \crcr\egroup\egroup $\egroup
  \@tablewidth\wd\@tablebox
  \ifnum\@tabletitlewidth>0
    {\hsize\@tabletitlewidth\raggedright\global\setbox\@tabletitlebox\vbox{\@Tabletitle}}%
  \else
    \setbox\@tabletitlebox\hbox{\@Tabletitle}%
    \ifnum\wd\@tabletitlebox>\@tablewidth
      {\hsize\@tablewidth\raggedright\global\setbox\@tabletitlebox\vbox{\@Tabletitle}}\fi
    \@tabletitlewidth\wd\@tabletitlebox\fi
  \ifnum\@tabletitlewidth>0
    \ifnum\@tabletitlewidth>\@tablewidth\@tablewidth\@tabletitlewidth\fi
    \hbox to\@tabletitlewidth{\if@centertabletitle\hfil\fi\box\@tabletitlebox\hfil}\par\fi
  \max@tablewidth\@tablewidth
  \ifnum\@tabletitlewidth>\max@tablewidth\max@tablewidth\@tabletitlewidth\fi
\if@Alonc  
  \if@tablerules\ifnum\@tabletitlewidth>0\vskip-6pt\fi
\ifoutsidefloat\ifodd\c@page\else\hspace*{-6pc}\fi\fi  
    \hbox to\max@tablewidth{\redink\if@centertable\hfil\fi\rule{\@tablewidth}{.5pt}\hfil\blackink}\vskip1.5pt\par\fi
\ifoutsidefloat\ifodd\c@page\else\hspace*{-6pc}\fi\fi  
  \hbox to\max@tablewidth{\if@centertable\hfil\fi\box\@tablebox\hfil}\vskip1pt
\ifoutsidefloat\ifodd\c@page\else\hspace*{-6pc}\fi\fi  
  \if@tablerules\hbox to\max@tablewidth{\if@centertable\hfil\fi\rule{\@tablewidth}{.5pt}\hfil}\par\fi
 \else
  \if@tablerules
    \ifnum\@tabletitlewidth>0\vskip-6pt\fi
    \hbox to\max@tablewidth{\redink\if@centertable\hfil\fi\rule{\@tablewidth}{.5pt}\hfil\blackink}\vskip1.5pt\par\fi
  \hbox to\max@tablewidth{\if@centertable\hfil\fi\box\@tablebox\hfil}\vskip1pt
  \if@tablerules\hbox to\max@tablewidth{\if@centertable\hfil\fi\rule{\@tablewidth}{.5pt}\hfil}\par\fi
 \fi 
  \ifx\@fn\@empty\else\FootnoteFont\parindent\z@\noindent\@makefnmark\@fn\par\fi
  \egroup\hfil
  \vskip 0pt plus 12pt
  \gdef\@Tabletitle{}}

\def\tch#1{\tchfont #1\llstrut\hfill}
\def\tsh#1{\TableSubheadFont #1\hfill}
\newcommand\llstrut{\rule[-6pt]{0pt}{14pt}}
\newcommand\flstrut{\rule{0pt}{10pt}}
\newcommand\tabletitlestrut{\rule{0pt}{20pt}}

\newenvironment{exerciselist}
               {\section*{EXERCISES}\vspace*{-10.3pt}%
\setcounter{equation}{0}
\noindent{\redink\vrule height.5pt width\textwidth}\vspace*{-8.4pt}\blackink
\ifappendix
\else
%%%%\addcontentsline{toc}{section}{Exercises} %This makes a redundancy it seems; should this stay and the other exercise gone? -MF
\fi
\setlength\leftmargini  {25.5pt}
\begin{enumerate}
\labelsep8pt
\renewcommand\labelenumi{\theenumi}
\renewcommand\theenumi{\thechapter.\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii.}
\renewcommand\labelenumii{\theenumii}
\setlength\leftmarginii{1.4em}
\renewcommand\theequation{P\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\def\@listii{\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    7\p@ \@plus0\p@ \@minus\p@
              \parsep    0\p@ \@plus\p@  \@minus\p@
              \itemsep  7pt% \parsep
\renewcommand\theequation{P\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
              }
}
               {\end{enumerate}}


\newenvironment{martext}{\ifodd\c@page\begin{adjustwidth}{0pc}{-6pc}\else\begin{adjustwidth}{-6pc}{0pc}\fi}{\end{adjustwidth}\addvspace{12pt}}


%%%\if@Alonc
%%%\includecomment{martext}
%%%\else
%%%\excludecomment{martext}
%%%\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newdimen\concolwidth
\newbox\stempbox
\def\contributor#1#2#3{\addvspace{10pt}{%
\setbox\stempbox\hbox{\ContributorAffiliationFont #2}
\concolwidth\wd\stempbox
  \noindent{\ContributorNameFont #1}\par
  \ifdim\concolwidth>\columnwidth \vspace*{3pt} \else \fi
  \noindent{\vbox{\hangindent12pt\ContributorAffiliationFont #2}}\vskip-1\p@
  \noindent{\vbox{\hangindent12pt\ContributorAffiliationFont #3}}}}



\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
    
\frenchspacing
\tolerance=5000    
\raggedbottom


\@centertabletitlefalse
\HeadingsBookChapter
%\HeadingsChapterSection
\endinput
%%
%% End of file `Alon.cls'.
         