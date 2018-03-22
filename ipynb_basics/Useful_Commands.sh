## Command Line Crash Course: Basics and Useful Commands ##

# This file is formatted as follows:
	# comments come after #
	command -- key words that briefly explain what it does
		# additional comments having to do with that command will be indented
		example outputs indented also
		# file names etc that should be populated with your own names will appear like this: "FileName"
	## Headings Look Like This ##



## Where are You? ##

pwd -- output tells you where you are (print working directory)
	# Output should look like this:
		/Users/Marina
cd -- returns you to your home directory
	cd ~ -- does the same thing
cd DirectoryName -- navigate to a directory
	# The directory you name must be "below" you
cd .. -- navigate to the directory directly "above" you
	# Variations of this such as cd ../../.. will send you up through multiple directories
ls -- lists the contents of you current directory
	ls -l -- provides detailed information on the contents of your current directory
	ls t* -- list all files in the current directory that start with that t
		#can replace t with any letter(s)
	ls ???.sh -- list all files in current directory that end in .sh



## Making and Moving Things ##

mkdir Name -- makes a new directory
	# This new directory will be located in the same place that you were when you executed the mkdir command
touch FileName.txt -- creates an empty text File
cp File.txt NewFile.txt -- copy a File to another File
	# This works for directories too! Just drop the .txt
	# If you write a new name you will make a copy of your file or directory under that name
		# But if you use this command with an existing name, you will overwrite the file you copied to
mv File.txt DirectoryName -- moves the contents of a File to a different directory
	# You can also use this command with two existing file names, but keep in mind that you will overwrite the existing file that you move your first file into



## Reading and Writing Bits and Pieces ##

less File.txt -- displays the text File
	# This format is temporary; the output doesn't print but you can see the whole file
head File.txt -- displays first 10 lines of File
tail File.txt -- displays last 10 lines of File

cat File.txt -- displays the text File
	# This format effectively prints the textfile as an output
	cat > File.txt -- write to File
		# Write your text to a file from the first line on (be careful, this will overwrite existing text)
	cat >> File.txt -- append to File
		# Add text to the end of an existing file
	# Use ctrl^C to exit when writing or appending text to your files with cat
vim File -- open a File using the built-in vim text editor
	:set list -- see spaces, line breaks
	:q! -- quit vim



## Parsing Files ##
# This is useful for files that are organized as tables (csv, tsv, etc)
cut -d "," -f 1 File -- output is the first column of the File
	# Change what's in the " " according to the file:
		"ctrl^V+tab" -- for tab delimited
		" " -- space delimited 
	# Change the number after F to choose a different column
		# Add a hyphen before to choose all columns up through that column
		# Add a hyphen to choose that column through the end
	# Very useful for big tables, Genbank tables, etc
awk '{print $1}' File.txt -- output is the first column of a tab delimited File
sed 's/FIND/REPLACE/g' -- replace text "FIND" in a File with "REPLACE"
grep WORD File.txt -- search a text File for a string or regular expression; output will be the line(s) that that string appears in
	# For a multi-word expression, use " "



## A Note on Working with Excel ##
# If you save an excel file as a tab separated or space delimited file, the default will save line breaks as "Class Mac (CR)"
	# This will not work with commands like cut
	# To fix: reopen the file in a text editor and resave with "Unix (LF)" line breaks



## Get Rid of Things ##
rm -- removes a File
rmdir -- removes an empty directory
	# This command will not work if your directory has something in it!
	rm -r --removes a directory containing files
	# Both of these commands do not prompt you to confirm so be careful. Instructions on how to set that up later under "Your Bash Profile"



##Control Keys ##
ctrl^C -- kill current foreground process running in the terminal
ctrl^S -- stop output to the screen (does not kill the process)
ctrl^Q -- resume output to the screen
ctrl^V+tab -- allows you to insert a tab in the command line



## Your Bash Profile ##

# There are some optional ways to set up your bash profile to aid your work:

# For different color themes:
	# While Terminal is open, click "Terminal" in the top menu and choose the "preferences" option
		# Choose any of the available profiles, colors etc to change your terminal. You can choose a preset or customize your own.
		# Make sure you set your favorite option as the default. You may need to open a new terminal window to see it change.

# Set up your bash environment:
	# Check your home directory (use ls) for a file called ~/.bash_profile (or ~/.bashrc or ~/.profile).
		# If none exists, you can create one using the touch command
		# Open the file in a text editor, and add any of the following that you find useful:

# customize prompt with color and pwd
PS1="\[\033[1;33m\][\u@\h:\w]$\[\033[0m\] "
	
# customize terminal window title to display pwd
PROMPT_COMMAND='echo -ne "\033]0; ${PWD##*/}\007"'
	
# autocomplete history with up arrow
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# grep coloring
export GREP_OPTIONS='--color=auto' 
export GREP_COLOR='01;38;5;226'

# command aliases (shortcuts)
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias du='du -sh'
alias l='ls -p'
alias la='ls -ap'
alias lal='ls -alhp'
alias ll='ls -lhp'
alias m2u="tr '\015' '\012'"
alias u2m="tr '\012' '\015'"
alias rm='rm -i'
alias taill='ls -lrt | tail'


## Some Windows Command Equivalents ##
Change Directory: cd in Bash, cd or chdir in DOS
List Contents of Directory: ls in Bash, dir in DOS
Move or Rename a File: mv in Bash, move and rename in DOS
Copy a File: cp in Bash, copy in DOS
Delete a File: rm in Bash, del or erase in DOS
Create a Directory: mkdir in Bash, mkdir in DOS
Use a Text Editor: vi or nano in Bash, edit in DOS