import requests
import json
import sys
from http import HTTPStatus


abs_path = "/Users/myfatduck/OneDrive/Programs/Bash/GitHub"

def create_project():
    username, token = import_credetials()
    data = get_data()
    login = requests.post('https://api.github.com/' + 'user/repos', auth=(username,token), data=json.dumps(data))
    request_num = login.status_code
    if(request_num == 201 or request_num == 200):
        sys.exit(0)
    else:
        sys.exit(1)


def get_data():
    private = False
    if(len(sys.argv) == 3 and sys.argv[2] == "p"):
        private = True

    data = {
        "name": sys.argv[1],
        "private": private,
        'auto_init': 'true'
    }

    return data

def import_credetials():
    username = ""
    token = ""
    try:
        with open(f"{abs_path}/pass.json") as json_file:
            credentials = []
            json_data = json.load(json_file)
            for data in json_data.values():
                credentials.append(data)
            username = credentials[0]
            token = credentials[1]
    except:
        print("Credential Importing Error.")

    return username, token


create_project()
