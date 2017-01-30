#!/usr/bin/env python

import os
import re
import subprocess

current_path = os.getcwd()
folder_name = os.path.basename(current_path)

pattern = r'.*---(.*)'
match = re.match(pattern, folder_name)

if match is None:
    print("{} did not match pattern.".format(folder_name))
    print("Current path: {}".format(current_path))
    exit(1)
else:
    project_name = match.groups()[0]
    enclosed_project_name_with_space = '[{}] '.format(project_name)
    print('Adding {} to COMMIT_EDITMSG'.format(enclosed_project_name_with_space))
    with open('../.git/COMMIT_EDITMSG', 'w') as f:
        f.write(enclosed_project_name_with_space)

