from __future__ import print_function

import json
import pprint
import getpass
import datetime


import requests


def warn(message):
    print(message)

def error(message):
    print(message)

def debug(message):
    print(message)

class JSONDeserilizable:
    __desired_keys__ = None
    def __init__(self, json):
        assert type(json) == dict
        if (self.__desired_keys__ is not None and type(self.__desired_keys__) == list and
                all([ type(x) == str for x in self.__desired_keys__])):
            json = { k: v for k, v in json.items() if k in self.__desired_keys__ }

        self.__dict__ = json

    def __repr__(self):
        return pprint.pformat(self.__dict__, indent=4)

class Project(JSONDeserilizable):
    __desired_keys__ = ['name', 'id', 'billable']
    tasks = None

class Task(JSONDeserilizable):
    __desired_keys__ = ['name', 'id', 'billable']

class Entry(JSONDeserilizable):
    __desired_keys__ = [
        'id',
        'hours',
        'notes',
        'client',
        'spent_at', # u'spent_at': u'2016-08-10',

        'project',
        'project_id',
        'task',
        'task_id',
    ]

class HarvestSeason:
    def __init__(self):
        self.__username = None
        self.__password = None
        self.__company = None
        self.__auth = None
        self.__projects = None

    # Properties

    # Returns [Project[Tasks]]
    @property
    def projects(self):
        projects = []

        for project_dict in self.__projects:
            p = Project(project_dict)
            p.tasks = [ Task(task_dict) for task_dict in project_dict['tasks'] ]
            projects.append(p)

        return projects

    # API

    @property
    def __requests_arguments(self):
        return {
            'auth': self.__auth,
            'headers': {'Accept': 'application/json'}
        }

    # Returns [Entry]
    def get_daily(self, year=None, month=None, day=None):
        assert all([ x is not None for x in [year, month, day] ])
        timetuple = datetime.datetime(year, month, day).timetuple()
        year = timetuple.tm_year
        day = timetuple.tm_yday

        r = requests.get(
            'https://{}.harvestapp.com/daily/{}/{}'.format(
                self.__company, day, year
            ),
            **self.__requests_arguments
        )

        if 'day_entries' in r.text:
            return [ Entry(entry_json) for entry_json in r.json()['day_entries'] ]
        else:
            debug("Did not get 'day_entries from response. Maybe there's no entry on that day?")
            debug(r.text)
            return []



    def update_projects(self):
        assert self.__auth is not None

        r = requests.get(
            'https://{}.harvestapp.com/daily'.format(self.__company),
            **self.__requests_arguments
        )

        if 'projects' in r.text and 'tasks' in r.text:
            self.__projects = r.json()['projects']

    def check_login(self):
        assert self.__auth is not None

        r = requests.get(
            'https://{}.harvestapp.com/account/who_am_i'.format(self.__company),
            **self.__requests_arguments
        )

        if 'user' in r.text and 'first_name' in r.text and 'last_name' in r.text:
            user = r.json()['user']

            print("Welcome {} {}!".format(user['first_name'], user['last_name']))
        else:
            print("Something went wrong. Blame the creator/dev.")

    # Login

    def promptForLogin(self, username=None, password=None, company=None):
        if username is None:
            self.__username = raw_input('Username: ')
        else:
            self.__username = username

        if password is None:
            self.__password = getpass.getpass()
        else:
            self.__password = password

        if company is None:
            self.__company = raw_input('Company account name: ')
        else:
            self.__company = company

    def login(self):
        class InvalidLogin(Exception): pass
        if self.invalidLogin():
            warn("Please use promptForLogin to set username and password first.")
            raise InvalidLogin

        self.__auth = requests.auth.HTTPBasicAuth(self.__username, self.__password)

    def invalidLogin(self):
        return ((self.__username is None or self.__password is None or self.__company is None) or
               (len(self.__username) <= 0 or len(self.__password) <= 0 or len(self.__company) <= 0))

if __name__ == '__main__':
    def print(message):
        import pprint
        pprint.pprint(message, indent=4)

    harvestSeason = HarvestSeason()

    harvestSeason.promptForLogin()
    harvestSeason.login()
    harvestSeason.check_login()
    harvestSeason.update_projects()
    # pprint.pprint(harvestSeason.projects, indent=4)
    print(harvestSeason.get_daily(2016, 8, 10))
