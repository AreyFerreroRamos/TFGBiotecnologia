#!/bin/bash

# Author: Arey Ferrero Ramos.
# Date: June 11, 2023. Version: 1.
# Description: This script runs the command that executes the section of the project that performs the nestedness assessment using pypy3 rather than/instead of python3.
#	Input:
#		-The type of abundance matrix.
#	Output:
#		-The value of nestedness of the abundance matrix.
#		-The p-value of the nestedness value of the abundance matrix.

if [ ! -d input_files ]
then
	echo -e "Error: The directory input_files that contains the input data for the project doesn't exist." >&2
	exit 2
fi

if [ ! -f input_files/count_Genus_all.tsv ]
then
	echo -e "Error: The file count_Genus_all.tsv, that contains the diversity of the individuals of all the vertebrate species in the study, doesn't exist." >&2
	exit 3
fi

if [ ! -f input_files/metadata.csv ]
then
	echo -e "Error: The file metadata.csv, that contains the metadata of all the samples in the study, doesn't exist." >&2
	exit 4
fi

if [ ! -f input_files/sp_code.txt ]
then
	echo -e "Error: The file sp_code.txt, that contains a list of the scientific name that corresponds to the code that identifies a vertebrate species, doesn't exist" >&2
	exit 5
fi

pypy3 nestedness_assessment.py input_files/count_Genus_all.tsv input_files/metadata.csv input_files/sp_code.txt "$1"

exit 0
