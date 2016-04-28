# Description

This repository contains the source code to generate data from Jespersen's
Cycle in Middle English using the second edition of the
 [Penn Parsed Corpus of Middle English (PPCME2)](https://www.ling.upenn.edu/hist-corpora/).

The query and codes included are based on [work](https://github.com/christopherahern/digs15-negative-priming.git)
done by [Aaron Ecay](http://aaronecay.com/) and [Meredith Tamminga](http://meredithtamminga.com/). I'd like to thank them
for sharing their time and expertise in understanding the queries and code. Note that the results generated
here are [distinct](https://github.com/christopherahern/digs15-negative-priming/issues/1). 


# Instructions

## Data

Starting in the 12th century we see a change in how sentential negation is expressed. We initially observe
purely pre-verbal negation.

> Ic ne secge

This is followed by a period of bipartite negation where we observe both pre- and post-verbal negative markers.

> I ne seye not

Finally, we observe purely post-verbal negation. 

> I say not
 
This change is often referred to as Jespersen's Cycle, following Dahl (1979), due to Jespersen's (1917)
observation that:

> The history of negative expressions in various languages makes us witness the following curious fluctuation: the original negative adverb is first weakened, then found insufficient and therefore strengthened, generally through some additional word, and this in its turn may be felt as the negative proper and may then in course of time be subject to the same developments as the original word
 

## Code

To run the code either download the files as a [ZIP](https://github.com/christopherahern/jespersens-cycle-middle-english/archive/master.zip),
 or clone the repository:

    git clone https://github.com/christopherahern/jespersens-cycle-middle-english.git

Change directories to the cloned repository and create a symbolic link to your copy of your local copy of the [PPCME2](https://www.ling.upenn.edu/hist-corpora/PPCME2-RELEASE-4/index.html):

    ln -s <location of PPCME2> corpus 

Now run the make script to output the data to `data/neg-data.csv`:

    ./make.sh


As a point of reference, `make.sh` takes less than two minutes to run on a laptop:

    time ./make.sh

    real	1m24.266s
    user	1m48.135s
    sys	0m2.013s

## Output

The data will be output to `data/neg-data.csv` with the following columns:

* exclude : tokens we might want to exclude for various reasons
* ne : whether *ne* appears and whether it is contracted  
* not : whether *not* appears and whether it is before or after the verb
* clausetype : details about whether the token appears in a matrix or relative clause
* never.posn : whether *never* appears and whether it is before or after the verb 
* finite : whether or not the clause is finite 
* id : unique id of the sentence containing the token
* year : year of the document containing the token
* document : name of the document containing the token
* stage : (1) ne..., (2) ne...not, (3) ...not

Note that these are all defined by the queries in `coding.c` and the script `data.R`.

# Citation

If you use this repository to generate data, please cite it. More importantly, if you use data generated
from the parsed corpus please cite [the corpus](https://www.ling.upenn.edu/hist-corpora/citing-corpora.html):

> Kroch, Anthony, and Ann Taylor. 2000. The Penn-Helsinki Parsed Corpus of Middle English (PPCME2). Department of Linguistics, University of Pennsylvania. CD-ROM, second edition, release 4. 

It takes a lot of time and effort to build and annotate historical corpora well, so it's important to acknowledge that hard work. 

# Comments

If you have comments or questions about anything, feel free to email christopher.ahern@gmail.com 
or [create an issue](https://github.com/christopherahern/jespersens-cycle-middle-english/issues)
