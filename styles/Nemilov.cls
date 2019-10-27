%%
%% This is file `Nemilov.cls',
%%% Created by Shashi Kumar / ITC [July 2009]

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{Nemilov}
              [2005/09/16 v1.4f
 Standard LaTeX document class]
%%%\newcommand\@ptsize{}

%
\newif\ifrepro\reprotrue
\newif\ifdraft
\draftfalse
\newif\ifcontact
\newif\ifprinter
\printerfalse

\newdimen\draftrule
\newdimen\trimrule
\draftrule0pt
\trimrule.1pt
\tolerance=5000
\newif\ifnoquery
\global\noqueryfalse
%

\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
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
    \setlength\paperwidth  {8.5in}}
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
\fi
%%%\if@compatibility
%%%  \renewcommand\@ptsize{0}
%%%\else
%%%\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
%%%\fi
%%%\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
%%%\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\newif\if@numbysec
\DeclareOption{numbysec}{\@numbysectrue}
\newif\if@numberinsequence
\DeclareOption{numberinsequence}{\@numberinsequencetrue}

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
%%\DeclareOption{leqno}{\input{leqno.clo}}
%%\DeclareOption{fleqn}{\input{fleqn.clo}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@ChapterResetsPage
\DeclareOption{ChapterResetsPage}{\@ChapterResetsPagetrue}
\newif\if@ChapterTOCs
\DeclareOption{ChapterTOCs}{\@ChapterTOCstrue}
\newif\if@sectionauthor
\DeclareOption{sectionauthor}{\@sectionauthortrue}
\DeclareOption{nemilov1}{\@nemilovatrue}
\newif\if@nemilova
\DeclareOption{nemilov2}{\@nemilovbtrue}
\newif\if@nemilovb
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
\ExecuteOptions{twoside,onecolumn,final,openright}
\ProcessOptions

\def\grayink{\special{color cmyk 0 0 0 0.2}}
\def\blackink{\special{color cmyk 0 0 0 1.0}} %  
\def\whiteink{\special{color cmyk 0 0 0 0}} % 0%


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


%%%%\DeclareFontFamily{OT1}{NOptima}{}
%%%%\DeclareFontShape{OT1}{NOptima}{m}{n}{ <->LY1--OptimaLTStd}{}

%%%%\def\optm@scale{.70}
%%%%\DeclareFontFamily{OT1}{Optima}{}
%%%%\DeclareFontShape{OT1}{Optima}{m}{n}{ <->LY1--OptimaLTStd-Medium}{}
%%%%\DeclareFontShape{OT1}{Optima}{m}{it}{ <->LY1--OptimaLTStd-Italic}{}
%%%%\DeclareFontShape{OT1}{Optima}{bx}{n}{ <->LY1--OptimaLTStd-Bold}{}
%%%%\DeclareFontShape{OT1}{Optima}{bx}{it}{ <->LY1--OptimaLTStd-BoldItalic}{}
%%%%\DeclareFontShape{OT1}{Optima}{bx}{sc}{ <->s*[\optm@scale]LY1--OptimaLTStd-Bold}{}




%%\DeclareFontShape{OT1}{Optima}{bx}{sc}{ <-> ssub * OptimaLTStd/b/sc}{}

%%\DeclareFontShape{OT1}{Optima}{m}{it}{ <->LY1--OptimaLTStd-Italic}{}                


%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% Font Defined %%%%%%%%%%%%%%%%%

 \def\@xipt{11}
  \def\@xviiipt{18}
 \def\@xxivpt{24}


\newcommand\ContributorAffiliationFont{\reset@font\fontsize{10}{12}\raggedright\selectfont}
\newcommand\ContributorNameFont{\reset@font\fontsize{10}{12}\bfseries\raggedright\selectfont}

\newcommand\PageNumFont{\fontsize{9}{9}\sffamily\bfseries\selectfont}
\newcommand\PartNumFont{\fontsize{34}{34}\sffamily\itshape\raggedright\selectfont}
\newcommand\PartTitleFont{\fontsize{24}{30}\raggedright\sffamily\itshape\selectfont}
\newcommand\ChapNumFont{\fontsize{45}{45}\sffamily\selectfont}
\newcommand\FMCT{\fontsize{24}{28}\sffamily\raggedright\selectfont}
\newcommand\ChapTitleFont{\fontsize{24}{30}\sffamily\raggedright\rightskip16pt plus1fill\selectfont}
\newcommand\SubChapTitleFont{\fontsize{24}{28}\raggedright\itshape\rightskip6pt plus1fill\selectfont}
\newcommand\sbSectionHeadFont{\fontsize{9}{11}\bfseries\selectfont\uppercase}
\newcommand\sbSubsectionHeadFont{\fontsize{8}{10}\bfseries\selectfont\uppercase}
\newcommand\sbSubsubsectionHeadFont{\fontsize{8}{10}\bfseries\selectfont}
\newcommand\sbParagraphHeadFont{\fontsize{8}{10}\bfseries\itshape\selectfont}
\newcommand\sbSubParagraphHeadFont{\fontsize{8}{10}\itshape\selectfont}
\newcommand\exmSectionHeadFont{\fontsize{9}{11}\sffamily\bfseries\centering\selectfont\uppercase}
\newcommand\exmSubsectionHeadFont{\fontsize{10}{12} \centering\sffamily\bfseries\selectfont\uppercase}
\newcommand\exmSubsubsectionHeadFont{\fontsize{9}{11} \centering\sffamily\bfseries\selectfont}
\newcommand\exmParagraphHeadFont{\fontsize{9}{11} \centering\sffamily\bfseries\itshape\selectfont}
\newcommand\exmSubParagraphHeadFont{\fontsize{9}{11}\centering\sffamily\itshape\selectfont}
\newcommand\vSectionHeadFont{\fontsize{11}{13}\sffamily\bfseries\selectfont\uppercase}
\newcommand\vSubsectionHeadFont{\fontsize{10}{12}\sffamily\bfseries\selectfont\uppercase}
\newcommand\vSubsubsectionHeadFont{\fontsize{10}{12}\sffamily\bfseries\selectfont}
\newcommand\vParagraphHeadFont{\fontsize{10}{12}\sffamily\itshape\selectfont}
\newcommand\vSubParagraphHeadFont{\fontsize{10}{12}\sffamily\selectfont}
\newcommand\ContentsHeadFont{\fontsize{11}{13}\bfseries\selectfont}
\newcommand\SectionHeadFont{\fontsize{11}{13}\sffamily\bfseries\selectfont\uppercase}
\newcommand\SubsectionHeadFont{\fontsize{10}{12}\sffamily\bfseries\selectfont\uppercase}
\newcommand\SubsubsectionHeadFont{\fontsize{10}{12}\sffamily\bfseries\selectfont}
\newcommand\ParagraphHeadFont{\fontsize{10}{12}\sffamily\itshape\selectfont}
\newcommand\SubParagraphHeadFont{\fontsize{10}{12}\sffamily\itshape\selectfont}
\newcommand\RunningHeadFont{\fontsize{9}{9}\sffamily\selectfont}
\newcommand\NameFont{\fontsize{13}{15}\itshape\selectfont}
\newcommand\AffiliationFont{\fontsize{10}{12}\itshape\selectfont}
\newcommand\FigNumFont{\fontsize{9}{11}\sffamily\bfseries\selectfont}
\newcommand\TableColHeadFont{\fontsize{10}{12}\sffamily\bfseries\selectfont}
\newcommand\TableTitleFont{\fontsize{10}{12}\sffamily\bfseries\selectfont}
\newcommand\TableNumberFont{\fontsize{10}{12}\sffamily\bfseries\selectfont}
\newcommand\TableSubheadFont{\fontsize{8}{10}\sffamily\bfseries\selectfont}
\newcommand\TCHFont{\fontsize{8}{10}\sffamily\bfseries\selectfont}
\newcommand\CAPlusOneFont{\fontsize{13}{15}\itshape\selectfont}
\newcommand\CAAPlusOneFont{\fontsize{10}{12}\selectfont}
\newcommand\VHfont{\fontsize{10}{12}\sffamily\bfseries\centering\selectfont}
\newcommand\EXMAAFont{\fontsize{9}{11}\itshape\selectfont}
\newcommand\EXMAFont{\fontsize{9}{11}\bfseries\selectfont}
\newcommand\EXMFont{\fontsize{9}{11}\sffamily\selectfont}
\newcommand\EXMHfont{\fontsize{10}{12}\sffamily\bfseries\selectfont}
\newcommand\EXMAUFont{\fontsize{10}{12}\selectfont}
\newcommand\EXMAUAFont{\fontsize{8.5}{10.5}\itshape\selectfont}
\newcommand\VigHfont{\fontsize{10}{12}\sffamily\selectfont}
\newcommand\parttocfont{\fontsize{14}{16}\sffamily\bfseries\itshape\rightskip12pt plus1fill\selectfont}
\newcommand\Sidebarfont{\fontsize{8}{10}\selectfont}
\newcommand\SidebarHfont{\fontsize{9}{11}\bfseries\selectfont}
\newcommand\SectionAuthorFont{\fontsize{10}{12}\selectfont}



  
\newcommand\TitlePageTitleFont{\fontsize{24}{28}\slshape\bfseries\selectfont}
%%%\newcommand\PageNumFont{\fontfamily{Optima}\fontsize{9}{9}\bfseries\selectfont}
%%%\newcommand\PartNumFont{\fontfamily{Optima}\fontsize{34}{34}\itshape\raggedright\selectfont}
%%%\newcommand\PartTitleFont{\fontfamily{Optima}\fontsize{24}{30}\raggedright\itshape\selectfont}
\newcommand\PartSubTitleFont{\reset@font\fontsize{18}{22}\raggedright\itshape\selectfont}
%%\newcommand\ChapNumFont{\fontfamily{Optima}\fontsize{45}{45}\selectfont}
%%\newcommand\FMCT{\fontfamily{Optima}\fontsize{24}{28}\raggedright\selectfont}
%%\newcommand\ChapTitleFont{\fontfamily{Optima}\fontsize{24}{30}\raggedright\rightskip16pt plus1fill\selectfont}
%%\newcommand\SubChapTitleFont{\fontfamily{Optima}\fontsize{24}{28}\raggedright\itshape\rightskip6pt plus1fill\selectfont}
\newcommand\gSectionHeadFont{\reset@font\fontsize{10}{12}\bfseries\selectfont\uppercase}
\newcommand\gSubsectionHeadFont{\reset@font\fontsize{10}{12}\sc\bfseries\selectfont}
\newcommand\gSubsubsectionHeadFont{\reset@font\fontsize{10}{12}\bfseries\selectfont}
\newcommand\gParagraphHeadFont{\reset@font\fontsize{10}{12}\bfseries\itshape\selectfont}
\newcommand\gSubParagraphHeadFont{\reset@font\fontsize{10}{12}\itshape\selectfont}
%%%\newcommand\sbSectionHeadFont{\fontfamily{Optima}\fontsize{9}{11}\bfseries\selectfont\uppercase}
%%%\newcommand\sbSubsectionHeadFont{\fontfamily{Optima}\fontsize{8}{10}\bfseries\selectfont\uppercase}
%%%\newcommand\sbSubsubsectionHeadFont{\fontfamily{Optima}\fontsize{8}{10}\bfseries\selectfont}
%%%\newcommand\sbParagraphHeadFont{\fontfamily{Optima}\fontsize{8}{10}\bfseries\itshape\selectfont}
%%%\newcommand\sbSubParagraphHeadFont{\fontfamily{Optima}\fontsize{8}{10}\itshape\selectfont}
\newcommand\prbSectionHeadFont{\reset@font\fontsize{9}{11}\bfseries\selectfont\uppercase}
\newcommand\prbSubsectionHeadFont{\reset@font\fontsize{9}{11}\bfseries\selectfont}
\newcommand\prbSubsubsectionHeadFont{\reset@font\fontsize{9}{11}\bfseries\itshape\selectfont}
\newcommand\prbParagraphHeadFont{\reset@font\fontsize{9}{11}\itshape\selectfont}
\newcommand\prbSubParagraphHeadFont{\reset@font\fontsize{9}{11}\selectfont}
%%%\newcommand\exmSectionHeadFont{\fontfamily{Optima}\fontsize{9}{11}\bfseries\centering\selectfont\uppercase}
%%%\newcommand\exmSubsectionHeadFont{\fontfamily{Optima}\fontsize{10}{12} \centering\bfseries\selectfont\uppercase}
%%%\newcommand\exmSubsubsectionHeadFont{\fontfamily{Optima}\fontsize{9}{11} \centering\bfseries\selectfont}
%%%\newcommand\exmParagraphHeadFont{\fontfamily{Optima}\fontsize{9}{11} \centering\bfseries\itshape\selectfont}
%%%\newcommand\exmSubParagraphHeadFont{\fontfamily{Optima}\fontsize{9}{11}\centering\itshape\selectfont}
\newcommand\BSectionHeadFont{\reset@font\fontsize{10}{12}\bfseries\selectfont\uppercase}
\newcommand\BSubsectionHeadFont{\reset@font\fontsize{10}{12}\bfseries\scshape\selectfont}
\newcommand\BSubsubsectionHeadFont{\reset@font\fontsize{10}{12}\bfseries\selectfont}
\newcommand\BParagraphHeadFont{\reset@font\fontsize{10}{12}\itshape\selectfont}
\newcommand\BSubParagraphHeadFont{\reset@font\fontsize{10}{12}\itshape\selectfont}
\newcommand\QSectionHeadFont{\reset@font\fontsize{10}{12}\itshape\selectfont}
\newcommand\QSubsectionHeadFont{\reset@font\fontsize{9.5}{11.5}\selectfont}
\newcommand\QSubsubsectionHeadFont{\reset@font\fontsize{9}{11}\selectfont}
\newcommand\QParagraphHeadFont{\reset@font\fontsize{9}{11}\selectfont}
\newcommand\Extfont{\reset@font\fontsize{9}{11}\selectfont}
\newcommand\notefont{\reset@font\fontsize{9}{11}\selectfont}
%\newcommand\bibfont{\reset@font\fontsize{9}{11}\selectfont}
\newcommand\QSubParagraphHeadFont{\reset@font\fontsize{9}{11}\selectfont}
%%%\newcommand\vSectionHeadFont{\fontfamily{Optima}\fontsize{11}{13}\bfseries\selectfont\uppercase}
%%%\newcommand\vSubsectionHeadFont{\fontfamily{Optima}\fontsize{10}{12}\bfseries\selectfont\uppercase}
%%%\newcommand\vSubsubsectionHeadFont{\fontfamily{Optima}\fontsize{10}{12}\bfseries\selectfont}
%%%\newcommand\vParagraphHeadFont{\fontfamily{Optima}\fontsize{10}{12}\itshape\selectfont}
%%%\newcommand\vSubParagraphHeadFont{\fontfamily{NOptima}\fontsize{10}{12}\selectfont}
%%%\newcommand\ContentsHeadFont{\fontfamily{Optima}\fontsize{11}{13}\bfseries\selectfont}
%%%\newcommand\SectionHeadFont{\fontfamily{Optima}\fontsize{11}{13}\bfseries\selectfont\uppercase}
%%%\newcommand\SubsectionHeadFont{\fontfamily{Optima}\fontsize{10}{12}\bfseries\selectfont\uppercase}
%%%\newcommand\SubsubsectionHeadFont{\fontfamily{Optima}\fontsize{10}{12}\bfseries\selectfont}
%%%\newcommand\ParagraphHeadFont{\fontfamily{Optima}\fontsize{10}{12}\itshape\selectfont}
%%%\newcommand\SubParagraphHeadFont{\fontfamily{Optima}\fontsize{10}{12}\itshape\selectfont}
\newcommand\FMHeadFont{\reset@font\fontsize{18}{20}\slshape\bfseries\selectfont}
%%%\newcommand\RunningHeadFont{\fontfamily{Optima}\fontsize{9}{9}\selectfont}
%%%\newcommand\NameFont{\fontfamily{Optima}\fontsize{13}{15}\itshape\selectfont}
%%%\newcommand\AffiliationFont{\fontfamily{Optima}\fontsize{10}{12}\itshape\selectfont}
%%%\newcommand\FigNumFont{\fontfamily{Optima}\fontsize{9}{11}\bfseries\selectfont}
\newcommand\FigCapFont{\reset@font\fontsize{9}{11}\selectfont}
\newcommand\FigCapBIFont{\fontsize{9}{11}\bfseries\itshape\selectfont}
%%%\newcommand\TableColHeadFont{\fontfamily{Optima}\fontsize{10}{12}\bfseries\selectfont}
%%%\newcommand\TableTitleFont{\fontfamily{Optima}\fontsize{10}{12}\bfseries\selectfont}
%%%\newcommand\TableNumberFont{\fontfamily{Optima}\fontsize{10}{12}\bfseries\selectfont}
%%%\newcommand\TableSubheadFont{\fontfamily{Optima}\fontsize{8}{10}\bfseries\selectfont}
%%%\newcommand\TCHFont{\fontfamily{Optima}\fontsize{8}{10}\bfseries\selectfont}
%%%\newcommand\CAPlusOneFont{\fontfamily{Optima}\fontsize{13}{15}\itshape\selectfont}
%%%\newcommand\CAAPlusOneFont{\fontfamily{Optima}\fontsize{10}{12}\selectfont}
%%%\newcommand\VHfont{\fontfamily{Optima}\fontsize{10}{12}\bfseries\centering\selectfont}
%%%\newcommand\EXMAAFont{\fontfamily{Optima}\fontsize{9}{11}\itshape\selectfont}
%%%\newcommand\EXMAFont{\fontfamily{Optima}\fontsize{9}{11}\bfseries\selectfont}
%%%\newcommand\EXMFont{\fontfamily{NOptima}\fontsize{9}{11}\selectfont}
%%%\newcommand\EXMHfont{\fontfamily{Optima}\fontsize{10}{12}\bfseries\selectfont}
%%%\newcommand\EXMAUFont{\fontfamily{Optima}\fontsize{10}{12}\selectfont}
%%%\newcommand\EXMAUAFont{\fontfamily{Optima}\fontsize{8.5}{10.5}\itshape\selectfont}
%%%\newcommand\VigHfont{\fontfamily{Optima}\fontsize{10}{12}\selectfont}
%%%\newcommand\parttocfont{\fontfamily{Optima}\fontsize{14}{16}\bfseries\itshape\rightskip12pt plus1fill\selectfont}
%%%\newcommand\Sidebarfont{\fontfamily{Optima}\fontsize{8}{10}\selectfont}
%%%\newcommand\SidebarHfont{\fontfamily{Optima}\fontsize{9}{11}\bfseries\selectfont}
%%%\newcommand\SectionAuthorFont{\fontfamily{NOptima}\fontsize{10}{12}\selectfont}

\newcommand\TableBodyFont{\reset@font\fontsize{8}{10}\selectfont}
\newcommand\TableFootnoteFont{\reset@font\fontsize{8}{10}\selectfont}
\newcommand\tocfont{\reset@font\fontsize{10}{12}\selectfont}
\newcommand\extraFont{\reset@font\fontsize{24}{28}\selectfont}
\newcommand\VfFont{\reset@font\fontsize{10}{12}\selectfont}
\newcommand\EXFont{\reset@font\fontsize{9}{11}\selectfont}
\newcommand\EXHfont{\reset@font\fontsize{10}{12}\sffamily\bfseries\scshape\selectfont}
\newcommand\BoxHfont{\reset@font\fontsize{10}{12}\bfseries\selectfont}
\newcommand\ExtHfont{\reset@font\fontsize{10}{12}\bfseries\scshape\selectfont}
\newcommand\QTonefont{\reset@font\fontsize{9}{11}\selectfont}
\newcommand\PRBHfont{\reset@font\fontsize{9}{11}\bfseries\selectfont}
\newcommand\PRBfont{\reset@font\fontsize{9}{11}\selectfont}
\newcommand\QTtwofont{\reset@font\fontsize{8.5}{10.5}\selectfont}
\newcommand\QTthreefont{\reset@font\fontsize{9}{11}\selectfont}
\newcommand\shadeextractfont{\reset@font\fontsize{10}{12}\selectfont}
\newcommand\PTLCHeadFont{\reset@font\fontsize{10}{12}\bfseries\selectfont}
\newcommand\PTLCBodyFont{\reset@font\fontsize{10}{12}\selectfont}
%%%%%%%%%%%%%%%%%

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt\@xiipt
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\if@twocolumn
  \setlength\parindent{1em}
\else
  \setlength\parindent{15\p@}
\fi
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
%%%\setlength\headheight{12\p@}
%%%\setlength\headsep   {.25in}
%%%\setlength\topskip   {10\p@}
%%%\setlength\footskip{.35in}
\if@compatibility \setlength\maxdepth{4\p@} \else
\setlength\maxdepth{.5\topskip} \fi
\if@compatibility
  \if@twocolumn
    \setlength\textwidth{410\p@}
  \else
    \setlength\textwidth{4.5in}
  \fi
\else
  \setlength\@tempdima{\paperwidth}
  \addtolength\@tempdima{-2in}
  \setlength\@tempdimb{345\p@}
  \if@twocolumn
    \ifdim\@tempdima>2\@tempdimb\relax
      \setlength\textwidth{2\@tempdimb}
    \else
      \setlength\textwidth{\@tempdima}
    \fi
  \else
    \ifdim\@tempdima>\@tempdimb\relax
      \setlength\textwidth{\@tempdimb}
    \else
      \setlength\textwidth{\@tempdima}
    \fi
  \fi
\fi
\if@compatibility\else
  \@settopoint\textwidth
\fi
\if@compatibility
  \setlength\textheight{41\baselineskip}
\else
  \setlength\@tempdima{\paperheight}
  \addtolength\@tempdima{-2in}
  \addtolength\@tempdima{-1.5in}
  \divide\@tempdima\baselineskip
  \@tempcnta=\@tempdima
  \setlength\textheight{\@tempcnta\baselineskip}
\fi
\addtolength\textheight{\topskip}
\if@twocolumn
 \setlength\marginparsep {10\p@}
\else
  \setlength\marginparsep{7\p@}
\fi
\setlength\marginparpush{5\p@}
\if@compatibility
   \setlength\oddsidemargin   {.5in}
   \setlength\evensidemargin  {1.5in}
   \setlength\marginparwidth {.75in}
  \if@twocolumn
     \setlength\oddsidemargin  {30\p@}
     \setlength\evensidemargin {30\p@}
     \setlength\marginparwidth {48\p@}
  \fi
\else
  \if@twoside
    \setlength\@tempdima        {\paperwidth}
    \addtolength\@tempdima      {-\textwidth}
    \setlength\oddsidemargin    {.4\@tempdima}
    \addtolength\oddsidemargin  {-1in}
    \setlength\marginparwidth   {.6\@tempdima}
    \addtolength\marginparwidth {-\marginparsep}
    \addtolength\marginparwidth {-0.4in}
  \else
    \setlength\@tempdima        {\paperwidth}
    \addtolength\@tempdima      {-\textwidth}
    \setlength\oddsidemargin    {.5\@tempdima}
    \addtolength\oddsidemargin  {-1in}
    \setlength\marginparwidth   {.5\@tempdima}
    \addtolength\marginparwidth {-\marginparsep}
    \addtolength\marginparwidth {-0.4in}
    \addtolength\marginparwidth {-.4in}
  \fi
  \ifdim \marginparwidth >2in
     \setlength\marginparwidth{2in}
  \fi
  \@settopoint\oddsidemargin
  \@settopoint\marginparwidth
  \setlength\evensidemargin  {\paperwidth}
  \addtolength\evensidemargin{-2in}
  \addtolength\evensidemargin{-\textwidth}
  \addtolength\evensidemargin{-\oddsidemargin}
  \@settopoint\evensidemargin
\fi
\if@compatibility
  \setlength\topmargin{.75in}
\else
  \setlength\topmargin{\paperheight}
  \addtolength\topmargin{-2in}
  \addtolength\topmargin{-\headheight}
  \addtolength\topmargin{-\headsep}
  \addtolength\topmargin{-\textheight}
  \addtolength\topmargin{-\footskip}     % this might be wrong!
  \addtolength\topmargin{-.5\topmargin}
  \@settopoint\topmargin
\fi
\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
            \parsep 0\p@% \@plus2\p@ \@minus\p@
            \topsep 10\p@ \@plus2\p@ \@minus4\p@
            \itemsep0pt%\p@ \@plus2\p@ \@minus\p@
            }
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus2\p@ \@minus\p@
              \parsep    0\p@ \@plus\p@  \@minus\p@
              \itemsep  0pt% \parsep
              }
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus\p@\@minus\p@
              \parsep    0\p@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}


%%%\input{bk1\@ptsize.clo}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Boxes & Dimensions %%%%%%%%%%%%%%%%%%%%%
%
%
%%\def\jobtag{Latex Macro C\quad \@currname.cls}%
\def\jobtag{\@currname.cls}%
%
\def\@pushfilename{%
  \xdef\@currnamestack{%
    {\@currname}%
    {\@currext}%
    {\the\catcode`\@}%
    \@currnamestack}}
\@onlypreamble\@pushfilename
\@pushfilename
\newdimen\trimwidth%
\newdimen\trimheight%
\newdimen\typewidth%
\newdimen\typeheight%
%
\newdimen\tempdimen%
\newdimen\normaltextheight%
\newskip\normalbaselineskip%
\newdimen\blindfoliodrop%
%
\newdimen\enumdim%
\newdimen\figheight%
\newdimen\figwidth%
\newdimen\tabledim%
\newskip\tableleftskip%
\newskip\tablerightskip%
\newskip\tablecapleftskip%
\newskip\tablecaprightskip%
\newskip\tablenoteleftskip%
\newskip\tablenoterightskip%
%
\newdimen\mathindent%
\newdimen\emathindent%
\newdimen\bibindent%
%
\newbox\tempbox%
\newbox\abstractbox%
%
\newcount\authorcount \authorcount0%
\newif\ifauthor\global\authorfalse%

%
\newcount\affiliationcount \affiliationcount0%
\newif\ifaffiliation\global\affiliationfalse%
%
\newcount\tempcount
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End Boxes & Dimensions %%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\if@nemilova
\setlength\trimheight{9.25in}%
\setlength\trimwidth{6.125in}%
%
%%\setlength\typeheight{43\baselineskip}%
%%\setlength\typewidth{33pc}%
%
\setlength\textheight{45\baselineskip}%
\addtolength\textheight{-4.5pt}%
\setlength\normaltextheight{\textheight}%
\setlength\textwidth{28pc}%
%
\else\if@nemilovb
\setlength\trimheight{10in}%
\setlength\trimwidth{7in}%
%
%%\setlength\typeheight{43\baselineskip}%
%%\setlength\typewidth{33pc}%
%
\setlength\textheight{51\baselineskip}%
\addtolength\textheight{-4.5pt}%
\setlength\normaltextheight{\textheight}%
\setlength\textwidth{33pc}%
%
\hoffset-1.5pc  
\voffset-2.5pc  

\else
\setlength\trimheight{9in}%
\setlength\trimwidth{6in}%
%
%%\setlength\typeheight{43\baselineskip}%
%%\setlength\typewidth{33pc}%
%
\setlength\textheight{43\baselineskip}%
\addtolength\textheight{-4.5pt}%
\setlength\normaltextheight{\textheight}%
\setlength\textwidth{26pc}%
%


\fi\fi

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\setlength\topmargin{36pt}%
\setlength\oddsidemargin{53pt}%
%%\setlength\evensidemargin{138pt}
\setlength\evensidemargin\trimwidth%
\addtolength\evensidemargin{-\textwidth}%
\addtolength\evensidemargin{-\oddsidemargin}%
\addtolength\oddsidemargin{0pc}%
%
\setlength\headheight{6.3\p@}% 
\setlength\headsep   {19pt}% \typeheight - \textheight - \headheight
\setlength\topskip   {8.5\p@}
%
\newdimen\rhsep\rhsep41.6pt
%
\setlength\footskip{27pt}
\setlength\maxdepth{4\p@}
%
\blindfoliodrop\trimheight
\advance\blindfoliodrop-\typeheight
\advance\blindfoliodrop-\topmargin
\advance\blindfoliodrop-\footskip
\advance\blindfoliodrop8pt
%
\setlength\parindent{12pt}
%
\setlength\marginparwidth {.75in}
\setlength\marginparsep{0\p@}
\setlength\marginparpush{5\p@}
%
\setlength\footnotesep{10.3\p@}
\setlength{\skip\footins}{19\p@ \@plus 8\p@ \@minus 8\p@}% change + based on FN font height
\skip\@mpfootins = \skip\footins
%
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@}
\setlength\@fpsep{8\p@ \@plus 1fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@}
\setlength\@dblfpsep{8\p@ \@plus 1fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
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
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{{\PageNumFont\thepage}\hfil\RunningHeadFont\leftmark}%
      \def\@oddhead{{\RunningHeadFont\rightmark}\hfil{\PageNumFont\thepage}}%
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
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\RunningHeadFont\rightmark}\hfil{\PageNumFont\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}}}
\fi
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
\def\ps@folio{\let\@mkboth\@gobbletwo
     \let\@oddhead\@empty\def\@oddfoot{\reset@font\hfill\PageNumFont\thepage
     }\let\@evenhead\@empty\let\@evenfoot\@oddfoot}
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%\hypersetup{pageanchor=false}%to avoid pdfTeX warning (ext4): destination with the same identifier
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \large\@author
      \end{tabular}\par}%
      \vskip 1.5em%
%%    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
%%  \global\let\@title\@empty
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
    \thispagestyle{plain}\@thanks
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
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
%%    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{5}
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
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{empty}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
%%  \null\vfil
\vspace*{97pt}
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{SECTION~\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    \vbox{\centering\vspace*{2pt}
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \PartNumFont\partname\nobreakspace\thepart
       \par\vspace*{-17pt}
       \noindent{\vrule height4pt width\textwidth}
       \vskip19\p@
            {\PartTitleFont #2}\par}%
     \fi
%    \@endpart
    }
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \vbox{\PartTitleFont #1}\par}%
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
              
              
\def\halftitle{\cleardoublepage\thispagestyle{empty}%
  {\parindent \z@ \raggedright
        \vspace*{-35pt}
    \noindent\hbox{\vrule height4pt width\textwidth}\vspace*{22pt}
    \interlinepenalty\@M
    {\FMCT  Half Title}\par\nobreak
    \vskip 27\p@
  }}              

\def\booktitle{\cleardoublepage\thispagestyle{empty}%
  {\parindent \z@ \raggedright
        \vspace*{-35pt}
    \noindent\hbox{\vrule height4pt width\textwidth}\vspace*{22pt}
    \interlinepenalty\@M
    {\FMCT  Title Page}\par\nobreak
    \vskip 27\p@
  }}              

\def\locpage{\clearpage\thispagestyle{empty}%
  {\parindent \z@ \raggedright
        \vspace*{-35pt}
    \noindent\hbox{\vrule height4pt width\textwidth}\vspace*{22pt}
    \interlinepenalty\@M
    {\FMCT  LOC Page}\par\nobreak
    \vskip 27\p@
  }}   
                
%%%\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
%%%                    \thispagestyle{folio}%
%%%                    \global\@topnum\z@
%%%                    \@afterindentfalse
%%%                    \secdef\@chapter\@schapter}
%%%\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
%%%                       \if@mainmatter
%%%                         \refstepcounter{chapter}%
%%%                         \typeout{\@chapapp\space\thechapter.}%
%%%                         \addcontentsline{toc}{chapter}%
%%%                                   {\protect\numberline{\thechapter}#1}%
%%%                       \else
%%%                         \addcontentsline{toc}{chapter}{#1}%
%%%                       \fi
%%%                    \else
%%%                      \addcontentsline{toc}{chapter}{#1}%
%%%                    \fi
%%%                    \chaptermark{#1}%
%%%                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
%%%                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
%%%                    \if@twocolumn
%%%                      \@topnewpage[\@makechapterhead{#2}]%
%%%                    \else
%%%                      \@makechapterhead{#2}%
%%%                      \@afterheading
%%%                    \fi}
%%%\def\@makechapterhead#1{%
%%%  \vspace*{50\p@}%
%%%  {\parindent \z@ \raggedright \normalfont
%%%    \ifnum \c@secnumdepth >\m@ne
%%%      \if@mainmatter
%%%        \huge\bfseries \@chapapp\space \thechapter
%%%        \par\nobreak
%%%        \vskip 20\p@
%%%      \fi
%%%    \fi
%%%    \interlinepenalty\@M
%%%    \Huge \bfseries #1\par\nobreak
%%%    \vskip 40\p@
%%%  }}


%%%%%%%%%%%%%%%% Chapter Author %%%%%%%%%%%%%%%%%%%%%
%%%%
%%%\newif\if@author
%%%\newbox\@authorbox
%%%\def\@author{}
%%%\def\affilfont{\reset@font\fontsize{10}{12}\selectfont}
%%%\def\chapauthorfont{\reset@font\fontsize{10}{12}\selectfont}
%%%%
%%%%
%%%\def\chapterauthor{\@ifnextchar[{\@chapauthor}{\@chapauthor[]}}
%%%\def\@chapauthor[#1]#2{\make@cornermarks%
%%%\def\affil##1{\par\affilfont##1\par}
%%%\gdef\@@chapauthor{\chapauthorfont#2}
%%%%\def\@@empty{#1}\ifx\@empty\@@empty\else\addcontentsline{toc}{author}{#1}\fi
%%%}
%%%%
%%%\newif\if@affil
%%%\newbox\@affilbox
%%%\def\affiliation{\global\@affiltrue\global\setbox\@affilbox=\vbox\bgroup%
%%%\leftskip0pt plus1fill\rightskip\leftskip  \hsize=\textwidth\normalfont\small\noindent\ignorespaces}
%%%\def\endaffiliation{\egroup}
%%%% Chapter text macros
%%%%
%%%\newif\if@chptxt
%%%\newbox\@chptxtbox
%%%%
%%%\def\chaptertext{\global\@chptxttrue\global\setbox\@chptxtbox=\vbox\bgroup%
%%%  \hsize=\textwidth\normalfont\small\noindent\ignorespaces}
%%%\def\endchaptertext{\egroup}
%%%%
%%%% Heading for the \chapter command.

%%%
%%%%%%%%%%%%%%%%%%%%%%% Author %%%%%%%%%%%%%%%%%%%%
%%%%
%%%\newcount\tempcount

%%%\def\authorfont{\fontsize{13}{15}\itshape\selectfont}
%%%\def\authaffilfont{\reset@font\fontsize{10}{12}\selectfont}

%%%\newif\ifchapterauthor\global\chapterauthorfalse
%%%\newcount\chapterauthorcount
%%%\newcount\tempchapterauthorcount
%%%%
%%%\def\chapterauthor#1{%
%%%       \global\chapterauthortrue%
%%%       \global\advance\chapterauthorcount1%
%%%							\expandafter\protected@xdef\csname chapterauthor\the\chapterauthorcount\endcsname{#1}}
%%%%
%%%%%%%%%%%%%%%%%%%%%%% Affiliation %%%%%%%%%%%%%%%%%%%%
%%%%
%%%\newif\ifchapteraffiliation\global\chapteraffiliationfalse
%%%\newcount\chapteraffiliationcount
%%%%
%%%\def\chapteraffiliation#1{%
%%%       \global\chapteraffiliationtrue%
%%%       \global\advance\chapteraffiliationcount1%
%%%							\expandafter\gdef\csname chapteraffiliation\the\chapteraffiliationcount\endcsname{#1}}
%%%%%%%%%%%%%%%% End Chapter Author %%%%%%%%%%%%%%%%%%%%%

\if@ChapterTOCs
  \newwrite\@chaptoc
  \def\secnumwidth{21pt}\def\subsecnumwidth{30pt}\def\ssubsecnumwidth{36pt}\fi
\long\def\@trplarg#1{\@ifnextchar[{\@xtrplarg{#1}}{\@ztrplarg{#1}}}
\long\def\@xtrplarg#1[#2]{\@ifnextchar[{#1[#2]}{\@ytrplarg{#1}[{#2}]}}
\long\def\@ytrplarg#1[#2]#3{#1[{#2}][{#2}]{#3}}
\long\def\@ztrplarg#1#2{#1[{#2}][{#2}]{#2}}

\newif\ifappendix
\global\appendixfalse

\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
  \cleardoublepage
  \if@ChapterTOCs\if@filesw\immediate\closeout\@chaptoc\fi\fi
  \thispagestyle{folio}%
\if@ChapterResetsPage\global\c@page\@ne\fi
                    \global\@topnum\z@
                      \gdef\chapterauthor{\@ca}%
  \gdef\endchapterauthors{\end@cas}%
                    \@afterindentfalse
%                     \@ifstar{\@schapter}{\@trplarg{\@chapter}}
\secdef\@chapter\@schapter
                                          }
\def\@chapter[#1]#2{%
  \ifnum\c@secnumdepth>\m@ne
    \if@mainmatter
      \refstepcounter{chapter}%
      \typeout{\@chapapp\space\thechapter.}%
      \ifappendix
      \addcontentsline{toc}{chapter}{\protect\numberline{\bfseries Appendix~\thechapter}#1}%
      \else
      \addcontentsline{toc}{chapter}{\protect\numberline{\bfseries Chapter~\thechapter}#1}%
      \fi
    \else
      \addcontentsline{toc}{chapter}{#1}\fi
  \else
    \addcontentsline{toc}{chapter}{#1}\fi
  \chaptermark{%
    #2}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \@makechapterhead{#2}%
    \@afterheading\fi
  \if@ChapterTOCs\if@filesw\immediate\openout\@chaptoc\thechapter.toc\fi\fi
  \let\@@chapauthor\@empty
}


\def\@makechapterhead#1{%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
    \vspace*{-35pt}
    \noindent\hbox{\vrule height4pt width\textwidth}\vspace*{24pt}
      \if@mainmatter
\hbox to 4pc{\hfill\ChapNumFont\thechapter}\vspace*{-33pt}
\hspace*{5pc}\vbox{\hsize24.6pc\ChapTitleFont #1}
\else
\vbox{\ChapTitleFont #1}
      \fi
    \fi
%%%%%              \ifchapterauthor
%%%%%            			\vskip28pt
%%%%%            			\hspace*{5pc}\vbox{\authorfont
%%%%%                  \global\tempchapterauthorcount\chapterauthorcount
%%%%%                  \global\advance\tempchapterauthorcount0
%%%%%                  \ifnum\chapterauthorcount=1
%%%%%                      \csname chapterauthor0\endcsname\endgraf%
%%%%%                      \ifchapteraffiliation%
%%%%%                         {\authaffilfont\csname chapteraffiliation0\endcsname\endgraf\vskip5pt}%
%%%%%                      \else%
%%%%%                        \vskip5pt%
%%%%%                      \fi%
%%%%%                  \else
%%%%%                    \ifnum\chapterauthorcount=2
%%%%%                      \csname chapterauthor0\endcsname\endgraf
%%%%%                      \ifchapteraffiliation%
%%%%%                         {\authaffilfont\csname chapteraffiliation0\endcsname\endgraf\vskip5pt}%
%%%%%                      \else%
%%%%%                        \vskip5pt%
%%%%%                      \fi%
%%%%%                      \endgraf%
%%%%%                      \global\advance\tempcount1
%%%%%                      \csname chapterauthor1\endcsname\endgraf%
%%%%%                      \ifchapteraffiliation%
%%%%%                         {\authaffilfont\csname chapteraffiliation1\endcsname\endgraf\vskip9pt}%
%%%%%                      \else%
%%%%%                      \fi%
%%%%%                    \else
%%%%%                      \@whilenum\tempcount<\tempchapterauthorcount
%%%%%          						        \do{%\vskip8pt
%%%%%                        				\csname chapterauthor\the\tempcount\endcsname\endgraf
%%%%%                             \ifchapteraffiliation%
%%%%%                              {\authaffilfont\csname chapteraffiliation\the\tempcount\endcsname\endgraf\vskip5pt}%
%%%%%                             \else%
%%%%%                                \vskip5pt%
%%%%%                             \fi\endgraf%
%%%%%                            \global\advance\tempcount1}%
%%%%%                      \csname chapterauthor\the\tempcount\endcsname%
%%%%%                    \fi   \fi          
%%%%%               \endgraf\vphantom{pqfg}}%
%%%%%               \ifchapteraffiliation%
%%%%%               \vskip-13pt
%%%%%                         \hspace*{5pc}\vbox{\authaffilfont\csname chapteraffiliation\the\tempcount\endcsname\endgraf\vskip5pt}%
%%%%%                  \vskip20pt \else%
%%%%%           \global\authorcount0%
%%%%%           \global\authorfalse%
%%%%%           \global\affiliationcount0%
%%%%%           \global\affiliationfalse%
%%%%%            \vskip40pt \fi%
%%%%%                          \else
%%%%%            \vskip40pt   \fi
            \if@ChapterTOCs
            \vskip26pt
      \make@chaptoc
%%      \noindent{\chaptertableofcontents}
    \else
\fi
                    \interlinepenalty\@M
		\vskip25\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}

\def\@makeschapterhead#1{%
  {\parindent \z@ \raggedright
        \vspace*{-35pt}
    \noindent\hbox{\vrule height4pt width\textwidth}\vspace*{22pt}
    \interlinepenalty\@M
    {\FMCT  #1}\par\nobreak
    \vskip 27\p@
  }}
                 
%%%\def\@makeschapterhead#1{%
%%%  \vspace*{50\p@}%
%%%  {\parindent \z@ \raggedright
%%%    \normalfont
%%%    \interlinepenalty\@M
%%%    \Huge \bfseries  #1\par\nobreak
%%%    \vskip 40\p@
%%%  }}


%%\def\@startsection#1#2#3#4#5#6{%
%%  \if@noskipsec \leavevmode \fi
%%  \par
%%  \@tempskipa #4\relax
%%  \@afterindenttrue
%%  \ifdim \@tempskipa <\z@
%%    \@tempskipa -\@tempskipa \@afterindentfalse
%%  \fi
%%  \if@nobreak
%%    \everypar{}%
%%  \else
%%    \addpenalty\@secpenalty\addvspace\@tempskipa
%%  \fi
%%  \@ifstar
%%    {\@ssect{#3}{#4}{#5}{#6}}%
%%    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
%%\def\@sect#1#2#3#4#5#6[#7]#8{%
%%  \ifnum #2>\c@secnumdepth
%%    \let\@svsec\@empty
%%  \else
%%    \refstepcounter{#1}%
%%    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
%%  \fi
%%  \@tempskipa #5\relax
%%  \ifdim \@tempskipa>\z@
%%    \begingroup
%%      #6{%
%%        \@hangfrom{\hskip #3\relax\@svsec}%
%%          \interlinepenalty \@M #8\@@par}%
%%    \endgroup
%%    \csname #1mark\endcsname{#7}%
%%    \addcontentsline{toc}{#1}{%
%%      \ifnum #2>\c@secnumdepth \else
%%        \protect\numberline{\csname the#1\endcsname}%
%%      \fi
%%      #7}%
%%%%%    \vbox{\myaddcontentsline{chtoc}{ch#1}{%
%%%%%      \ifnum #2>\c@secnumdepth \else
%%%%%        \protect\addnumberline{\csname the#1\endcsname}%
%%%%%      \fi
%%%%%      #7}      }%
%%  \else
%%    \def\@svsechd{%
%%      #6{\hskip #3\relax
%%      \@svsec #8}%
%%      \csname #1mark\endcsname{#7}%
%%      \addcontentsline{toc}{#1}{%
%%        \ifnum #2>\c@secnumdepth \else
%%          \protect\numberline{\csname the#1\endcsname}%
%%        \fi
%%        #7}    
%%%%          \myaddcontentsline{chtoc}{ch#1}{%
%%%%        \ifnum #2>\c@secnumdepth \else
%%%%          \protect\addnumberline{\csname the#1\endcsname}%
%%%%        \fi
%%%%        #7}
%%        }%
%%  \fi
%%  \@xsect{#5}}
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}
\def\@seccntformat#1{\csname the#1\endcsname\quad}
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}

%%%\def\myaddcontentsline#1#2#3{%
%%%  \myaddtocontents{#1}{\protect\mycontentsline{#2}{#3}{\thepage}}}
%%%\long\def\myaddtocontents#1#2{%
%%%  \protected@write\@auxout
%%%      {\let\label\@gobble \let\index\@gobble \let\glossary\@gobble}%
%%%      {\string\@writefile{#1}{#2}}}
%%%      


\def\myaddcontentsline#1#2#3{%
  \if@filesw
    \begingroup
    \def\protect##1{\string ##1 }%
    \@temptokena{\thepage}%
    \edef\@tempa{\write#1{\string\mycontentsline{#2}{\string\raggedright\space #3}{\the\@temptokena}}}\@tempa
       \let\label\@gobble\let\index\@gobble\let\glossary\@gobble
    \def\break{\ }%
%% \if@nobreak\ifvmode\nobreak\fi\fi
        \endgroup
  \fi}
  
  
\def\mycontentsline#1{\csname l@#1\endcsname}
\newcommand*\l@chsection{\@dottedchtocline{1}{0em}{2.3em}}
\newcommand*\l@chsubsection{\@dottedchtocline{2}{2.3em}{3.2em}}
\newcommand*\l@chsubsubsection{\@dottedchtocline{3}{3.2em}{4.1em}}
\newcommand*\l@chparagraph{\@dottedchtocline{4}{8.5em}{5em}}
\newcommand*\l@chsubparagraph{\@dottedchtocline{5}{10.5em}{6em}}

\def\@mydottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}

\def\@dottedchtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \hbox{.}$}\hfill
     \nobreak
%%     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \hbox{\hfil\normalfont\normalcolor #5}%
     \par}%
  \fi}
  
\def\addnumberline#1{\hb@xt@\@tempdima{#1\hfil}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% General Heads %%%%%%%%%%%%%%%%%
\newcommand\gsection{%
  \gdef\chapterauthor{\@caplusone}%
  \gdef\endchapterauthors{\end@casplusone}%
  \@ifstar{\@gssection}{\@trplarg{\@gsection}}}
\def\@gssection#1{%
  \@startsection{gsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\gSectionHeadFont}*{#1}}
\def\@gsection[#1][#2]#3{%
  \@startsection{gsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\gSectionHeadFont}[#2]{#3}}

\newcommand\gsubsection{\@ifstar{\@gssubsection}{\@trplarg{\@gsubsection}}}
\def\@gssubsection#1{%
  \@startsection{gsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
    \gSubsectionHeadFont}*{#1}}
\def\@gsubsection[#1][#2]#3{%
  \@startsection{gsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
      \gSubsectionHeadFont}[#2]{#3}}

\newcommand\gsubsubsection{\@ifstar{\@gssubsubsection}{\@trplarg{\@gsubsubsection}}}
\def\@gssubsubsection#1{%
  \@startsection{gsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\gSubsubsectionHeadFont}*{#1}}
\def\@gsubsubsection[#1][#2]#3{%
  \@startsection{gsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\gSubsubsectionHeadFont}[#2]{#3}}
\newcommand\gparagraph{\@startsection{paragraph}{4}{\z@}%
                                    {-2.25ex \@plus1ex \@minus.2ex}%
                                    {3pt}%
                                    {\gParagraphHeadFont}}
\newcommand\gsubparagraph{\@startsection{subparagraph}{5}{\z@}%
                                       {-2.25ex \@plus1ex \@minus .2ex}%
                                       {3pt}%
                                      {\gSubParagraphHeadFont}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Boxed Heads %%%%%%%%%%%%%%%%%
\newcommand\Bsection{%
  \gdef\chapterauthor{\@caplusone}%
  \gdef\endchapterauthors{\end@casplusone}%
  \@ifstar{\@Bssection}{\@trplarg{\@Bsection}}}
\def\@Bssection#1{%
  \@startsection{Bsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\BSectionHeadFont}*{#1}}
\def\@Bsection[#1][#2]#3{%
  \@startsection{Bsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\BSectionHeadFont}[#2]{#3}}

\newcommand\Bsubsection{\@ifstar{\@Bssubsection}{\@trplarg{\@Bsubsection}}}
\def\@Bssubsection#1{%
  \@startsection{Bsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
    \BSubsectionHeadFont}*{#1}}
\def\@Bsubsection[#1][#2]#3{%
  \@startsection{Bsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
      \BSubsectionHeadFont}[#2]{#3}}

\newcommand\Bsubsubsection{\@ifstar{\@Bssubsubsection}{\@trplarg{\@Bsubsubsection}}}
\def\@Bssubsubsection#1{%
  \@startsection{Bsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\BSubsubsectionHeadFont}*{#1}}
\def\@Bsubsubsection[#1][#2]#3{%
  \@startsection{Bsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\BSubsubsectionHeadFont}[#2]{#3}}
\newcommand\Bparagraph{\@startsection{paragraph}{4}{\z@}%
                                    {-2.25ex \@plus1ex \@minus.2ex}%
                                    {3pt}%
                                    {\BParagraphHeadFont}}
\newcommand\Bsubparagraph{\@startsection{subparagraph}{5}{\z@}%
                                       {2.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\BSubParagraphHeadFont}}
                                      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Extract Heads %%%%%%%%%%%%%%%%%


\newcommand\Qsection{%
  \gdef\chapterauthor{\@caplusone}%
  \gdef\endchapterauthors{\end@casplusone}%
  \@ifstar{\@Qssection}{\@trplarg{\@Qsection}}}
\def\@Qssection#1{%
  \@startsection{Qsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\QSectionHeadFont}*{#1}}
\def\@Qsection[#1][#2]#3{%
  \@startsection{Qsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\QSectionHeadFont}[#2]{#3}}

\newcommand\Qsubsection{\@ifstar{\@Qssubsection}{\@trplarg{\@Qsubsection}}}
\def\@Qssubsection#1{%
  \@startsection{Qsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
    \QSubsectionHeadFont}*{#1}}
\def\@Qsubsection[#1][#2]#3{%
  \@startsection{Qsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
      \QSubsectionHeadFont}[#2]{#3}}

\newcommand\Qsubsubsection{\@ifstar{\@Qssubsubsection}{\@trplarg{\@Qsubsubsection}}}
\def\@Qssubsubsection#1{%
  \@startsection{Qsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{1pt}{\QSubsubsectionHeadFont}*{#1}}
\def\@Qsubsubsection[#1][#2]#3{%
  \@startsection{Qsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{1pt}{\QSubsubsectionHeadFont}[#2]{#3}}
\newcommand\Qparagraph{\@startsection{paragraph}{4}{\z@}%
                                    {2.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\QParagraphHeadFont}}
\newcommand\Qsubparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {2.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\QSubParagraphHeadFont}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Problem Heads %%%%%%%%%%%%%%%%%

\newcommand\prbsection{%
  \gdef\chapterauthor{\@caplusone}%
  \gdef\endchapterauthors{\end@casplusone}%
  \@ifstar{\@prbssection}{\@trplarg{\@prbsection}}}
\def\@prbssection#1{%
  \@startsection{prbsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\prbSectionHeadFont}*{#1}}
\def\@prbsection[#1][#2]#3{%
  \@startsection{prbsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\prbSectionHeadFont}[#2]{#3}}

\newcommand\prbsubsection{\@ifstar{\@prbssubsection}{\@trplarg{\@prbsubsection}}}
\def\@prbssubsection#1{%
  \@startsection{prbsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
    \prbSubsectionHeadFont}*{#1}}
\def\@prbsubsection[#1][#2]#3{%
  \@startsection{prbsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
      \prbSubsectionHeadFont}[#2]{#3}}

\newcommand\prbsubsubsection{\@ifstar{\@prbssubsubsection}{\@trplarg{\@prbsubsubsection}}}
\def\@prbssubsubsection#1{%
  \@startsection{prbsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\prbSubsubsectionHeadFont}*{#1}}
\def\@prbsubsubsection[#1][#2]#3{%
  \@startsection{prbsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\prbSubsubsectionHeadFont}[#2]{#3}}
  
\newcommand\prbparagraph{\@ifstar{\@prbsparagraph}{\@trplarg{\@prbparagraph}}}
\def\@prbsparagraph#1{%
  \@startsection{prbparagraph}{4}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\prbParagraphHeadFont}*{#1}}
\def\@prbparagraph[#1][#2]#3{%
  \@startsection{prbparagraph}{4}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\prbParagraphHeadFont}[#2]{#3}}

\newcommand\prbsubparagraph{\@ifstar{\@prbssubparagraph}{\@trplarg{\@prbsubparagraph}}}
\def\@prbssubparagraph#1{%
  \@startsection{prbsubparagraph}{5}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\prbSubParagraphHeadFont}*{#1}}
\def\@prbsubparagraph[#1][#2]#3{%
  \@startsection{prbsubparagraph}{5}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\prbSubParagraphHeadFont}[#2]{#3}}
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Sidebar Heads %%%%%%%%%%%%%%%%%

\newcommand\sbsection{%
  \gdef\chapterauthor{\@caplusone}%
  \gdef\endchapterauthors{\end@casplusone}%
  \@ifstar{\@sbssection}{\@trplarg{\@sbsection}}}
\def\@sbssection#1{%
  \@startsection{sbsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\sbSectionHeadFont}*{#1}}
\def\@sbsection[#1][#2]#3{%
  \@startsection{sbsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\sbSectionHeadFont}[#2]{#3}}

\newcommand\sbsubsection{\@ifstar{\@sbssubsection}{\@trplarg{\@sbsubsection}}}
\def\@sbssubsection#1{%
  \@startsection{sbsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
    \sbSubsectionHeadFont}*{#1}}
\def\@sbsubsection[#1][#2]#3{%
  \@startsection{sbsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
      \sbSubsectionHeadFont}[#2]{#3}}

\newcommand\sbsubsubsection{\@ifstar{\@sbssubsubsection}{\@trplarg{\@sbsubsubsection}}}
\def\@sbssubsubsection#1{%
  \@startsection{sbsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\sbSubsubsectionHeadFont}*{#1}}
\def\@sbsubsubsection[#1][#2]#3{%
  \@startsection{sbsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\sbSubsubsectionHeadFont}[#2]{#3}}
  
\newcommand\sbparagraph{\@ifstar{\@sbsparagraph}{\@trplarg{\@sbparagraph}}}
\def\@sbsparagraph#1{%
  \@startsection{sbparagraph}{4}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\sbParagraphHeadFont}*{#1}}
\def\@sbparagraph[#1][#2]#3{%
  \@startsection{sbparagraph}{4}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\sbParagraphHeadFont}[#2]{#3}}

\newcommand\sbsubparagraph{\@ifstar{\@sbssubparagraph}{\@trplarg{\@sbsubparagraph}}}
\def\@sbssubparagraph#1{%
  \@startsection{sbsubparagraph}{5}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\sbSubParagraphHeadFont}*{#1}}
\def\@sbsubparagraph[#1][#2]#3{%
  \@startsection{sbsubparagraph}{5}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\sbSubParagraphHeadFont}[#2]{#3}}
                                      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Example Heads %%%%%%%%%%%%%%%%%

\newcommand\exmsection{%
  \gdef\chapterauthor{\@caplusone}%
  \gdef\endchapterauthors{\end@casplusone}%
  \@ifstar{\@exmssection}{\@trplarg{\@exmsection}}}
\def\@exmssection#1{%
  \@startsection{exmsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\exmSectionHeadFont}*{#1}}
\def\@exmsection[#1][#2]#3{%
  \@startsection{exmsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\exmSectionHeadFont}[#2]{#3}}

\newcommand\exmsubsection{\@ifstar{\@exmssubsection}{\@trplarg{\@exmsubsection}}}
\def\@exmssubsection#1{%
  \@startsection{exmsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
    \exmSubsectionHeadFont}*{#1}}
\def\@exmsubsection[#1][#2]#3{%
  \@startsection{exmsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
      \exmSubsectionHeadFont}[#2]{#3}}

\newcommand\exmsubsubsection{\@ifstar{\@exmssubsubsection}{\@trplarg{\@exmsubsubsection}}}
\def\@exmssubsubsection#1{%
  \@startsection{exmsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\exmSubsubsectionHeadFont}*{#1}}
\def\@exmsubsubsection[#1][#2]#3{%
  \@startsection{exmsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\exmSubsubsectionHeadFont}[#2]{#3}}
  
\newcommand\exmparagraph{\@ifstar{\@exmsparagraph}{\@trplarg{\@exmparagraph}}}
\def\@exmsparagraph#1{%
  \@startsection{exmparagraph}{4}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\exmParagraphHeadFont}*{#1}}
\def\@exmparagraph[#1][#2]#3{%
  \@startsection{exmparagraph}{4}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\exmParagraphHeadFont}[#2]{#3}}

\newcommand\exmsubparagraph{\@ifstar{\@exmssubparagraph}{\@trplarg{\@exmsubparagraph}}}
\def\@exmssubparagraph#1{%
  \@startsection{exmsubparagraph}{5}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\exmSubParagraphHeadFont}*{#1}}
\def\@exmsubparagraph[#1][#2]#3{%
  \@startsection{exmsubparagraph}{5}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\exmSubParagraphHeadFont}[#2]{#3}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Vignatte Heads %%%%%%%%%%%%%%%%%

\newcommand\vsection{%
  \gdef\chapterauthor{\@caplusone}%
  \gdef\endchapterauthors{\end@casplusone}%
  \@ifstar{\@vssection}{\@trplarg{\@vsection}}}
\def\@vssection#1{%
  \@startsection{vsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\vSectionHeadFont}*{#1}}
\def\@vsection[#1][#2]#3{%
  \@startsection{vsection}{1}{\z@}{-2.5ex \@plus -1ex \@minus -.2ex}{4pt}%
{\vSectionHeadFont}[#2]{#3}}

\newcommand\vsubsection{\@ifstar{\@vssubsection}{\@trplarg{\@vsubsection}}}
\def\@vssubsection#1{%
  \@startsection{vsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
    \vSubsectionHeadFont}*{#1}}
\def\@vsubsection[#1][#2]#3{%
  \@startsection{vsubsection}{2}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{%
      \vSubsectionHeadFont}[#2]{#3}}

\newcommand\vsubsubsection{\@ifstar{\@vssubsubsection}{\@trplarg{\@vsubsubsection}}}
\def\@vssubsubsection#1{%
  \@startsection{vsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\vSubsubsectionHeadFont}*{#1}}
\def\@vsubsubsection[#1][#2]#3{%
  \@startsection{vsubsubsection}{3}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\vSubsubsectionHeadFont}[#2]{#3}}
  
\newcommand\vparagraph{\@ifstar{\@vsparagraph}{\@trplarg{\@vparagraph}}}
\def\@vsparagraph#1{%
  \@startsection{vparagraph}{4}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\vParagraphHeadFont}*{#1}}
\def\@vparagraph[#1][#2]#3{%
  \@startsection{vparagraph}{4}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\vParagraphHeadFont}[#2]{#3}}

\newcommand\vsubparagraph{\@ifstar{\@vssubparagraph}{\@trplarg{\@vsubparagraph}}}
\def\@vssubparagraph#1{%
  \@startsection{vsubparagraph}{5}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\vSubParagraphHeadFont}*{#1}}
\def\@vsubparagraph[#1][#2]#3{%
  \@startsection{vsubparagraph}{5}{\z@}{-2.25ex\@plus -1ex \@minus -.2ex}{3pt}{\vSubParagraphHeadFont}[#2]{#3}}
 
                                      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@sectionauthor
\newcommand\section{%
  \gdef\chapterauthor{\@caplusone}%
  \gdef\endchapterauthors{\end@casplusone}%
  \@ifstar{\@ssection}{\@trplarg{\@section}}}
\def\@ssection#1{%
  \if@ChapterTOCs
%%    \myaddcontentsline{\@chaptoc}{chsection}{\string\makebox[\secnumwidth][l]{}#1}
\fi
  \@startsection{section}{1}{\z@}{-3.5ex \@plus -1ex \@minus -.2ex}{6pt \@plus.2ex}%
{\SectionHeadFont}*{#1}}
\def\@section[#1][#2]#3[#4]{%
  \if@ChapterTOCs
    \addtocounter{section}{1}%
    \myaddcontentsline{\@chaptoc}{chsection}{\string\makebox[\secnumwidth][l]{\thesection}#1}%
    \addtocounter{section}{-1}\fi
  \@startsection{section}{1}{\z@}{-3.5ex \@plus -1ex \@minus -.2ex}{6pt \@plus .2ex}%
{\SectionHeadFont}[#2]{#3}                     
\ifx#4\@empty\else
\addcontentsline{toc}{sectionauthor}{#4}
                            \fi}
\def\sectionauthor#1{{\SectionAuthorFont #1}\par}
\else
\newcommand\section{%
  \gdef\chapterauthor{\@caplusone}%
  \gdef\endchapterauthors{\end@casplusone}%
  \@ifstar{\@ssection}{\@trplarg{\@section}}}
\def\@ssection#1{%
  \if@ChapterTOCs
%%    \myaddcontentsline{\@chaptoc}{chsection}{\string\makebox[\secnumwidth][l]{}#1}
\fi
  \@startsection{section}{1}{\z@}{-3.5ex \@plus -1ex \@minus -.2ex}{6pt \@plus.2ex}%
{\SectionHeadFont}*{#1}}
\def\@section[#1][#2]#3{%
  \if@ChapterTOCs
    \addtocounter{section}{1}%
    \myaddcontentsline{\@chaptoc}{chsection}{\string\makebox[\secnumwidth][l]{\thesection}#1}%
    \addtocounter{section}{-1}\fi
  \@startsection{section}{1}{\z@}{-3.5ex \@plus -1ex \@minus -.2ex}{6pt \@plus .2ex}%
{\SectionHeadFont}[#2]{#3}}
\def\sectionauthor#1{{\SectionAuthorFont #1}\par}
\fi

\if@sectionauthor
\newcommand\subsection{\@ifstar{\@ssubsection}{\@trplarg{\@subsection}}}
\def\@ssubsection#1{%
  \if@ChapterTOCs
%%    \myaddcontentsline{\@chaptoc}{chsubsection}{\string\makebox[\subsecnumwidth][l]{}#1}
\fi
  \@startsection{subsection}{2}{\z@}{-3.25ex\@plus -1ex \@minus -.2ex}{6.5pt \@plus .2ex}{%
    \SubsectionHeadFont}*{#1}}
\def\@subsection[#1][#2]#3[#4]{%
  \if@ChapterTOCs
    \addtocounter{subsection}{1}%
    \myaddcontentsline{\@chaptoc}{chsubsection}{\string\makebox[\subsecnumwidth][l]{\thesubsection}#1}%
    \addtocounter{subsection}{-1}\fi
  \@startsection{subsection}{2}{\z@}{-3.25ex\@plus -1ex \@minus -.2ex}{6.5pt \@plus .2ex}{%
    \SubsectionHeadFont}[#2]{#3}\ifx#4\@empty\else
\addcontentsline{toc}{subsectionauthor}{#4}
                            \fi}
    \else
\newcommand\subsection{\@ifstar{\@ssubsection}{\@trplarg{\@subsection}}}
\def\@ssubsection#1{%
  \if@ChapterTOCs
%%    \myaddcontentsline{\@chaptoc}{chsubsection}{\string\makebox[\subsecnumwidth][l]{}#1}
\fi
  \@startsection{subsection}{2}{\z@}{-3.25ex\@plus -1ex \@minus -.2ex}{6.5pt \@plus .2ex}{%
    \SubsectionHeadFont}*{#1}}
\def\@subsection[#1][#2]#3{%
  \if@ChapterTOCs
    \addtocounter{subsection}{1}%
    \myaddcontentsline{\@chaptoc}{chsubsection}{\string\makebox[\subsecnumwidth][l]{\thesubsection}#1}%
    \addtocounter{subsection}{-1}\fi
  \@startsection{subsection}{2}{\z@}{-3.25ex\@plus -1ex \@minus -.2ex}{6.5pt \@plus .2ex}{%
    \SubsectionHeadFont}[#2]{#3}}
\fi        

\if@sectionauthor
\newcommand\subsubsection{\@ifstar{\@ssubsubsection}{\@trplarg{\@subsubsection}}}
\def\@ssubsubsection#1{%
  \if@ChapterTOCs
%%\myaddcontentsline{\@chaptoc}{chsubsubsection}{\string\makebox[\subsecnumwidth][l]{}#1}
\fi
  \@startsection{subsubsection}{3}{\z@}{-3.25ex\@plus -1ex \@minus -.2ex}{4.5pt \@plus .2ex}{\SubsubsectionHeadFont}*{#1}}
\def\@subsubsection[#1][#2]#3[#4]{%
  \if@ChapterTOCs
    \addtocounter{subsubsection}{1}%
    \myaddcontentsline{\@chaptoc}{chsubsubsection}{\hskip21pt\string\makebox[\ssubsecnumwidth][l]{\thesubsubsection}#1}%
    \addtocounter{subsubsection}{-1}\fi
  \@startsection{subsubsection}{3}{\z@}{-3.25ex\@plus -1ex \@minus -.2ex}{4.5pt \@plus .2ex}{\SubsubsectionHeadFont}[#2]{#3}  \ifx#4\@empty\else
\addcontentsline{toc}{subsubsectionauthor}{#4}
                            \fi}
\else
\newcommand\subsubsection{\@ifstar{\@ssubsubsection}{\@trplarg{\@subsubsection}}}
\def\@ssubsubsection#1{%
  \if@ChapterTOCs
%%\myaddcontentsline{\@chaptoc}{chsubsubsection}{\string\makebox[\subsecnumwidth][l]{}#1}
\fi
  \@startsection{subsubsection}{3}{\z@}{-3.25ex\@plus -1ex \@minus -.2ex}{4.5pt \@plus .2ex}{\SubsubsectionHeadFont}*{#1}}
\def\@subsubsection[#1][#2]#3{%
  \if@ChapterTOCs
    \addtocounter{subsubsection}{1}%
    \myaddcontentsline{\@chaptoc}{chsubsubsection}{\hskip21pt\string\makebox[\ssubsecnumwidth][l]{\thesubsubsection}#1}%
    \addtocounter{subsubsection}{-1}\fi
  \@startsection{subsubsection}{3}{\z@}{-3.25ex\@plus -1ex \@minus -.2ex}{4.5pt \@plus .2ex}{\SubsubsectionHeadFont}[#2]{#3}}
\fi

%%%\newcommand\section{
%%%\@startsection {section}{1}{\z@}%
%%%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%%%                                   {2.3ex \@plus.2ex}%
%%%                                   {\SectionHeadFont}}
%%%\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
%%%                                     {-3.25ex\@plus -1ex \@minus -.2ex}{1.5ex \@plus .2ex}%
%%%                                     {\SubsectionHeadFont}}
%%%\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%%%                                     {-3.25ex\@plus -1ex \@minus -.2ex}{1.5ex \@plus .2ex}%
%%%                                     {\SubsubsectionHeadFont}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {-3.25ex \@plus1ex \@minus.2ex}%
                                    {3pt}%
                                    {\ParagraphHeadFont}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\SubParagraphHeadFont}}
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
\newcommand\labelenumii{\theenumii.}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\raise1.5pt\hbox{\scriptsize\textbullet}}
\newcommand\labelitemii{\raise1.5pt\hbox{\scriptsize\textbullet}}
\newcommand\labelitemiii{\normalfont\bfseries \textendash}
\newcommand\labelitemiv{\normalfont\bfseries \textendash}
%%\newcommand\labelitemiii{\textasteriskcentered}
%%\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                {\normalfont\bfseries#1}\ignorespaces\kern-2pt}
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
               {\let\@makecaption\@tablecaption\@float{table}}
               {\par\vspace*{-3pt}
\noindent\hbox{\vrule height.5pt width\textwidth}\end@float}
\newenvironment{table*}
               {\let\@makecaption\@tablecaption\@dblfloat{table}}
               {\par\vspace*{-3pt}
\noindent\hbox{\vrule height.5pt width\textwidth}\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\FigNumFont#1}\hskip8pt{\FigCapFont#2}}%
  \ifdim \wd\@tempboxa >\hsize
\vbox{{\FigNumFont#1}\hskip8pt{\FigCapFont#2}}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\box\@tempboxa\hfill}%
  \fi
  \vskip\belowcaptionskip}
\long\def\@tablecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\TableTitleFont#1\par #2}%
  \noindent{\vrule height.5pt width\textwidth}\vspace*{5pt}
  \ifdim \wd\@tempboxa >\hsize
    \TableTitleFont#1\par\vspace*{2pt} #2\par
  \else
      \TableTitleFont#1\par\vspace*{2pt} #2\par
%%%    \global \@minipagefalse
%%%    \hb@xt@\hsize{\box\@tempboxa\hfill}%
  \fi
  \vskip\belowcaptionskip}

\def\endtabular{\crcr\egroup\egroup $\egroup\par}
\expandafter \let \csname endtabular*\endcsname = \endtabular
\def\tabular{\let\@halignto\@empty\@tabular}
\@namedef{tabular*}#1{%
 \setlength\dimen@{#1}%
   \edef\@halignto{to\the\dimen@}\@tabular}
\def\@tabular{\leavevmode\TableBodyFont \hbox \bgroup $\let\@acol\@tabacol
   \let\@classz\@tabclassz
   \let\@classiv\@tabclassiv \let\\\@tabularcr\@tabarray}

\def\sourcefont{\fontsize{8}{10}\selectfont\leftskip0pt\rightskip0pt plus1fill}%
\def\subheadfont{\fontsize{8}{10}\sffamily\selectfont}%

%
\def\source#1{\vbox{\noindent\normalfont\sourcefont \@hangfrom{\itshape Source:\hskip7pt}#1\par}}%
\def\tablefootnote#1{\sourcefont#1}
%
\def\tablenote#1{\vbox{\vspace*{3pt}\noindent\normalfont\sourcefont \@hangfrom{\itshape Note:\hskip7pt}#1\par}}%

\def\tablefirstsubhead#1{\subheadfont\bfseries #1}
\def\tablesecondsubhead#1{\subheadfont\bfseries\itshape #1}
\def\tablethirdsubhead#1{\subheadfont\itshape #1}

\def\tch#1{\TCHFont #1}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}

\newdimen\toctextwidth
\global\toctextwidth\textwidth
%\advance\toctextwidth by 4.5pc
\newcommand\chaptertableofcontents{\hsize\toctextwidth%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \@starttoc{chtoc}%
    \if@restonecol\twocolumn\fi
    }


\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \contentsname}{\contentsname}}%
                        {\let\break\space
    \let\author\toc@author
    \reset@authors
    \let\toc@draw\relax
    \@starttoc{toc}
    \toc@draw
    }
%%    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
    
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{7pc}%
    \begingroup
      \parindent \z@ \rightskip 2pc plus 3pt minus 3pt
      \parfillskip -\@pnumwidth
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \parttocfont#1\nobreak\hfill
 \nobreak\hb@xt@\@pnumwidth{\hss }\par\vskip6pt
      \penalty\@highpenalty
    \endgroup
  \fi}
      
%%%\newcommand*\l@part[2]{%
%%%  \ifnum \c@tocdepth >-2\relax
%%%    \addpenalty{-\@highpenalty}%
%%%    \addvspace{2.25em \@plus\p@}%
%%%    \setlength\@tempdima{4.5em}%
%%%    \begingroup
%%%      \parindent \z@ \rightskip \@pnumwidth
%%%      \parfillskip -\@pnumwidth
%%%      {\leavevmode
%%%            \advance\leftskip\@tempdima
%%%            \hskip-\leftskip
%%%%%       \parttocfont #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
%%%       \parttocfont #1\hfil\hb@xt@\@pnumwidth{\hss }}\par
%%%       \nobreak
%%%         \global\@nobreaktrue
%%%         \everypar{\global\@nobreakfalse\everypar{}}%
%%%    \endgroup
%%%  \fi}
\newdimen\tocauthorbox
\newdimen\tocauthorwd
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{5.5pc}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\leaders\hbox{$\m@th
        \hbox{.}$}\hfill
%% \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
 \nobreak\hbox{\hss #2}\par
 \setbox\tocauthorbox\hbox{\@authors}
 \tocauthorwd\wd\tocauthorbox
 \ifdim\tocauthorwd>\textwidth
     \vspace*{8pt}%
\else
     \vspace*{6pt}%
     \fi
            \if@ChapterTOCs
     \vbox{\hskip-5.4pc\it\draw@authors}\vspace*{8pt}%
     \fi
      \penalty\@highpenalty
    \endgroup
  \fi}

%%%%%%%%%%%%%%%%%%%%%

\newcounter{numauthors}
\newif\if@break
\newif\if@firstauthor


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
  \ifx\@t\@empty
    \let\@t\last@author\fi
  \ifx\@t\@empty\else
    \hskip\leftskip
    \ifx\@authors\@empty
    \else
      \@authors
      \ifnum\c@numauthors>2,\fi
      \if@break\hfill\break\fi
      \ and \fi
    \last@author\hfill\break\fi
  \reset@authors}
\def\reset@authors{%
  \gdef\@authors{}%
  \gdef\last@author{}%
  \@firstauthortrue
  \setcounter{numauthors}{0}}

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
\ifx\chapter@author\@empty\else
\hspace*{5pc}\vbox{\rm\fontsize{10\p@}{10\p@}\bfseries\selectfont
%\the\c@numauthors
    \ifnum\c@numauthors=1
        \chapter@authorone\vskip2\p@
        {\chapter@affiliationone}\vskip12\p@
            \fi
        \ifnum\c@numauthors=2
                    \chapter@authorone\vskip2\p@{\chapter@affiliationone}\vskip12\p@
                        \chapter@authortwo\vskip2\p@{\chapter@affiliationtwo}
                            \fi
                                \ifnum\c@numauthors=3
                                    \chapter@authorone\vskip2\p@{\chapter@affiliationone}\vskip12\p@
                                    \chapter@authortwo\vskip2\p@{\chapter@affiliationtwo}\vskip12\p@
                                     \chapter@authorthree\vskip2\p@{\chapter@affiliationthree}
                                                \fi
                                \ifnum\c@numauthors=4
                                   \chapter@authorone\vskip2\p@{\chapter@affiliationone}\vskip12\p@
                                   \chapter@authortwo\vskip2\p@{\chapter@affiliationtwo}\vskip12\p@
                                   \chapter@authorthree\vskip2\p@{\chapter@affiliationthree}\vskip12\p@
                                    \chapter@authorfour\vskip2\p@{\chapter@affiliationfour}
                                                                        \fi
                             \ifnum\c@numauthors=5
                                  \chapter@authorone\vskip2\p@{\chapter@affiliationone}\vskip12\p@
                                   \chapter@authortwo\vskip2\p@{\chapter@affiliationtwo}\vskip12\p@
                                   \chapter@authorthree\vskip2\p@{\chapter@affiliationthree}\vskip12\p@
                                   \chapter@authorfour\vskip2\p@{\chapter@affiliationfour}\vskip12\p@
                                    \chapter@authorfive\vskip2\p@{\chapter@affiliationfive}        
                                                                        \fi                                                                        
                              \ifnum\c@numauthors=6
                                  \chapter@authorone\vskip2\p@{\chapter@affiliationone}\vskip12\p@
                                   \chapter@authortwo\vskip2\p@{\chapter@affiliationtwo}\vskip12\p@
                                   \chapter@authorthree\vskip2\p@{\chapter@affiliationthree}\vskip12\p@
                                   \chapter@authorfour\vskip2\p@{\chapter@affiliationfour}\vskip12\p@
                                   \chapter@authorfive\vskip2\p@{\chapter@affiliationfive} \vskip12\p@       
                                  \chapter@authorsix\vskip2\p@{\chapter@affiliationsix}                
                                                                        \fi                                                                        
                        \ifnum\c@numauthors=7
                             \chapter@authorone\vskip2\p@{\chapter@affiliationone}\vskip12\p@
                             \chapter@authortwo\vskip2\p@{\chapter@affiliationtwo}\vskip12\p@
                             \chapter@authorthree\vskip2\p@{\chapter@affiliationthree}\vskip12\p@
                            \chapter@authorfour\vskip2\p@{\chapter@affiliationfour}\vskip12\p@
                            \chapter@authorfive\vskip2\p@{\chapter@affiliationfive} \vskip12\p@       
                            \chapter@authorsix\vskip2\p@{\chapter@affiliationsix}  \vskip12\p@                     
                           \chapter@authorseven\vskip2\p@{\chapter@affiliationseven}                
                                                                        \fi                                                                        
}
 \gdef\chapter@authorone{}\gdef\chapter@affiliationone{}%
 \gdef\chapter@authortwo{}\gdef\chapter@affiliationtwo{}%
 \gdef\chapter@authorthree{}\gdef\chapter@affiliationthree{}%
 \gdef\chapter@authorfour{}\gdef\chapter@affiliationfour{}%
  \gdef\chapter@authorfive{}\gdef\chapter@affiliationfive{}%
   \gdef\chapter@authorsix{}\gdef\chapter@affiliationsix{}%
    \gdef\chapter@authorseven{}\gdef\chapter@affiliationseven{}%
  \vskip 6.6\p@
  }\fi
{\leftskip\secnumwidth\def\author##1##2{}\vskip18pt\hbox{\leftskip0pt\ContentsHeadFont CONTENTS}\vskip6pt\par\@input{\thechapter.toc}\par}%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand\singleauthorchapter{\finishedfromonetrue}
\newcommand\twoauthorchapter{\finishedfromtwotrue}
\newcommand\threeauthorchapter{\finishedfromthreetrue}
\newcommand\fourauthorchapter{\finishedfromfourtrue}
\newcommand\fiveauthorchapter{\finishedfromfivetrue}
\newcommand\sixauthorchapter{\finishedfromsixtrue}
\newcommand\sevenauthorchapter{\finishedfromseventrue}
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
%
\newsavebox\@AUaffonebox
\newsavebox\@AUafftwobox
\newsavebox\@AUaffthreebox
\newsavebox\@AUafffourbox
\newsavebox\@AUafffivebox
\newsavebox\@AUaffsixbox
\newsavebox\@AUaffsevenbox
%
\newsavebox\@finalAUboxfromone
\newsavebox\@finalAUboxfromtwo
\newsavebox\@finalAUboxfromthree
\newsavebox\@finalAUboxfromfour
\newsavebox\@finalAUboxfromfive
\newsavebox\@finalAUboxfromsix
\newsavebox\@finalAUboxfromseven
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

\ifnum\c@numauthors>6
    \resetcounter{numauthors}
\fi 
\stepcounter{numauthors}
%%\the\c@numauthors
\ifnum\c@numauthors=1 % 
    \sbox\@AUonebox{\CAPlusOneFont#1}
    \sbox\@AUaffonebox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromone{\copy\@AUonebox}
    \def\chapter@authorone{\copy\@finalAUboxfromone}
    \def\chapter@affiliationone{\copy\@AUaffonebox}
\fi \ifnum\c@numauthors=2
    \sbox\@AUtwobox{\CAPlusOneFont#1}
    \sbox\@AUafftwobox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromtwo{\copy\@AUtwobox}
    \def\chapter@authortwo{\copy\@finalAUboxfromtwo}
    \def\chapter@affiliationtwo{\copy\@AUafftwobox}
\fi \ifnum\c@numauthors=3
    \sbox\@AUthreebox{\CAPlusOneFont#1}
    \sbox\@AUaffthreebox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromthree{\copy\@AUthreebox}
    \def\chapter@authorthree{\copy\@finalAUboxfromthree}
    \def\chapter@affiliationthree{\copy\@AUaffthreebox}
\fi \ifnum\c@numauthors=4
    \sbox\@AUfourbox{\CAPlusOneFont#1}
    \sbox\@AUafffourbox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromfour{\copy\@AUfourbox}
    \def\chapter@authorfour{\copy\@finalAUboxfromfour}
    \def\chapter@affiliationfour{\copy\@AUafffourbox}
\fi\ifnum\c@numauthors=5
    \sbox\@AUfivebox{\CAPlusOneFont#1}
    \sbox\@AUafffivebox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromfive{\copy\@AUfivebox}
    \def\chapter@authorfive{\copy\@finalAUboxfromfive}
    \def\chapter@affiliationfive{\copy\@AUafffivebox}
\fi\ifnum\c@numauthors=6
    \sbox\@AUsixbox{\CAPlusOneFont#1}
    \sbox\@AUaffsixbox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromsix{\copy\@AUsixbox}
    \def\chapter@authorsix{\copy\@finalAUboxfromsix}
    \def\chapter@affiliationsix{\copy\@AUaffsixbox}
\fi\ifnum\c@numauthors=7
    \sbox\@AUsevenbox{\CAPlusOneFont#1}
    \sbox\@AUaffsevenbox{\vbox{\hsize\textwidth\CAAPlusOneFont\noindent #2\par}}
    \sbox\@finalAUboxfromseven{\copy\@AUsevenbox}
    \def\chapter@authorseven{\copy\@finalAUboxfromseven}
    \def\chapter@affiliationseven{\copy\@AUaffsevenbox}
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

%%%%%%%%%%%%%%%%%%%%

%%%%
%%%\def\l@author#1#2{%\pagebreak[3]
%%%   \vskip 3pt plus 1pt
%%%   \@tempdima 1.5em
%%%   \begingroup
%%%     \parindent \z@
%%%     \rightskip \@pnumwidth
%%%     \parfillskip -\@pnumwidth
%%%     \hskip15pt\it \leavevmode
%%%     \advance\leftskip\@tempdima
%%%     \hskip -\leftskip
%%%     \vbox{\hsize23pc\raggedright #1}\nobreak
%%%     \hfil \nobreak\hbox to\@pnumwidth{\hss }
%%%\par\addvspace{6pt}
%%%   \endgroup}

\newcommand*\l@sectionauthor{\@audottedtocline{1}{5.5em}{2.3em}}  
\newcommand*\l@subsectionauthor{\@audottedtocline{2}{7.8em}{3.2em}}
\newcommand*\l@subsubsectionauthor{\@audottedtocline{3}{11.0em}{4.1em}}
\newcommand*\l@section{\@dottedtocline{1}{6.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{8.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{12.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{14em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{16em}{6em}}


\def\@audottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4\hfill}
     \par}%
  \fi}



\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
%%%    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue\baselineskip12pt
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \hbox{.}$}\hfill
     \nobreak
%%     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \hbox{\hfil\normalfont\normalcolor #5}%
     \par}%
  \fi}

\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\listfigurename}%
              {\listfigurename}%\MakeUppercase
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{%
          \listtablename}%\MakeUppercase
         {\listtablename}%\MakeUppercase
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\def\@biblabel#1{\bf#1}
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\bibfont%\chapter*{\bibname}%
%%      \@mkboth{\bibname}{\bibname}%\MakeUppercase
%%%      \list{\ifx#1 \llap{\@biblabel{\@arabic\c@enumiv}} \else \fi}%
      \list{\llap{\@biblabel{\@arabic\c@enumiv}}}%
                       {\settowidth\labelwidth{\@biblabel{#1}}%
%%%           \ifx#1
                    \leftmargin\labelwidth
                    \advance\leftmargin10pt%\labelsep
%%%            \else
%%%                   \leftmargin22pt\itemindent-22pt
%%%            \fi
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
\newenvironment{theindex}
               {\cleardoublepage\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                              \addcontentsline{toc}{chapter}{\bfseries\indexname}
                \thispagestyle{plain}\parindent\z@
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
\newcommand\bibname{References}
\newcommand\indexname{Index}
\newcommand\figurename{FIGURE}
\newcommand\tablename{TABLE}
\newcommand\partname{Section}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
  
%
\newcount\minute
\newcount\hour
\def\currenttime{%
     \minute\time
     \hour\minute
     \divide\hour60
     \the\hour:\multiply\hour60\advance\minute-\hour\the\minute}


\ifprinter
  \def\draftnote{}%
\else
  \def\draftnote{}%
%%  \def\draftnote{
%%     \hbox{\hskip150pt\footnotesize \jobtag\qquad\today\qquad\currenttime\hfil}}
\fi
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End Version Control  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\trimmarks{%
  \vbox to 0pt{\vskip-13pt
  \draftnote\offinterlineskip
  \parindent0pt
  \leftskip0pt\rightskip0pt}%
 \ifdraft
    \vbox to 0pt{\hsize\trimwidth\offinterlineskip
    \parindent0pt\leftskip0pt\rightskip0pt
    \vbox to \trimheight{\offinterlineskip\parindent0pt
    {\hbox to \trimwidth{\vrule height\trimheight width\trimrule}%
    \hbox to \trimwidth{\hss{\vrule width\trimwidth height\trimrule}\hss}%
    \par\vskip-\trimheight
    \hbox to \trimwidth{\hss{\vrule width\trimwidth height\trimrule}\hss}%
    {\hskip\trimwidth{\vrule height\trimheight width\trimrule}}}}}%
  \else
    \vbox to 0pt{\hsize\trimwidth\offinterlineskip
    \parindent0pt\leftskip0pt\rightskip0pt
    \vbox to \trimheight{\offinterlineskip\parindent0pt
    \hbox to \trimwidth{\vbox to 1.5pc{\vskip-3pc\hbox{\vrule height1.5pc width\trimrule}}\raisebox{1.5pc}{\hbox{\hskip-3pc\vrule width1.5pc height\trimrule}}\hfill
      \raisebox{1.5pc}{\hskip1.5pc\vrule width1.5pc height\trimrule\hskip-3.25pc}
      \vbox to 1.5pc{\vskip-3pc\hbox{\vrule height1.5pc width\trimrule}}%
    }\vfill
    \hbox to \trimwidth{\hbox{\hskip-3pc\vrule height\trimrule width1.5pc}\vbox to 3pc{\vspace*{4.5pc}\hbox{\hskip1.5pc\vrule width\trimrule height1.5pc}}\hfill
    \vbox to 3pc{\vskip4.5pc\hbox{\vrule height1.5pc width\trimrule}}\rlap{\hskip1.5pc\vrule width1.5pc height\trimrule}}}}%
  \fi
%
  \vbox to 0pt{%\vskip.5pt%
  \offinterlineskip\parindent0pt
  \vskip \topmargin
  \tempdimen\normaltextheight
  \advance\tempdimen\headheight
  \advance\tempdimen\headsep
  %\advance\tempdimen-.5pt
  \moveright\@themargin
         \hbox to \textwidth{\hss\hbox to \typewidth{%
         \vbox to \tempdimen{\hrule height\draftrule
         \vbox to 0pt{\vskip\headheight\vskip\headsep%\vskip-.75pt
                \hbox{\vrule height\draftrule width\typewidth}}%
         \hbox to \typewidth{\vrule width\draftrule
         \hfill\hbox{\vrule height\tempdimen width\draftrule}%
         \hskip1.5pc\hbox{\vrule height\tempdimen width\draftrule}\hskip\textwidth
          \vrule height\tempdimen width\draftrule}%
         \hrule height\draftrule}}}}%
}
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End Trimmarks  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Output Routine  %%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\@outputpage{%
\begingroup           % the \endgroup is put in by \aftergroup
  \let \protect \noexpand
  \@resetactivechars
  \@parboxrestore
  \shipout \vbox{%
    \set@typeset@protect
    \aftergroup \endgroup
    \aftergroup \set@typeset@protect
                                % correct? or just restore by ending
                                % the group?
  \if@specialpage
    \global\@specialpagefalse\@nameuse{ps@\@specialstyle}%
  \fi
  \if@twoside
    \ifodd\count\z@ \let\@thehead\@oddhead \let\@thefoot\@oddfoot
         \let\@themargin\oddsidemargin
    \else \let\@thehead\@evenhead
       \let\@thefoot\@evenfoot \let\@themargin\evensidemargin
    \fi
  \fi
  \reset@font
  \normalsize
  \normalsfcodes
  \let\label\@gobble
  \let\index\@gobble
  \let\glossary\@gobble
  \baselineskip\z@skip \lineskip\z@skip \lineskiplimit\z@
    \@begindvi\trimmarks
    \vskip \topmargin
    \moveright\@themargin \vbox {%
      \setbox\@tempboxa \vbox to\headheight{%
        \vfil
        \color@hbox
          \normalcolor
          \hb@xt@\textwidth{\@thehead}%
        \color@endbox
        }%                        %% 22 Feb 87
      \dp\@tempboxa \z@
      \box\@tempboxa
      \vskip \headsep
      \box\@outputbox
      \baselineskip \footskip
      \color@hbox
        \normalcolor
        \hb@xt@\textwidth{\@thefoot}%
      \color@endbox
      }%
    }%
  \global \@colht \textheight
  \stepcounter{page}%
  \let\firstmark\botmark
}
%
\def\figalign#1{\gdef\@figalign{#1}}\figalign{}
%
\def\@outputdblcol{%
  \if@firstcolumn
    \global \@firstcolumnfalse
    \global \setbox\@leftcolumn \box\@outputbox
%    \ifswitchcols\global\switchcolsfalse
%       \ifdim\@partialpageht>0pt\advance\@partialpageht-.5pt\fi
%       \vglue\@partialpageht
%    \fi
  \else
    \global \@firstcolumntrue
    \setbox\@outputbox \vbox {%
                         \hbox to\textwidth {%
                           \hbox to\columnwidth {%
                             \box\@leftcolumn \hss}%
                           \hfil
                           \vrule \@width\columnseprule
                           \hfil
                           \hbox to\columnwidth {%
                             \box\@outputbox \hss}%
                                             }%
                              }%
    \@combinedblfloats
    \@outputpage
    \begingroup
      \@dblfloatplacement
      \@startdblcolumn
      \@whilesw\if@fcolmade \fi
        {\@outputpage
         \@startdblcolumn}%
    \endgroup
  \fi
}
%%%%%%%%%%%%%%%

%%\def\qtoa#1#2{\marginpar{\vspace*{#2}\raggedleft\footnotesize\bi#1\par}}
\def\qtoa#1{\marginpar{\raggedleft\footnotesize\bf #1\par}}
\def\QTOA#1{\marginpar{\raggedleft\footnotesize\bi#1\par}}
%

%
%%%%%%%%%%%% Glossary %%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{Glossary}
               {\list{}{\labelwidth\z@\leftmargin36pt \itemindent-36pt
                        \let\makelabel\glosslabel}}
               {\endlist}
\newcommand\glosslabel[1]{\hspace\labelsep\normalfont\bfseries #1:}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{LD}
               {\list{}{\labelwidth\z@\leftmargin45pt \itemindent-45pt
                        \let\makelabel\PLDlabel}\leftskip1em\rightskip1em}
               {\endlist}
\newcommand\PLDlabel[1]{\hspace\labelsep\normalfont\itshape #1:}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{LDS}
               {\list{}{\labelwidth\z@\leftmargin0pt\itemindent0pt\topsep6pt\ignorespaces\noindent
                        \let\makelabel\PLDSlabel}\leftskip1em\rightskip1em\itshape}
               {\endlist}
\newcommand\PLDSlabel[1]{\noindent\hspace\labelsep\normalfont\itshape #1}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{PLD}
               {\list{}{\labelwidth\z@\leftmargin48pt \itemindent-48pt
                        \let\makelabel\LDlabel}}
               {\endlist}
\newcommand\LDlabel[1]{\hspace\labelsep\normalfont\itshape #1:}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{PLDS}
               {\list{}{\labelwidth\z@\leftmargin0pt\itemindent0pt\topsep6pt\ignorespaces\noindent
                        \let\makelabel\LDSlabel}\itshape}
               {\endlist}
\newcommand\LDSlabel[1]{\noindent\hspace\labelsep\normalfont\itshape #1}


%%%%%%%%%%%%
\newif\iffnalpha
\global\fnalphafalse

\newskip\listtextleftmargin\listtextleftmargin 20pt%24pt
\newskip\listtextleftmarginii\listtextleftmarginii0pt% 24pt
\newskip\listtextleftmarginiii\listtextleftmarginiii0pt% 24pt
\newskip\listtextleftmarginiv\listtextleftmarginiv0pt% 24pt

\newskip\listtextrightmargin\listtextrightmargin12pt%.5pc
\newskip\listlabelleftskip \listlabelleftskip8pt%3.3pt
\newskip\listlabelleftskipii \listlabelleftskipii0pt%3.3pt
\newskip\listlabelleftskipiii \listlabelleftskipiii0pt%3.3pt
\newskip\listlabelleftskipiv \listlabelleftskipiv0pt%3.3pt

\newskip\abovelistskipi\abovelistskipi6pt% plus2pt
\newskip\belowlistskipi\belowlistskipi6pt% plus2pt
\newskip\abovelistskipii\abovelistskipii0pt% plus2pt
\newskip\belowlistskipii\belowlistskipii0pt% plus2pt
\newskip\abovelistskipiii\abovelistskipiii0pt% plus2pt
\newskip\belowlistskipiii\belowlistskipiii0pt% plus2pt
\newskip\abovelistskipiv\abovelistskipiv0pt% plus2pt
\newskip\belowlistskipiv\belowlistskipiv0pt% plus2pt

\newskip\labelsepi \labelsepi6pt
\newskip\labelsepii \labelsepii8pt
\newskip\labelsepiii \labelsepiii8pt%\z@
\newskip\labelsepiv \labelsepiv8pt%\z@

\newskip\itemsepi\itemsepi-0pt%10pt
\newskip\itemsepii\itemsepii-0pt
\newskip\itemsepiii\itemsepiii-0pt
\newskip\itemsepiv \itemsepiv0pt

\newdimen\enumdimwd
\newif\iflabelrightalign\labelrightaligntrue
\newdimen\enumdim%
%
\def\enummax#1{%
  \labelsep\csname labelsep\romannumeral\the\@enumdepth\endcsname
  \ifdim\listtextleftmargin>\z@\labelsepi0pt\fi
  \ifdim\listtextleftmarginii>\z@\labelsepii0pt\fi
  \ifdim\listtextleftmarginiii>\z@\labelsepiii0pt\fi
  \setbox\tempbox\hbox{\csname listdevicefont\romannumeral\the\@enumdepth\endcsname#1\hskip\labelsep}%
  \enumdim\wd\tempbox
  \setbox\tempbox\hbox{\csname listdevicefont\romannumeral\the\@enumdepth\endcsname#1}%
  \enumdimwd\wd\tempbox
  \expandafter\global\csname leftmargin\romannumeral\the\@enumdepth\endcsname\enumdim
  \ifdim\listtextleftmargin>\z@
     \leftmargini\listtextleftmargin
     \ifdim\listlabelleftskip>\z@
        \advance\leftmargini-\listlabelleftskip
     \fi  
  \fi
  \ifdim\listtextleftmarginii>\z@
     \leftmarginii\listtextleftmarginii
     \ifdim\listlabelleftskipii>\z@
        \advance\leftmarginii-\listlabelleftskipii
     \fi  
  \fi
  \ifdim\listtextleftmarginiii>\z@
     \leftmarginiii\listtextleftmarginiii
     \ifdim\listlabelleftskipiii>\z@
        \advance\leftmarginiii-\listlabelleftskipiii
     \fi  
  \fi
}
%
\enummax{1.}
%
\def\enumerate{\@ifnextchar[{\@enumerate}{\@enumerate[\csname label\@enumctr\endcsname]}}%% 
%

\def\@enumerate[#1]{\par
      \ifnum \@enumdepth >4 \@toodeep
      \else
         \advance\@enumdepth\@ne
         \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
         \setcounter{\@enumctr}{1}\enummax{#1}%
         \list
            {\csname label\@enumctr\endcsname}{\usecounter{\@enumctr}%
         \topsep\csname abovelistskip\romannumeral\the\@enumdepth\endcsname
         \itemsep\csname itemsep\romannumeral\the\@enumdepth\endcsname
%         \listfont %\listparindent18.25pt
         \ifnum \@enumdepth=1 \leftmargin24.7pt
            \rightmargin\listtextrightmargin
            \advance\rightmargin\rightskip
            \advance\leftmargin\leftskip
            \tempdimen\leftmargini
            \advance\tempdimen-\labelsep
           %%%%%%%%%%% 
           \iffnalpha 
            \def\makelabel##1{{\hskip\listlabelleftskip{\csname listdevicefont\romannumeral\the\@enumdepth\endcsname{\iflabelrightalign\hss\fi\textlistlabel##1}}}}%
            \global\fnalphafalse
           \else
            \def\makelabel##1{\hbox to \tempdimen{\hskip\listlabelleftskip{\csname listdevicefont\romannumeral\the\@enumdepth\endcsname\hbox to \enumdimwd{\iflabelrightalign\hss\fi\textlistlabel##1}}\blackink}}%
           \fi 
           %%%%%%%%%%%%%%%%%%%%%%%%%%%
         \else
            \ifnum \@enumdepth=2
               \tempdimen\leftmarginii
               \advance\tempdimen-\labelsep
               \def\makelabel##1{\hbox to \tempdimen{\hskip\listlabelleftskipii{\csname listdevicefont\romannumeral\the\@enumdepth\endcsname\hbox to \enumdimwd{\iflabelrightalign\hss\fi##1}\blackink}}}%
            \else
               \ifnum \@enumdepth=3
                  \tempdimen\leftmarginiii
                  \advance\tempdimen-\labelsep
                  \def\makelabel##1{\hbox to \tempdimen{\hskip\listlabelleftskipiii{\csname listdevicefont\romannumeral\the\@enumdepth\endcsname\hbox to \enumdimwd{\iflabelrightalign\hss\fi##1}\blackink}}}%
                 \ifnum \@enumdepth=4
                    \tempdimen\leftmarginiv
                    \advance\tempdimen-\labelsep
                    \def\makelabel##1{\hbox to \tempdimen{\hskip\listlabelleftskipiv{\csname listdevicefont\romannumeral\the\@enumdepth\endcsname\hbox to \enumdimwd{\iflabelrightalign\hss\fi##1}\blackink}}}%
              \else
                                       \def\makelabel##1{\hss\llap{\csname listdevicefont\romannumeral\the\@enumdepth\endcsname##1}}%
                                    \fi   
                                 \fi   
                                 \fi
         \fi}
      \fi}
%
\def\endenumerate{\@topsepadd\csname belowlistskip\romannumeral\the\@enumdepth\endcsname\endlist}%
%

\def\textlistlabel{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% itemize (bullet) %%%%%%%%%%%%%%%%%%%%%%%%%%
%
% define \itemizeiTopSep if it is different from \topsepi
%
\newdimen\itemleftmargin \itemleftmargin11\p@ % won't be active in enumerate
\newdimen\itemlabelsep \itemlabelsep10\p@ % labelsep in itemize for all levels
%
\def\itemize{%
  \ifnum \@itemdepth >3 \@toodeep\else\ifnum\@enumdepth>0\@itemdepth\@enumdepth\fi \advance\@itemdepth \@ne
     \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
     \list{\csname\@itemitem\endcsname}%
        {%\vskip12pt%
%        \topsep0pt%
        \csname abovelistskip\romannumeral\the\@itemdepth\endcsname%\fi
%        \itemsep0pt%
        \csname itemsep\romannumeral\the\@itemdepth\endcsname
        \labelsep\itemlabelsep
%%        \listfont
        \setbox\tempbox\hbox{\csname\@itemitem\endcsname}
        \csname leftmargin\romannumeral\the\@itemdepth\endcsname\wd\tempbox
        \advance\csname leftmargin\romannumeral\the\@itemdepth\endcsname\itemlabelsep
        \ifnum\@itemdepth=\@ne\ifnum\@enumdepth=0 % if not inside an enumerate
           \rightmargin\listtextrightmargin
           \advance\rightmargin\rightskip
           \advance\csname leftmargin\romannumeral\the\@itemdepth\endcsname\itemleftmargin
           \advance\leftmargini\leftskip
        \else
        \ifnum\@itemdepth=2
        \else
        \advance\csname leftmargin\romannumeral\the\@itemdepth\endcsname\itemleftmargin
           \advance\leftmarginii\leftskip
        \fi\fi\fi
       \leftmargin\csname leftmargin\romannumeral\the\@itemdepth\endcsname
        \def\makelabel##1{\hss\llap{##1}\blackink}}
   \fi}%
%
\def\enditemize{%
%\@topsepadd11pt%
\csname itemsep\romannumeral\the\@itemdepth\endcsname
\csname belowlistskip\romannumeral\the\@itemdepth\endcsname%\fi
\endlist}
%

\def\Boxhead#1{\par\addvspace{0pt}\noindent{\centering\bfseries\uppercase{#1}\par}\vskip6pt}


\newbox\tempbox%
\newdimen\tempdimen%
%
\newenvironment{shortbox}{\par\addvspace{12pt plus2pt}%
\if@nemilova
\setbox\tempbox\vbox\bgroup\hsize27pc%
\else\if@nemilovb
\setbox\tempbox\vbox\bgroup\hsize32pc%
\else
\setbox\tempbox\vbox\bgroup\hsize25pc%
\fi\fi
}{%
\egroup%
\noindent\fboxsep6pt\fboxrule.5pt\hspace*{0pt}\fbox{\box\tempbox}
\par\addvspace{12pt plus2pt}}%
%


\def\grayink{\special{color cmyk 0 0 0 0.1}}
\def\blackink{\special{color cmyk 0 0 0 1.0}} %  
\def\whiteink{\special{color cmyk 0 0 0 0}} % 0%

\newenvironment{shadebox}{%
\setbox\tempbox\hbox\bgroup\vbox\bgroup\vspace*{11pt}\noindent\leftskip14pt\rightskip\leftskip\noindent\ignorespaces}{\par\addvspace{12pt}
\egroup\egroup\par\addvspace{15pt} 
\tempdimen\ht\tempbox
%\advance\tempdimen by 1pc
\noindent{\hbox to \wd\tempbox{\vbox to \ht\tempbox{\hsize\textwidth{\special{color push}\grayink
\noindent\vrule height\tempdimen width\textwidth 
\special{color pop}\blackink}}}}%
\llap{\unhbox\tempbox}\par\addvspace{12pt}}

%%%%%%%%%% Note %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\notehead{Note}
\newenvironment{note}{\par\addvspace{6pt}\notefont%
\noindent{\bfseries\notehead:}\enspace\noindent\ignorespaces
}{%
  \par\addvspace{6pt}}


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
\newenvironment{wherelist}[1]{%\addvspace{6pt}
\leftskip10pt%
			\setbox\wherebox\hbox{#1\hskip.5em}%
   \global\wherewidth\wd\wherebox
\noindent\hspace*{-13pt} where
}{%
\par\addvspace{6pt}}
\def\whereentry#1#2#3{\par\noindent\@hangfrom{\hbox to \wherewidth{#1\hss}#2\hskip6pt}#3\par}

%%%%%%%%%%%%
\newenvironment{unnumlist}{%
  \ifnum \@enumdepth >4 \@toodeep\else
    \advance\@enumdepth\@ne
    \list{}{%
    \ifnum \@enumdepth = 1
    \leftmargin24pt\leftmarginii12pt\itemindent-15pt
    \def\makelabel##1{\hss\llap{##1}}\rightmargin1pc
    \else\ifnum \@enumdepth = 2
    \leftmargin15pt\leftmarginii12pt\itemindent-15pt
    \def\makelabel##1{\hss\llap{##1}}
    \else\ifnum \@enumdepth = 3
    \leftmargin15pt\leftmarginii12pt\itemindent-15pt
    \def\makelabel##1{\hss\llap{##1}}
    \else\ifnum \@enumdepth = 4
    \leftmargin15pt\leftmarginii12pt\itemindent-15pt
    \def\makelabel##1{\hss\llap{##1}}
    \else\fi\fi
    \fi\fi}
    \fi%
}{%
  \endlist\rightskip0pt}

%
\newenvironment{extract}{%
		\par\addvspace{6pt minus2pt}%
  \leftskip12pt\rightskip\leftskip
 \noindent\ignorespaces
}{%
		\par\addvspace{6pt minus2pt}%
  \@endparenv}
%


%%%%%%%%%%%%%%%%%%%%%%%%%%%% Extract
  %
\newenvironment{QT3}{\QTthreefont%
		\par\addvspace{6pt minus2pt}%
  \leftskip2em\rightskip\leftskip
 \noindent\ignorespaces
}{%
		\par\addvspace{6pt minus2pt}%
  \@endparenv}
%

%
\newenvironment{QT2}{\QTtwofont%
		\par\addvspace{6pt minus2pt}%
  \leftskip2em\rightskip\leftskip
 \noindent\ignorespaces
}{%
		\par\addvspace{6pt minus2pt}%
  \@endparenv}
%

  %
\newenvironment{QT1}{\QTonefont%
		\par\addvspace{12pt}%
  \leftskip1em\rightskip\leftskip
 \noindent\ignorespaces
}{%
		\par\addvspace{12pt}%
  \@endparenv}
%
  %
\newenvironment{QT}{\QTonefont%
		\par\addvspace{12pt}%
  \leftskip1em\rightskip\leftskip
}{%
		\par\addvspace{12pt}%
  \@endparenv}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\VAU#1#2{\vbox{\centering{\VigHfont\itshape #1}\par\VigHfont#2}\par\vspace*{12pt}}
\def\VAff#1{\vbox{\centering\VigHfont #1}}
%
\newcounter{Vig}[chapter]
\def\vignatename{VIGNETTE}
\newenvironment{Vig}[1]{%
\refstepcounter{Vig}
		\par\addvspace{12pt minus2pt}%
		\noindent{\vrule height2pt width\textwidth}\par\vskip3pt
  \leftskip1em\rightskip\leftskip
\vbox{\centering\VigHfont\bfseries \vignatename~\thechapter.\theVig{\hskip1em}#1}\par\vspace*{6pt}
\noindent\ignorespaces
}{%
\par\vskip0pt\leftskip0pt\noindent{\vrule height2pt width\textwidth}\par\addvspace{12pt minus2pt}%
  \@endparenv}
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\BAU#1#2{\vbox{\centering{\bf #1}\par\vspace*{3pt}{\itshape #2}}\par\vspace*{11pt}}
\def\BAff#1{\vbox{\centering #1}}
%
\newcounter{Boxhead}[chapter]
\def\boxheadname{BOX}
\newenvironment{Boxedtext}[1]{%
\refstepcounter{Boxhead}
		\par\addvspace{-1pt minus2pt}%
  \leftskip12pt\rightskip\leftskip
\vbox{\centering\BoxHfont\boxheadname~\thechapter.\theBoxhead{\hskip1em}\uppercase{#1}}\par\vspace*{16pt}
\noindent\ignorespaces
}{%
\par\vskip0pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\EAU#1#2{\vbox{\centering{\normalsize\itshape #1}\par\vspace*{1pt}#2}\par\vspace*{12pt}}
\def\EAff#1{\vbox{\centering #1}}
%
\newcounter{Ext}[chapter]
\def\extractname{EXTRACT}
\newenvironment{Ext}[1]{\Extfont%
\refstepcounter{Ext}
		\par\addvspace{12pt minus2pt}%
  \leftskip1em\rightskip\leftskip
\vbox{\centering\ExtHfont \extractname~\thechapter.\theExt{\hskip1em}#1}\par\vspace*{12pt}
\noindent\ignorespaces
}{%
\par\vskip0pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%

%%%%%%%%%%%%%%%%%%%%%%%%
\def\PRBAU#1#2{\noindent{{\itshape #1}\par\noindent#2}\par\vspace*{8pt}}

\newcounter{Problem}[chapter]

\renewcommand\theProblem
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@Problem}


\newenvironment{Problem}[1]{\PRBfont%
\refstepcounter{Problem}
		\par\addvspace{12pt minus2pt}%
  \leftskip24pt\rightskip\leftskip
  \noindent{\bfseries PROBLEM~\theProblem\par\noindent#1}\par\vspace*{8pt}
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%

\newenvironment{Problem*}[1]{\PRBfont%
		\par\addvspace{12pt minus2pt}%
  \leftskip24pt\rightskip\leftskip
  \noindent{\bfseries #1}\par\vspace*{12pt}
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\EXM#1{{\EXHfont #1\par}\addvspace{5.5pt}}
%
\def\EXMA#1#2{\addvspace{12pt}\raggedleft {\EXMAFont #1}\rightskip12pt\par{\EXMAAFont #2}\rightskip12pt}
%
\def\EXMAU#1#2{{{\EXMAUFont #1}\par\noindent{\EXMAUAFont #2}}\par\vspace*{6pt}}

\newenvironment{Example*}[1]{\EXMFont%
\refstepcounter{Example}
		\par\addvspace{12pt minus2pt}%
  \leftskip12pt\rightskip\leftskip
  \noindent{\EXMHfont #1}\par\vspace*{12pt}
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%


\newcounter{Example}[chapter]

\renewcommand\theExample
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@Example}


\newenvironment{Example}[1]{\EXMFont%
\refstepcounter{Example}
		\par\addvspace{12pt minus2pt}%
  \leftskip12pt\rightskip\leftskip
  \noindent{\EXMHfont Example~\theExample:{\enspace}#1}\par\vspace*{12pt}
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%

%
\newenvironment{MExample}{\EXMFont%
		\par\addvspace{4pt minus2pt}%
\hbox to \textwidth{\hfil\textasteriskcentered\enspace\textasteriskcentered\enspace\textasteriskcentered\hfil}\vspace*{4pt}\par
  \leftskip12pt\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt%\addvspace{1pt minus2pt}%
  \@endparenv}
%

%%%%%%%%%%%%% General %%%%%%%%%%%%%%%%%%%%%%%

\def\GAU#1#2{\vbox{\centering{\bf #1}\par\vspace*{3pt}{\itshape #2}}\par\vspace*{8pt}}

\newcounter{general}[chapter]

\renewcommand\thegeneral
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@general}

\newenvironment{general}[1]{%
\refstepcounter{general}
		\par\addvspace{12pt minus2pt}%
  \noindent{\bfseries GENERAL~\thegeneral\quad\noindent#1}\par\vspace*{13pt}
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%

%
\newenvironment{general*}{%
		\par\addvspace{12pt minus2pt}%
%\@afterheading
\parindent15pt
 \noindent\ignorespaces
}{%
\par\addvspace{-3pt}\leftskip0pt\addvspace{10pt minus2pt}%
  \@endparenv}
%

\def\GEXH#1{{\bfseries #1\par}\addvspace{13.5pt}}
\def\GA#1#2{\addvspace{12pt}\raggedleft {\bfseries #1}\par{\itshape #2}}
%
\newenvironment{GEX1}{%
		\par\addvspace{12pt minus2pt}%
%  \leftskip2em\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%
%
\newenvironment{GMEX1}{%
		\par\addvspace{4pt minus2pt}%
\hbox to \textwidth{\hfil\textasteriskcentered\enspace\textasteriskcentered\enspace\textasteriskcentered\hfil}\vspace*{4pt}\par
%  \leftskip2em\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt%\addvspace{1pt minus2pt}%
  \@endparenv}
%



%%%%%%%%%%%% Sidebar %%%%%%%%%%%%%%%%%%%%%%
\def\SAU#1#2{\noindent{{\fontsize{9}{11}\bfseries\itshape\selectfont #1}\par\vspace*{3pt}\noindent{\fontsize{9}{11}\itshape\selectfont#2}}\par\vspace*{8pt}}

\newcounter{Sidebar}[chapter]
\newenvironment{sidebar}[1]{\Sidebarfont%
\refstepcounter{Sidebar}
		\par\addvspace{12pt minus2pt}%
  \noindent{\fontsize{9}{9}\bfseries\selectfont SIDEBAR~\thechapter.\theSidebar\par\noindent#1}\par\vspace*{12pt}
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%

%
\newenvironment{sidebar*}{\Sidebarfont%
		\par\addvspace{12pt minus2pt}%
%\@afterheading
\parindent15pt
 \noindent\ignorespaces
}{%
\par\addvspace{-3pt}\leftskip0pt\addvspace{10pt minus2pt}%
  \@endparenv}
%

\def\SEXH#1{{\SidebarHfont #1\par}\addvspace{5.5pt}}
\def\SA#1#2{\addvspace{12pt}\raggedleft\Sidebarfont {\bfseries #1}\par{\itshape #2}}
%
\newenvironment{SEX1}{\Sidebarfont%
		\par\addvspace{12pt minus2pt}%
%  \leftskip2em\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%
\def\SEXH#1{{\PRBHfont #1\par}\addvspace{5.5pt}}
%
\newenvironment{SMEX1}{\Sidebarfont%
		\par\addvspace{4pt minus2pt}%
\hbox to \textwidth{\hfil\textasteriskcentered\enspace\textasteriskcentered\enspace\textasteriskcentered\hfil}\vspace*{4pt}\par
%  \leftskip2em\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt%\addvspace{1pt minus2pt}%
  \@endparenv}
%

%%%%%%%%%%%%
\def\PEXH#1{{\PRBHfont #1\par}\addvspace{5.5pt}}
\def\PA#1#2{\addvspace{12pt}\raggedleft\PRBfont {\bfseries #1}\rightskip2em\par{\itshape #2}\rightskip2em}
%
\newenvironment{PEX1}{\PRBfont%
		\par\addvspace{12pt minus2pt}%
  \leftskip24pt\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%
%
\newenvironment{PMEX1}{\PRBfont%
		\par\addvspace{4pt minus2pt}%
\hbox to \textwidth{\hfil\textasteriskcentered\enspace\textasteriskcentered\enspace\textasteriskcentered\hfil}\vspace*{4pt}\par
  \leftskip24pt\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt%\addvspace{1pt minus2pt}%
  \@endparenv}
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\BEXA#1#2{\addvspace{12pt}\raggedleft {\bfseries #1}\rightskip12pt\par{\itshape #2}\rightskip12pt}
%
\newenvironment{BEX1}{\EXFont%
		\par\addvspace{5pt minus2pt}%
  \leftskip12pt\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%

%
\newenvironment{MBEX1}{\EXFont%
		\par\addvspace{4pt minus2pt}%
\hbox to \textwidth{\hfil\textasteriskcentered\enspace\textasteriskcentered\enspace\textasteriskcentered\hfil}\vspace*{4pt}\par
  \leftskip12pt\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt%\addvspace{1pt minus2pt}%
  \@endparenv}
%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\EXH#1{{\EXHfont #1\par}\addvspace{3.5pt}}
%
\def\EXA#1#2{\addvspace{12pt}\raggedleft {\bfseries #1}\rightskip1em\par{\itshape #2}\rightskip1em}
%
\newenvironment{EX1}{\EXFont%
		\par\addvspace{12pt minus2pt}%
  \leftskip12pt\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt\addvspace{12pt minus2pt}%
  \@endparenv}
%

%
\newenvironment{MEX1}{\EXFont%
		\par\addvspace{4pt minus2pt}%
\hbox to \textwidth{\hfil\textasteriskcentered\enspace\textasteriskcentered\enspace\textasteriskcentered\hfil}\vspace*{4pt}\par
  \leftskip1em\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\vskip6pt\leftskip0pt%\addvspace{1pt minus2pt}%
  \@endparenv}
%
%%%%%%%%%%%%%%%%%%%%%% Shade box Item

  %
\newenvironment{shadeextract}{\shadeextractfont%
		\par\addvspace{6pt minus2pt}%
  \leftskip2.5em\rightskip\leftskip
 \noindent\ignorespaces
}{%
		\par\addvspace{6pt minus2pt}%
  \@endparenv}
%


%%%%%%%%%%%%%%%%%%%%%% Vignete %%%%%%%%%%%%
%
\def\VA#1#2{\addvspace{12pt}\raggedleft {\bfseries #1}\rightskip8pt\par{\itshape #2}\rightskip8pt}
%
\newenvironment{VF}{\VfFont%
		\par\addvspace{12pt minus2pt}%
\noindent{\vrule height2pt width\textwidth}\par\vskip2.3pt
  \leftskip8pt\rightskip\leftskip
 \noindent\ignorespaces
}{%
\par\addvspace{-3pt}\leftskip0pt\noindent{{\vrule height2pt width\textwidth}}\par\addvspace{12pt minus2pt}%
  \@endparenv}
%
\def\VTA#1#2{\addvspace{12pt}\raggedleft {\bfseries #1}\rightskip8pt\par{\itshape #2}\rightskip8pt}
%
%
\def\VT{\par\addvspace{3.5pt}\noindent}

\def\VH#1{\par\vspace*{4pt}{\VHfont #1\par}\addvspace{5.5pt}}
%
\newenvironment{VT1}{\VfFont%
		\par\addvspace{12pt minus2pt}%
\noindent{\vrule height2pt width\textwidth}\par
  \leftskip8pt\rightskip\leftskip
%\@afterheading
\parindent12pt
 \noindent\ignorespaces
}{%
\par\addvspace{-3pt}\leftskip0pt\noindent{{\vrule height2pt width\textwidth}}\par\addvspace{10pt minus2pt}%
  \@endparenv}
%


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
  
%%%%\def\contributor#1#2#3{{%
%%%%  \noindent{\ContributorNameFont #1}\par
%%%%  \noindent{\ContributorAffiliationFont #2}\vskip-1\p@
%%%%  \noindent{\ContributorAffiliationFont #3}\vskip10\p@}}
%%%%\def\contributors{%
%%%%  \twocolumn[\contributorshead]
%%%%  \pagestyle{empty}
%%%%  \leftskip1pc
%%%%  \parindent-1pc}
%%%%\def\contributorshead{%
%%%%  \vbox{}\vskip2pc
%%%%  {\centering\HeadFont CONTRIBUTORS\vskip2\p@}
%%%%  \noindent\rule{\textwidth}{1\p@}\vskip25\p@}

\def\MAU#1#2{\par{\raggedleft{{\bfseries #1}\par\hfill\raggedleft\itshape #2}}\par\vspace*{8pt}}

\def\the@environment#1{\thechapter.\if@numberinsequence\arabic{shared}\else\arabic{#1}\fi}
\def\@environment#1#2#3#4#5{%
\@ifnextchar[{\@@environment{#1}{#2}{#3}{#4}{#5}}{\@@environment{#1}{#2}{#3}{#4}{#5}[]}}
\def\@@environment#1#2#3#4#5[#6]{%
\ifnum#2=1\refstepcounter{#1}\fi%
\ifhmode\par\fi%
\addvspace{18\p@}%
\noindent{\vrule height.5pt width\textwidth}
\noindent{#3#1\ifnum#2=1\ \csname the#1\endcsname\fi\def\@t{#6}\ifx\@t\empty\else:\ #6\fi}%
\ifnum#4=1\nopagebreak\vspace*{16pt}\par\noindent\ignorespaces\hskip0pt\else\fi%\hskip10\p@
\bgroup%
#5}
\def\end@environment#1{%
\egroup
  \ifnum#1=1\do@box\par\else\ifhmode\par\fi\fi
  \addvspace{12\p@}}
\def\defenvironment#1{\@ifnextchar[{\def@environment{#1}}{\def@environment{#1}[#1]}}
\def\def@environment#1[#2]#3#4#5#6#7{
  \@namedef{#1}{\@environment{#2}{#3}{#4}{#5}{#6}}
  \@namedef{end#1}{\end@environment{#7}}
  \ifnum#3=1
    \newcounter{#2}[chapter]
    \@namedef{the#2}{\the@environment{#2}}\fi}
\def\do@@box{%
\hfill
  \rule{4\p@}{10\p@}}
\def\eqbox{%
  \rlap{%
\hspace{16\p@}%
    \do@box}\nobox}
\def\dobox{\do@box\nobox}
\def\clearbox{\clear@box\nobox}
\def\clear@box{%
\hfill
  \rule{6\p@}{6\p@}}
%  {\fboxrule.5\p@\raisebox{3\p@}{\framebox[4\p@]{\rule{\z@}{3\p@}}}}}
\let\do@box\clear@box
\def\nobox{\gdef\do@box{\global\let\do@box\clear@box}}

%%\defenvironment{algorithm}[ALGORITHM]{1}{\PTLCHeadFont}{1}{\PTLCBodyFont}{0}
%%\defenvironment{application}[APPLICATION]{1}{\PTLCHeadFont}{1}{\PTLCBodyFont}{0}
%%\defenvironment{case}[CASE]{1}{\PTLCHeadFont}{1}{\PTLCBodyFont}{0}
%%\defenvironment{claim}[CLAIM]{1}{\PTLCHeadFont}{1}{\PTLCBodyFont}{0}
%%\defenvironment{corollary}[COROLLARY]{1}{\PTLCHeadFont}{1}{\PTLCBodyFont}{0}
%%\defenvironment{definition}[DEFINITION]{1}{\QDHeadFont}{0}{\QDBodyFont}{0}
%%\defenvironment{formula}[FORMULA]{1}{\PTLCHeadFont}{1}{\PTLCBodyFont}{0}
\defenvironment{lemma}[Lemma]{1}{\PTLCHeadFont}{1}{\PTLCBodyFont}{1}
%%\defenvironment{proof}[PROOF]{0}{\PRHeadFont}{0}{\PRBodyFont}{1}
%%\defenvironment{proposition}[PROPOSITION]{1}{\PTLCHeadFont}{1}{\PTLCBodyFont}{0}
%%\defenvironment{question}[QUESTION]{1}{\QDHeadFont}{0}{\QDBodyFont}{0}
%%\defenvironment{remark}[REMARK]{1}{\PRHeadFont}{0}{\PRBodyFont}{1}
%%\defenvironment{solution}[SOLUTION]{0}{\PRHeadFont}{0}{\PRBodyFont}{1}
%%\defenvironment{test}[TEST]{1}{\PTLCHeadFont}{1}{\PTLCBodyFont}{0}
\defenvironment{theorem}[Theorem]{1}{\PTLCHeadFont}{1}{\PTLCBodyFont}{1}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
\newenvironment{mathstyle}{%
		\par\addvspace{12pt minus2pt}%
%  \leftskip1em\rightskip\leftskip
%\@afterheading
\parindent12pt
\noindent{\vrule height.5pt width\textwidth}\par\nopagebreak\noindent\ignorespaces
}{\hfill\clearbox%
\par\addvspace{-3pt}\leftskip0pt\addvspace{10pt minus2pt}%
  \@endparenv}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\dedicationHfont{\fontsize{21}{21}\sffamily\itshape\selectfont}
\def\dedicationfont{\reset@font\fontsize{12}{15}\itshape\selectfont}

\def\dedication#1{\thispagestyle{empty}\par\vspace*{9pc}\hfil{\dedicationHfont Dedication}\hfil\par\vspace*{9pt}
\hfil {\vrule height.5pt width 7pc}\hfil\par\vspace*{16pt}
\vbox{\centering\dedicationfont #1}}  
  
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

\HeadingsBookChapter
%\HeadingsChapterSection
\endinput
%%
%% End of file `book.cls'.
