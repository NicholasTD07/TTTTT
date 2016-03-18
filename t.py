#!/usr/bin/env python

import sys
import datetime
import os

args = sys.argv[1:]

if len(args) < 2:
    print("Usage: {} path tag1 tag2\n\n{} will rename path to 'Year-Month---tag1-tag2---path'.".format(sys.argv[0], sys.argv[0]))
    exit(1)

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
