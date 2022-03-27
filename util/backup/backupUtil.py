'''
Useful utility to back up a folder. Does timestamps too.

Has problems with recursion. 

Will cause infinite zip files to be created if the current working directory is passed as an argument to the script.
'''

import argparse
from datetime import datetime

import os
import sys
import shutil

# Create the parser
my_parser = argparse.ArgumentParser(description='List the content of a folder')

# Add the arguments
my_parser.add_argument('path',
                       type=str,
                       help='the path to back up')

# Execute the parse_args() method
args = my_parser.parse_args()

input_path = args.path
input_path = os.path.abspath(input_path)
print("input_path="+input_path)

simplepath = input_path.rstrip(os.sep)
simplepath = os.path.basename(simplepath)

print("simplepath="+simplepath)

if (not os.path.isdir(input_path)):
    raise Exception(
        f'The path [{input_path}] does not exist or is a file and not a folder. It should be a folder.')

zip_name = simplepath+"_" + \
    datetime.now().strftime("%m-%d-%Y_%H-%M-%S")


if os.path.exists(zip_name):
    raise Exception(f"{zip_name} already exists!")

print(f"Copying [{input_path}] to [{zip_name}].")

shutil.make_archive(zip_name, 'zip', input_path)

print(f"Backed up [{input_path}] to [{zip_name}] successfully...")

exit(0)
