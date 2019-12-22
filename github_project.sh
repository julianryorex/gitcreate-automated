#!/bin/sh

# structure: gitcreate python example.py
# structure: gitcreate python example.py p

# enter 2 or 3 arguments
if [ $# -eq 0 ] || [ $# -eq 1 ]; then
    echo "Enter the right number of arguments."
    exit 1
fi

LANGUAGE=$1
FOLDER="$(tr '[:lower:]' '[:upper:]' <<< ${LANGUAGE:0:1})${LANGUAGE:1}"


# create language directory if missing
if [ ! -d "/Users/myfatduck/OneDrive/Programs/$FOLDER" ]; then
    cd /Users/myfatduck/OneDrive/Programs/
    mkdir $FOLDER
    echo "Created new language directory"
    cd $FOLDER
else
    cd /Users/myfatduck/OneDrive/Programs/$FOLDER
fi

# create project directory
PNAME=$2
DIRECT="${2%%.*}"
DIRECT="$(tr '[:lower:]' '[:upper:]' <<< ${DIRECT:0:1})${DIRECT:1}"

# check if project name exists already
if [ -d "$DIRECT" ]; then
    echo "Directory already exists!"
    exit 1
fi


# configure if private Repository
SCOPE=""
if [ $# -eq 3 ]; then
    SCOPE="p"
    echo Creating Private Repository
else
    echo Creating Public Repository
fi

# run python script to create remote repo
python3 /Users/myfatduck/OneDrive/Programs/Bash/GitHub/github_project_creation.py $DIRECT $SCOPE

if [ $? -eq 1 ]; then
    echo "Issue connecting with remote repository."
    echo "Change your project name."
    exit 1
fi

# clone remote repo to local repo
git clone https://github.com/julianryorex/$DIRECT.git

# create project file
cd $DIRECT
touch $PNAME
atom .

# initial commit
git add .
git commit -m "Initial Automated Commit"
git push origin master

echo "Finished initial commit on project "
