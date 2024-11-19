%
% hi-letter.cls -- a document class for writing letters with UoI letterhead
%
% Copyright 2024, Helga Ingimundardóttir (helgaingim@hi.is)
%
% Purpose:
% This class provides a professional letter format using the University of Iceland's (UoI) standard letterhead.
%
% Requirements:
% - The UoI logo file (hi-logo.eps) must be provided for the header.
% - Required LaTeX packages: epsfig, graphicx, ifthen, xcolor, fancyhdr.
% - For example usage, refer to hi-letter_example.tex.
%
% Contact:
% For issues or suggestions, contact helgaingim@hi.is
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hi-letter}
\RequirePackage{graphicx} % For image handling
\RequirePackage{epstopdf} % EPS to PDF conversion
\RequirePackage{epsfig} % Legacy support for EPS figures
\RequirePackage{ifthen} % Logical conditionals
\RequirePackage{xcolor} % Color management
\RequirePackage{fancyhdr} % Header management
\DeclareGraphicsExtensions{.eps}

% Pass unknown options to the parent letter class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass[a4paper]{letter} % Use A4 paper as default size

% Subject customization
\newcommand{\subjectname}{Subject}
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{\subjectname: #1}}

% Check if the UoI logo exists
\newboolean{logofound}
\IfFileExists{hi-logo.eps}
    {\setboolean{logofound}{true}}
    {\setboolean{logofound}{false}}

% Adjust page dimensions for A4
\setlength{\textwidth}{6.5in}       % Maximum usable text width
\setlength{\textheight}{9.5in}      % Maximum usable text height for A4
\setlength{\topskip}{0.0in}         % Space above the first line of text
\setlength{\footskip}{0.5in}        % Distance between text and footer
\setlength{\oddsidemargin}{-0.25in} % Left margin for odd pages
\setlength{\evensidemargin}{-0.25in} % Left margin for even pages
\setlength{\topmargin}{-1.0in}      % Top margin adjustment for A4

% Fonts for the letter
\DeclareFixedFont{\xcmrbn}{OT1}{cmr}{b}{n}{10} % Bold Roman, 10pt
\DeclareFixedFont{\xcmrmn}{OT1}{cmr}{m}{n}{10} % Regular Roman, 10pt
\DeclareFixedFont{\ixcmrmn}{OT1}{cmr}{m}{n}{9} % Regular Roman, 9pt

% Define UoI's blue color
\definecolor{hi-blue}{HTML}{10099F}

% Define the page style using fancyhdr
\fancypagestyle{firstpage}{
    % Clear default header/footer
    \fancyhf{}
    % Disable the horizontal line below the header
    \renewcommand{\headrulewidth}{0pt}
    % Left-aligned logo in the header
    \fancyhead[L]{%        
        \ifthenelse{\boolean{logofound}}
           {\includegraphics[height=40pt, keepaspectratio]{hi-logo.eps}}
           {\ClassWarning{hi-letter}{hi-logo.eps COULD NOT BE FOUND!}}
    }
    % Right-aligned contact information in the header
    \fancyhead[R]{%        
        {\sffamily \textcolor{hi-blue}{
        Saemundargata 2, 102 Reykjavik Iceland \\ 
        Tel. +354 525 4000 -- hi@hi.is -- hi.is}\\
        \hfill}
    }
    % Adjust header height to ensure enough space
    \setlength{\headheight}{60pt}
    \setlength{\headsep}{15pt} % Space between header and body
}


% Ensure custom header style is applied
\pagestyle{firstpage} % Subsequent pages

% Initialize placeholders for sender and recipient info
\newcommand{\frominfo}[1]{%
    \def\frominfocontent{\parbox[t]{\textwidth}{\raggedleft{\sffamily \textcolor{hi-blue}{#1}}}}}
\newcommand{\frominfocontent}{} % Empty sender's info

\newcommand{\toinfo}[1]{%
    \def\toinfocontent{\parbox[t]{\textwidth}{\raggedright{\sffamily \textcolor{hi-blue}{#1}}}}}
\newcommand{\toinfocontent}{} % Empty recipient's info

% Redefine \cc (carbon copy)
\renewcommand{\cc}[1]{%
    \par\vspace{1\parskip}%
    {\raggedright\sffamily\textcolor{hi-blue}{cc: #1}}\par
}

% Redefine \encl (enclosures)
\renewcommand{\encl}[1]{%
    \par\vspace{1\parskip}%
    {\raggedright\sffamily\textcolor{hi-blue}{encl: #1}}\par
}

% Define \bcc (blind carbon copy)
\newcommand{\bcc}[1]{%
    \par\vspace{1\parskip}%
    {\raggedright\sffamily\textcolor{hi-blue}{bcc: #1}}\par
}

% Initialize refline and deadline as empty
\newcommand{\refcontent}{}
\newcommand{\deadlinecontent}{}

% Command to set the reference line
\newcommand{\refline}[1]{\renewcommand{\refcontent}{#1}}

% Command to set the deadline
\newcommand{\deadline}[1]{\renewcommand{\deadlinecontent}{#1}}

% Update the opening command to include refline and deadline if set
\renewcommand{\opening}[1]{\thispagestyle{firstpage}%
    % Sender's info (right-aligned)
    {\frominfocontent \par}    
    % Recipient's info (left-aligned)
    {\toinfocontent \par}    
    % Date (right-aligned)    
    {\raggedleft \@date \par}    
    % Subject line
    \ifthenelse{\equal{\@subject}{}}{}{\@subject\par}
    % Reference line, if provided    
    \ifthenelse{\equal{\refcontent}{}}{}{Ref: \refcontent\par}
    % Deadline, if provided
    \ifthenelse{\equal{\deadlinecontent}{}}{}{Please respond by: \deadlinecontent\par}    
    \vspace{\parskip}%
    % Letter opening text
    #1\par\nobreak
}


% Centered closing
\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
    \stopbreaks
    \noindent
    \begin{center}
        \ignorespaces #1\\[4\medskipamount]%
        \ifx\@empty\fromsig
            \fromname
        \else
            \fromsig
        \fi\strut
    \end{center}%
    \par
}