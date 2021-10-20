import hashlib
import os
import argparse

"""
This file is just a utility to calculate hashes.
"""


# Create the parser
my_parser = argparse.ArgumentParser(
    description='''Hash all files in a directory (non-recursive)''',
    epilog='''
example usage:

    python calculateHashes.py --path "./" --file_ext ".py"

''',
    formatter_class=argparse.RawDescriptionHelpFormatter
)

# Add the arguments
my_parser.add_argument('--path',
                       type=str,
                       help='the path that contains hashable files',
                       default="./isos/")

my_parser.add_argument('--file_ext',
                       type=str,
                       help='the extension of hashable files',
                       default=".iso")

# Execute the parse_args() method
args = my_parser.parse_args()

# Folder to get hashes of files in.
filespath = args.path
filespath = os.path.abspath(filespath)

# File extensions to hash.
file_ext = args.file_ext

# List of hash functions.
hash_fns = [hashlib.md5, hashlib.sha1, hashlib.sha256, hashlib.sha512]


print("# Calculates all the [{}] hashes of '{}/*{}'.\n".format(
    ",".join([fn.__name__ for fn in hash_fns]), filespath, file_ext))

if not os.path.exists(filespath):
    raise ValueError("Path does not exist: '{}'".format(filespath))

def hash_any(fname, hash_algorithm=hashlib.md5):
    """
    Avoids reading entire file into memory.
    Takes a filepath as an argument, and a hash function from hashlib.
    Uses MD5 hash by default.
    """

    hash_object = hash_algorithm()

    with open(fname, "rb") as f:

        for chunk in iter(lambda: f.read(4096), b""):
            hash_object.update(chunk)

    return hash_object.hexdigest()


if __name__ == "__main__":

    # print(filespath)

    for file in os.listdir(filespath):

        filename = os.fsdecode(file)
        filepath = os.path.join(filespath, filename)

        # If it ends with what we want it to,
        if filename.endswith(file_ext):
            print(filename)

            # For all hash functions,
            for hash_fn in hash_fns:
                print("{type:20s} = {digest}".format(digest=hash_any(
                    filepath, hash_algorithm=hash_fn), type=hash_fn.__name__))

            print()
