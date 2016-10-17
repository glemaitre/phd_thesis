
%---------------------------------------------------------------
% PhDthesis version 2 style file by Jakob Suckale, 2007
% based on CUEDthesis version 1 by Harish Bhanderi 2002
%---------------------------------------------------------------



%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Latex/Classes/PhDthesisPSnPDF}[2007/09/06 v2 PhD thesis class]


%:-------------------------- report or book -----------------------

%If you want to use a Report style document then uncomment the following 3 lines and comment the below 8 book style lines:
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%\ProcessOptions\relax
%%\LoadClass[a4paper]{report}
%\ifx\pdfoutput\undefined
%   \LoadClass[dvips, a4paper]{report}
%\else
%   \LoadClass[pdftex, a4paper]{report}
%\fi

%%Bibliography
%%uncomment next line to change bibliography name to references for Report document class
%\renewcommand{\refname}{References}

%If you want to use a Book style document then uncomment the following 3 lines and comment the above 8 report style lines:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips, a4paper]{book}
\else
   \LoadClass[pdftex, a4paper]{book}
\fi


%:-------------------------- packages for fancy things -----------------------

\usepackage{latexsym,amssymb}
\usepackage{epsf,graphicx}
\usepackage{epstopdf}
\usepackage{subfigure}
\usepackage{pdflscape} % in order to have the option to put some pages in landscape
%\usepackage{wrapfig} % to include figure with text wrapping around it
\usepackage[margin=10pt,font=small,labelfont=bf]{caption} % for improved layout of figure captions with extra margin, smaller font than text
\usepackage{fancyhdr} % for better header layout
\usepackage{eucal}
\usepackage[english]{babel}
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}
\usepackage[sort, numbers]{natbib}
\usepackage{ifthen}
\usepackage{multicol,multirow} % for pages with multiple text columns, e.g. References
\setlength{\columnsep}{20pt} % space between columns; default 10pt quite narrow
\usepackage[nottoc]{tocbibind} % correct page numbers for bib in TOC, nottoc suppresses an entry for TOC itself
%\usepackage{nextpage}
\usepackage{fixfoot}
\usepackage{color, colortbl} %This is a color package to color table for instance
\usepackage{array}
\usepackage{longtable}

% Define some nice color
\definecolor{DarkBlue}{rgb}{0.5,0.6,0.9}
\definecolor{LightBlue1}{rgb}{0.85,0.85,0.9}
\definecolor{LightBlue2}{rgb}{0.95,0.95,0.9}
\definecolor{Red}{rgb}{1,0,0}




%:-------------------------- Glossary/Abbrev./Symbols -----------------------

\usepackage[intoc]{nomencl} % load nomencl extension; include in TOC
%\nomrefpage % to include page numbers after abbrevations
\renewcommand{\nomname}{Glossary} % rename nomenclature
\renewcommand{\nomlabel}[1]{\textbf{#1}} % make abbreviations bold
\makenomenclature % used to be \makeglossary
\DeclareFixedFootnote{\g}{For all abbreviations see the glossary on page \pageref{nom}.}
%\newcommand{\g}{\footnote{For all abbreviations see the glossary on page \pageref{nom}.}} % type "\g" to refer to glossary

% used to be for sorting into categories:
%\renewcommand\nomgroup[1]{%
%  \ifthenelse{\equal{#1}{A}}{%
%   \item[\textbf{Roman Symbols}] }{%             A - Roman
%    \ifthenelse{\equal{#1}{G}}{%
%     \item[\textbf{Greek Symbols}]}{%             G - Greek
%      \ifthenelse{\equal{#1}{R}}{%
%        \item[\textbf{Superscripts}]}{%              R - Superscripts
%          \ifthenelse{\equal{#1}{S}}{%
%           \item[\textbf{Subscripts}]}{{%             S - Subscripts
%	    \ifthenelse{\equal{#1}{X}}{%
%	     \item[\textbf{Other Symbols}]}{{%    X - Other Symbols
%	    \ifthenelse{\equal{#1}{Z}}{%
%	     \item[\textbf{Acronyms}]}%              Z - Acronyms
%              			{{}}}}}}}}}}


%:-------------------------- PDF/PS setup -----------------------

%if you use a macTeX 2008 or later, use the ifpdf package
\usepackage{ifpdf} 

%if you use an older version, uncomment these lines:
%\newif \ifpdf
%    \ifx \pdfoutput \undefined
        % for running latex
%        \pdffalse
%    \else
        % for running pdflatex
%        \pdfoutput = 1    % positive value for a PDF output
                          % otherwise a DVI
%        \pdftrue
%\fi

\ifpdf
%-->
%--> Google.com search "hyperref options"
%--> 
%--> http://www.ai.mit.edu/lab/sysadmin/latex/documentation/latex/hyperref/manual.pdf
%--> http://www.chemie.unibas.ch/~vogtp/LaTeX2PDFLaTeX.pdf 
%--> http://www.uni-giessen.de/partosch/eurotex99/ oberdiek/print/sli4a4col.pdf
%--> http://me.in-berlin.de/~miwie/tex-refs/html/latex-packages.html
%-->
    \usepackage[ pdftex, plainpages = false, pdfpagelabels, 
                 pdfpagelayout = useoutlines,
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = false,  % was true
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref} 

    \DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf, .gif} %GIF doesn't work??
%    \usepackage[pdftex]{graphicx}
%    \pdfcompresslevel=9
    \graphicspath{{0_frontmatter/figures/PNG/}{0_frontmatter/figures/PDF/}{0_frontmatter/figures/}}
\else
    \usepackage[ dvips, 
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}

    \DeclareGraphicsExtensions{.eps, .ps}
    \usepackage{epsfig}
    \usepackage{graphicx}
    \graphicspath{{0_frontmatter/figures/EPS/}{0_frontmatter/figures/}}
\fi


%:-------------------------- page layout -----------------------

%A4 settings
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm}
   \setlength{\paperwidth}{210mm}
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

%: Uncomment this secion for two-sided printing
% ------------------------------
\setlength{\oddsidemargin}{1.5cm}
\setlength{\evensidemargin}{0cm}
\setlength{\topmargin}{1mm}
\setlength{\headheight}{1.36cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{20.84cm}
\setlength{\textwidth}{14.5cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{3cm}
\setlength{\footskip}{2.36cm}


%: Uncomment this secion for one-sided printing
% taken from the original file, but with the first two lanes modified
% ------------------------------
%\setlength{\evensidemargin}{1.9cm} % was 1.96cm in original
%\setlength{\oddsidemargin}{-0.001cm} % was -0.54cm in original file
%\setlength{\topmargin}{1mm}
%\setlength{\headheight}{1.36cm}
%\setlength{\headsep}{1.00cm}
%\setlength{\textheight}{20.84cm}
%\setlength{\textwidth}{14.5cm}
%\setlength{\marginparsep}{1mm}
%\setlength{\marginparwidth}{3cm}
%\setlength{\footskip}{2.36cm}


%: section below defines fancy page layout options
% ------------------------------
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyhead[RO]{\bfseries\rightmark}
\fancyhead[LE]{\bfseries\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}





%:-------------------------- title page layout -----------------------

% starts roman page numbering until chapter 1
% important to avoid two pages numbered 1 and 2 which may cause bad links
% bug: cover i + back side ii and then numbering restarts with i; should be iii
\renewcommand{\thepage}{\roman{page}}

\newcommand{\submittedtext}{{A thesis submitted for the degree of}}

% DECLARATIONS
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
%%%%%%%%%% Change for co-joint doctorate
% First laboratory
\def\firstlab#1{\gdef\@firstlab{#1}}
% Defining the logo
\def\firstlogolab#1{\gdef\@firstlogolab{#1}}
% First university
\def\firstuni#1{\gdef\@firstuni{#1}}
% Defining the logo
\def\firstlogouni#1{\gdef\@firstlogouni{#1}}
% Second laboratory
\def\secondlab#1{\gdef\@secondlab{#1}}
% Defining the logo
\def\secondlogolab#1{\gdef\@secondlogolab{#1}}
% Second university
\def\seconduni#1{\gdef\@seconduni{#1}}
% Defining the logo
\def\secondlogouni#1{\gdef\@secondlogouni{#1}}
% Supervisors
\def\supervisora#1{\gdef\@supervisora{#1}}
\def\supervisorb#1{\gdef\@supervisorb{#1}}
\def\supervisorc#1{\gdef\@supervisorc{#1}}
\def\supervisord#1{\gdef\@supervisord{#1}}
%%%%%%%%%% End changes
% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
%\def\collegeordept#1{\gdef\@collegeordept{#1}}
% The name of your University
%\def\university#1{\gdef\@university{#1}}
% Defining the crest
%\def\crest#1{\gdef\@crest{#1}}
% Stating the city of birth for title page where needed; uncommented for use
%\def\cityofbirth#1{\gdef\@cityofbirth{#1}}

% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
  \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

%define title page layout
\renewcommand{\maketitle}{%
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
%  \null\vfill
  \begin{center}
{\large
  {{\@firstlogouni}\hspace*{30mm}{\@secondlogouni} \par \vspace*{25mm}}}
    { \Large {\bfseries {Doctoral Thesis}} \par \vspace*{10mm}}
    { \Large {\bfseries {\@title}} \par \vspace*{65mm}}
    {{\large \@author} \par \vspace*{25mm}}
%	\vspace*{1ex}
%	{{\@cityofbirth} \par}    
{\large 
    {\small \@degreedate \par}
\newpage
\thispagestyle{empty}	
}%end large
  \end{center}
  \null\vfill

\end{alwayssingle}

\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
%  \null\vfill
  \begin{center}
{\large
  {{\@firstlogouni}\hspace*{30mm}{\@secondlogouni} \par \vspace*{25mm}}}
    { \Large {\bfseries {Doctoral Thesis}} \par \vspace*{10mm}}
    { \Large {\bfseries {\@title}} \par \vspace*{15mm}}
    {{\large \@author} \par}
%	\vspace*{1ex}
%	{{\@cityofbirth} \par}    
{\large 
    %     \vspace*{1ex}
    % {{\@firstlab}{ - }{\@secondlab} \par}
    %     \vspace*{1ex}
    % {{\@firstuni}{ - }{\@seconduni} \par}
	\vspace*{34mm}
    {\small \textbf{Supervised by: } \par \@supervisora, \@supervisorb \par \@supervisorc, \@supervisord \par}
	\vspace*{5mm}
    % {\small {\submittedtext} \par}
    %     \vspace*{0.5ex}
    % {\small \it {\@degree} \par}
    %     \vspace*{0.5ex}
    {\small \@degreedate \par}
        \vspace*{10mm}
    {\small Doctoratal Programme in Technology \par}
        \vspace*{5mm}
    {\scriptsize Work submitted to the Universitat de Girona and Universit\'e de Bourgogne Franche-Comt\'e in partial fulfillment of the requirements for the degree of Doctor of Philosophy}
\newpage
}%end large
  \end{center}
  \null\vfill
\end{alwayssingle}
}

% page number for cover back side should have page number blanked


%:-------------------------- front matter layout -----------------------

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{empty}
  \begin{flushright}
  \vspace*{1.5cm}
  {\LARGE }
  \end{flushright}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}


% Publication
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{publication}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Publications}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}\begin{quote}}
{\end{quote}\end{alwayssingle}}

%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstracts} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}


\newenvironment{abstractCatalan} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Resum}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{abstractSpanish} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Resumen}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{abstractFrench} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  R\'esum\'e}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractslong} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm} \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

%Statement of originality if required

\newenvironment{declaration} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Declaration}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}


%:-------------------------- page numbers: roman+arabic -----------------------

% ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

%\newenvironment{romanpages}
%{
%	\setcounter{page}{1}
%	\renewcommand{\thepage}{\roman{page}}
%} % close romanpage env't
 
{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

