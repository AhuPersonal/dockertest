# Exercise 4: Makefile vs. Shell Script
<img src="../MakevsSh.jpg" align="right" />

## Readability

In terms of readability, shell scripts seem better. Because everything is in the order of execution, and variables are just the parameters of the scripts.

On the other hand, for the Makefile structure, variables can be stored into another file which is harder to read the overall execution. Also script names and paths may become variables or even wildcard values.

So in terms of readability it is much harder to track Makefile compare to shell script.

## Ease of development

Ease of development usually depends how generic the codeflow is. For the shell scripts, it is possible to hard-code all the neccesary commands. In this case it would be very easy for development. On the other hand, it is possible to give variable names for the parameters, and source files via $1 $2 tokens, which is harder to develop compare to hard-coded version.

Similar development cycle applies for Makefile as well, however on the overall developing shell scripts are easier. Because developer does not need to think about the dependency when writing the shell scripts, however for the Makefile the developer needs to state the dependecy for each command seperately.

## Ease of use to replicate analysis

I think Makefile provides better option compare to shell scripts for replicating the analysis because of the following core reasons:

 - It provides incremental compilation, which executes only neccesary commands to generate analysis results.
 - It tracks the dependencies and targets then give information during the compilation, so it is possible to understand what can be go wrong during the replication.
 - It provides a graph view to track the dependecies and targets, which is useful for thinking and documentation about the replication process.
 - It shows help messages, and provide self documentation with *@echo* command.
