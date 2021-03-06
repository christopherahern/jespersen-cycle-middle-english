#!/bin/bash

# 0) check that data directory exists
if [[ ! -e data ]] ; then mkdir data ; fi

# 1) output parsed corpus files to current directory
cat corpus/corpus/psd/*.psd > queries/ppcme2.out 
cd queries

# 2) Edit this command to point to CorpusSearch on your machine
CS_COMMAND="java -classpath ./CS_2.003.04.jar csearch/CorpusSearch"

# 3) Run revision queries to deal with how the corpus was constructed
$CS_COMMAND revision.q ppcme2.out
$CS_COMMAND revision2.q ppcme2.out.out
$CS_COMMAND revision3.q ppcme2.out.out.out

mv ppcme2.out.out.out.out all-revisions.out

#  Filter query
$CS_COMMAND filter.q all-revisions.out

# 4) Run query to insert coding for the contexts
$CS_COMMAND coding.c filter.out

# 5) Extract just the coding to a data file
$CS_COMMAND only_coding.q coding.cod

# 6) Process the output of corpus search
sed -i -e "s/@/:/" coding.cod.ooo # Replace @ with :
Rscript data.R # parse corpus search output and output to neg-data.csv 

# 7) Clean up the repository by removing intermediate files
./clean.sh
