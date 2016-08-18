"""
Conclusion: cd in subprocess does not affect the dir the script is in
"""
import os
import subprocess

print(os.getcwd()) # TTTTT

subprocess.call(['cd', '/'])

print(os.getcwd()) # TTTTT
