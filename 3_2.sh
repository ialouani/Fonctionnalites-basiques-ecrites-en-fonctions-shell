#!/bin/bash

CMD=$( basename $0 )

usage(){
    echo "Usage:$CMD..=>pas de fichier en argument (A PASSER!!)."
}

nbr_min_parameters=1
if [ "$#" -lt "$nbr_min_parameters" ];then
    usage
    exit 1
fi

echo "
\documentclass[a4paper, draft]{article}

\usepackage[utf8]{inputenc}
\usepackage[french]{babel} 

% Figures
\usepackage{graphicx}
\graphicspath{{./img/}}

% Math
\usepackage{amsmath, amssymb}
\newtheorem{defi}{Définition}

% Algortihmes
\usepackage[vlined,lined,linesnumbered,boxed,french]{algorithm2e}
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator{\myfunc}{myfunc}
\DeclareMathOperator*{\sign}{sign}
\DeclareMathOperator*{\imwh}{width}
\DeclareMathOperator*{\imht}{height}

% Extra
\usepackage[left=3cm,right=3cm,top=2cm,bottom=2cm]{geometry}
\usepackage{url}

\begin{document}

a(test pour la compilation)

\end{document}" >> $1.tex
