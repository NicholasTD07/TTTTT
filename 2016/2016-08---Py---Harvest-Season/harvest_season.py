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

class JSONDeserilizable(object):
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

class HarvestSeasonAPI(object):
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

    @property
    def hasInvalidLogin(self):
        return ((self.__username is None or self.__password is None or self.__company is None) or
               (len(self.__username) <= 0 or len(self.__password) <= 0 or len(self.__company) <= 0))

    # API

    @property
    def __requests_arguments(self):
        return {
            'auth': self.__auth,
            'headers': {'Accept': 'application/json'}
        }

    def add_entry(self, hours, project, task, notes=None, date=None):
        assert self.__auth is not None
        assert type(hours) == float
        assert type(project) == Project
        assert type(task) == Task
        assert (notes is None) or (type(notes) == str)
        assert (date is None) or (type(date) == datetime.datetime)

        notes = notes if notes is not None else ""
        date = date if date is not None else datetime.datetime.today()

        spent_at = date.strftime('%Y-%m-%d')

        payload = {
            'notes': notes,
            'hours': hours,
            'project_id': project.id,
            'task_id': task.id,
            'spent_at': spent_at,
        }

        r = requests.post(
            'https://{}.harvestapp.com/daily/add'.format(self.__company),
            json=payload,
            **self.__requests_arguments
        )

        if r.status_code == 201:
            print("Added entry on {} for {} hours.".format(date.strftime("%a, %Y-%m-%d"), hours))
            debug("Response: ")
            debug(r.text)
            debug("")
        else:
            print("Soemthing went wrong. Blame the creator/dev.")
            debug(r.text)

    def fill(self, project, task, hours, startDate, endDate=None):
        assert type(project) == Project
        assert type(task) == Task
        endDate = endDate if endDate is not None else datetime.datetime.today()
        for date in datesWithin(startDate, endDate):
            isWeekday = date.weekday() in range(0, 5) # Mon is 0, 0 1 2 3 4 is Mon to Fri
            if not isWeekday:
                print("Skipped (Weekend)")
                continue

            hours_on_that_date = self.get_hours_on_a_date(date)
            missing_hours = hours - hours_on_that_date
            if missing_hours > 0:
                self.add_entry(missing_hours, project, task, date=date)
            elif missing_hours < 0:
                print("On date: {}, there is {} hours logged".format(date.strftime("%a, %Y-%m-%d"), hours))


    def get_hours_on_a_date(self, date=None):
        entries = self.get_daily_at_date(date)
        debug("Entries on the date: {}".format(date))
        debug(entries)
        debug("")
        hours = [ entry.hours for entry in entries ]
        return sum(hours)

    # Returns [Entry]
    def get_daily(self, year=None, month=None, day=None):
        assert all([ x is not None for x in [year, month, day] ])
        date = datetime.datetime(year, month, day)
        return self.get_daily_at_date(date)

    def get_daily_at_date(self, date=None):
        assert self.__auth is not None
        assert date is not None and type(date) == datetime.datetime
        timetuple = date.timetuple()
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

        debug("Response: ")
        debug(r.text)
        debug("")

        if 'projects' in r.text and 'tasks' in r.text:
            self.__projects = r.json()['projects']

    def check_login(self):
        assert self.__auth is not None

        r = requests.get(
            'https://{}.harvestapp.com/account/who_am_i'.format(self.__company),
            **self.__requests_arguments
        )

        debug("Response: ")
        debug(r.text)
        debug("")

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
        if self.hasInvalidLogin:
            warn("Please use promptForLogin to set username and password first.")
            raise InvalidLogin

        self.__auth = requests.auth.HTTPBasicAuth(self.__username, self.__password)

class ProjectFormatter(object):
    def __init__(self, projects):
        assert all([ type(project) == Project for project in projects ])
        self.__projects = projects

    @property
    def projects(self):
        return self.__projects

    def listProjects(self):
        projects_string = '\n'.join(
            [ "[{}]\t{}".format(index, project.name)
             for index, project in enumerate(self.__projects)  ]
        )
        print(projects_string)

    def listTasksInProject(self, projectIndex):
        assert projectIndex < len(self.__projects)

        tasks_string = '\n'.join(
            [ "[{}]\t{}".format(index, task.name)
             for index, task in enumerate(self.__projects[projectIndex].tasks)  ]
        )
        print(tasks_string)

class Selector(object):
    def __init__(self, projects):
        assert type(projects) == list
        assert all([ type(project) == Project for project in projects ])
        self.__projects = projects
        self.selectedProject = None
        self.selectedTask = None

    def __get_project(self, projectIndex):
        assert type(projectIndex) == int and projectIndex < len(self.__projects)

        return self.__projects[projectIndex]

    def selectTask(self, projectIndex, taskIndex):
        project = self.__get_project(projectIndex)
        assert type(taskIndex) == int and taskIndex < len(project.tasks)

        self.selectedProject = project
        self.selectedTask = project.tasks[taskIndex]

def datesWithin(startDate, endDate=None):
    endDate = endDate if endDate is not None else datetime.today()
    assert endDate > startDate
    date = startDate
    while True:
        if date >= endDate:
            break
        yield date
        date = date + datetime.timedelta(days=1)

if __name__ == '__main__':
    def print(message):
        import pprint
        pprint.pprint(message, indent=4)

    api = HarvestSeasonAPI()

    # Get prompted to put auth info
    api.promptForLogin()
    # Or give them as params
    # api.promptForLogin(username='username', password='password', company='company')
    api.login()
    api.check_login()
    api.update_projects()
    # print(api.projects)
    # print(api.get_daily(2016, 8, 10))

    projectFormatter = ProjectFormatter(api.projects)
    projectFormatter.listProjects()
    projectFormatter.listTasksInProject(0)

    selector = Selector(projectFormatter.projects)
    selector.selectTask(0, 4)

    print(selector.selectedProject.name)
    print(selector.selectedTask.name)

    # api.add_entry(
    #     7.6,
    #     selector.selectedProject,
    #     selector.selectedTask,
    # )

    endDate = datetime.datetime.today()
    startDate = endDate - datetime.timedelta(days=35)
    # startDate = datetime.datetime(2017, 2, 1)
    api.fill(selector.selectedProject, selector.selectedTask, 7.6, startDate, endDate)
