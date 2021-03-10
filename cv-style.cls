% -- Encoding UTF-8 without BOM

\ProvidesClass{cv-style}[2015/02/27 CV class]
\NeedsTeXFormat{LaTeX2e}
\usepackage{chessfss}
\setboardfontsize{10pt}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%----------------------------------------------------------------------------------------
% Colors %
%----------------------------------------------------------------------------------------

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{blue}{HTML}{4169e1}
\definecolor{red}{HTML}{FA2772}
\definecolor{orange}{HTML}{e77500}
\definecolor{green}{HTML}{2E8B57}
\definecolor{purple}{HTML}{9358FE}
\definecolor{aquamarine}{HTML}{008080}
\definecolor{darkeraqua}{HTML}{4B9985}

\definecolor{date}{HTML}{A4A4A4}

\ifdefined\@cv@print
  \colorlet{blue}{gray}
  \colorlet{red}{gray}
  \colorlet{orange}{gray}
  \colorlet{green}{gray}
  \colorlet{purple}{gray}
  \colorlet{aquamarine}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%\usepackage[colorlinks = true,
%            linkcolor = red,
%            urlcolor  = red,
%            citecolor = red,
%            anchorcolor = red]{hyperref}
\usepackage{hyperref}
\usepackage{xspace}
\hypersetup{colorlinks=true, linkcolor=red, urlcolor=red}

%-----------------------------------------------------------------------
% Fonts %
%----------------------------------------------------------



%----------------------------------------------------------------------------------------
% Header %
%----------------------------------------------------------------------------------------

\RequirePackage{tikz}

\newcommand{\header}[2]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      {\Huge \sffamily \textcolor{white}{{#1}{#2}}}
    };
  \end{tikzpicture}
  \vspace{1cm}
  \vspace{-2\parskip}
}

%----------------------------------------------------------------------------------------
%	Last updated command %
%----------------------------------------------------------------------------------------

\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{polyglossia}

\newcommand{\sethyphenation}[3][]{%
  \sbox0{\begin{otherlanguage}[#1]{#2}
    \hyphenation{#3}\end{otherlanguage}}}
%\sethyphenation[<options>]{<language>}{<list of words separated by spaces>}

\ifdefined\@cv@espanol
  \setdefaultlanguage{spanish}
  \def\lastupdatedtext{Última Actualización el}
\else
  \setdefaultlanguage[variant=british]{english}
  \def\lastupdatedtext{Last Updated on}
\fi

\setlength{\TPHorizModule}{0.01\paperwidth}
\setlength{\TPVertModule}{0.01\paperwidth}

\newcommand{\lastupdated}{
  \begin{textblock}{10}(11.3, 0.05)
    \raggedleft
    \fontsize{8pt}{10pt}\color{date}
    \lastupdatedtext{} \today
  \end{textblock}}

%----------------------------------------------------------------------------------------
% Structure %
%----------------------------------------------------------------------------------------
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        red\or%
        orange\or%
        aquamarine\or%
        purple\or%
        green\or%
        green\or%
        red\or%
        blue\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  {\par\vspace{\parskip}
  {%
    \sffamily \textbf{\LARGE\color{headercolor}%
    \@sectioncolor #1}%
  }
  \par\vspace{\parskip}}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\newcommand{\jobtitle}[1]{%
    {\color{gray} \textit{#1}}%
}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
% List environment %
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

% \renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    #2%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}

\newcommand{\simpleentryheader}[2]{%
#1 & \parbox[t]{11.8cm}{%
  \textbf{#2}
}\\
}
%\newcommand{\simpleentryheader}[2]{%
 % \relscale{1.000}\textbf{#1} &\parbox[t]{11.8cm}{%
  %  \textbf{\relscale{1.000}#2} %
 % }\\}


\newcommand{\simpleentry}[2]{%
   \textcolor{gray}{ #1} &
  \parbox[t]{11.8cm}{\textcolor{gray}{#2}}\\
}

\newcommand{\coloredhref}[3]{%
{\hypersetup{linkcolor=#1, urlcolor=#1}\href{#2}{#3}}\xspace
}

\newcommand{\tgray}[1]{%
{\small\textcolor{gray}{#1}}
}
%----------------------------------------------------------------------------------------
% Side block %
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1, 1.87)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%----------------------------------------------------------------------------------------
% Other tweaks %
%----------------------------------------------------------------------------------------

\RequirePackage[left=5.6cm,top=1cm,right=1cm,bottom=1cm,nohead,nofoot]{geometry}
%\RequirePackage{hyperref}
%\hypersetup{
%    pdftitle=CV/Resume \textbar{} Alejandro Pérez Londoño,
%    pdfauthor=Alejandro Pérez Londoño,
%    pdfsubject=CV/Resume%
%    }
