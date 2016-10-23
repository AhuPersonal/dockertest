# Lab 3 - Data analysis pipeline automation

#### Goal

In this lab you will get to practice writing a data analysis pipeline consisting
of multiple scripts. You will also get practice automating this pipeline and
making it reproducible using a Shell script, as well as the build tool, Make.

#### Submission Instructions:
<!-- rubric={mechanics:2} -->

<span id="rubric">
		<font size=5><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/num_2.png?raw=true"/ alt="2"></font>
		<font size=5><a href="https://github.com/UBC-MDS/public/blob/master/rubric/rubric_mech.md"><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/mech.png?raw=true" alt="[Mechanics]" " width=32/></a></font>

</span>
<!-- end of rubric snippet -->

- You should have a well organized lab repo/directory structure, where:
  - all code files (`.R`, `.py`, `.Rmd`, `.ipynb`) live in the `src` directory,
  except for the driver scripts (Shell script and Makefile which call your
  analysis scripts).
  - all rendered documents live in the `results` directory
  - all data used belong in the `data` directory
  - answers to written questions (*e.g.,* Exercise 4) should be in a `.md` file in the `doc` directory
- In the main `README.md` file in the lab/assignment repo, you must make it clear where all files are for all assignments, as well as explain anything the we need to know to understand your homework submission.
- In the main `README.md` file you should also explain how to run your data
analysis pipeline. This should be done twice, once for the shell script, and once
for the Makefile.

*note - feel free to re-use R code from previous assignments in this class or others*

## Exercise 1 - Writing an analysis that uses multiple R scripts
<!-- rubric={code:2,mechanics:2} -->

<span id="rubric">
		<font size=5><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/num_2.png?raw=true"/ alt="2"></font>
		<font size=5><a href="https://github.com/UBC-MDS/public/blob/master/rubric/rubric_code.md"><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/code.png?raw=true" alt="[Code]" " width=32/></a></font>
&nbsp;		<font size=5><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/num_2.png?raw=true"/ alt="2"></font>
		<font size=5><a href="https://github.com/UBC-MDS/public/blob/master/rubric/rubric_mech.md"><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/mech.png?raw=true" alt="[Mechanics]" " width=32/></a></font>

</span>
<!-- end of rubric snippet -->

#### Big picture
- Write the following four files (3 R scripts and an R Markdown file) to carry out a small data analysis.
- The output of the first script must be the input of the second, and so on.
- Something like this:
    1. First script that downloads some data and save it locally. This should take
    two arguments:
      - a URL pointing to the data
      - a path/filename where to write the file to and what to call it (*e.g.,* `data/data.csv`)
    2. Second script that reads the data from the first script, performs some analysis (*e.g.,* creates a summary table) and writes these numerical data to file in CSV or TSV format. This should take two arguments:
      - a path/filename pointing to the data
      - a path/filename where to write the file to and what to call it (*e.g.,* `results/summarized_data.csv`)
    3. Third script that reads the output of the second script, generate some figures and save them to files. This should take two arguments:
      - a path/filename pointing to the data
      - a path/filename prefix where to write the figure to and what to call it (*e.g.,* `results/this_analysis`)
    4. Fourth script: an `.Rmd`, actually, that presents original data, the statistical summaries, and/or the figures in a little report.

*note - make your figure names MORE descriptive than the examples I provide above, and
don't forget to adequately comment and document your scripts.*

## Exercise 2 - Automating the data-analysis pipeline using a Shell script
<!-- rubric={code:2,mechanics:2} -->

<span id="rubric">
		<font size=5><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/num_2.png?raw=true"/ alt="2"></font>
		<font size=5><a href="https://github.com/UBC-MDS/public/blob/master/rubric/rubric_code.md"><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/code.png?raw=true" alt="[Code]" " width=32/></a></font>
&nbsp;		<font size=5><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/num_2.png?raw=true"/ alt="2"></font>
		<font size=5><a href="https://github.com/UBC-MDS/public/blob/master/rubric/rubric_mech.md"><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/mech.png?raw=true" alt="[Mechanics]" " width=32/></a></font>

</span>
<!-- end of rubric snippet -->

Write a fifth script (a Shell script) to act as a driver script to rule them all,
*i.e.* to run the others in sequence, hard coding in the appropriate arguments.
This script should:
  - live in the project's root directory
  - have a name that makes it obvious it is the driver script (*i.e.,* `run_all.sh`)
  - be well documented (explaining what it does and how to use it)

## Exercise 3a - Automating the data-analysis pipeline using Make
<!-- rubric={code:2,mechanics:2} -->

<span id="rubric">
		<font size=5><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/num_2.png?raw=true"/ alt="2"></font>
		<font size=5><a href="https://github.com/UBC-MDS/public/blob/master/rubric/rubric_code.md"><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/code.png?raw=true" alt="[Code]" " width=32/></a></font>
&nbsp;		<font size=5><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/num_2.png?raw=true"/ alt="2"></font>
		<font size=5><a href="https://github.com/UBC-MDS/public/blob/master/rubric/rubric_mech.md"><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/mech.png?raw=true" alt="[Mechanics]" " width=32/></a></font>

</span>
<!-- end of rubric snippet -->

Write a sixth script, a Makefile, to act as a driver script to rule them all,
*i.e.* to run the others in sequence, hard coding in the appropriate arguments.
This script should:
  - live in the project's root directory and be named `Makefile`
  - be well documented (explaining what it does and how to use it)
  - have a `clean:` target so that you can easily "undo" your analysis through
  running `make clean` at the command line

## Exercise 3b - Dependency diagram of the Makefile (optional)
<!-- rubric={mechanics:1} -->

<span id="rubric">
		<font size=5><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/num_1.png?raw=true"/ alt="1"></font>
		<font size=5><a href="https://github.com/UBC-MDS/public/blob/master/rubric/rubric_mech.md"><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/mech.png?raw=true" alt="[Mechanics]" " width=32/></a></font>

</span>
<!-- end of rubric snippet -->

Create a dependency diagram of the Makefile using [`makefile2graph`](https://github.com/lindenb/makefile2graph) and include the
image in the `README.md` file in the root of your project. *Make sure to clearly
label what this image is.*

## Exercise 4 - Reflection
<!-- rubric={reasoning:2} -->

<span id="rubric">
		<font size=5><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/num_2.png?raw=true"/ alt="2"></font>
		<font size=5><a href="https://github.com/UBC-MDS/public/blob/master/rubric/rubric_reasoning.md"><img src="https://github.com/UBC-MDS/public/blob/master/rubric/icon/reasoning.png?raw=true" alt="[Reasoning]" " width=32/></a></font>

</span>
<!-- end of rubric snippet -->

Discuss the consequences of using a shell script to automate your data analysis
pipeline compared to using Make to do this. Address the following:

  - readability
  - ease of development
  - ease of use to replicate analysis
