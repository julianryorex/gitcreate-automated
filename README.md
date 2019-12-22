# Github Project Initialization Automated
This is a mini bash program that initializes a Github Repository for a new project. It uses the Github API to connect to the right user.

- Finds the right directory to store new project.
- Creates a new project directory if it does not exist.
- Connects to Github using credentials stored in a file. Initializes a new remote repository.
- Clones that repository to the new project directory. 
- Creates the project file.
- Pushes an initial commit.
- Opens the project in Atom.

My github credentials are saved in a pass.json file (not uploaded to remote repository). 

## Running the bash script: 
<bash_script_name> <project_folder_name> <project_name> (<p> (if private repo))
  
I will work on further generalizing the script (storing paths in another file)
