#!/usr/bin/env python

import sys
import datetime
import os

args = sys.argv[1:]

path, tags = args[0], args[1:]

path_exists = os.path.exists(path)

if not path_exists:
    print("Path: {} does not exists! Aborting!").format(path)
    exit(1)

today = datetime.date.today()
date_string = today.strftime("%Y-%m") # 2016-03

tags_string = '-'.join(tags)

new_path = "{}---{}---{}".format(date_string, tags_string, path)

new_path_exists = os.path.exists(new_path)

if new_path_exists:
    print("New path: {} already exists! Aborting!").format(new_path)
    exit(1)
else:
    os.rename(path, new_path)
    print("Renamed:\n{}\nto:\n{}".format(path, new_path))
