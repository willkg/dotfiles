#!/usr/bin/env python

import os
import shutil
import sys


HELP = """\
usage: python setup_dotfiles.py CMD [options]

install
    --force         delete existing files if any and install
    --test          don't actually do anything--just talk about it

"""

IS_FORCE = False
IS_TEST = False


def path(*args):
    return os.path.join(*args)


def delete(path):
    if os.path.islink(path):
        if IS_TEST:
            print(f"os.unlink {path}")
        else:
            os.unlink(path)
    elif os.path.isfile(path):
        if IS_TEST:
            print(f"os.remove {path}")
        else:
            os.remove(path)
    elif os.path.isdir(path):
        if IS_TEST:
            print(f"shutil.rmtree {path}")
        else:
            shutil.rmtree(path)


def copy(src, target):
    if IS_TEST:
        print(f"os.symlink {src} -> {target}")
    else:
        os.symlink(src, target)


thisdir = os.path.dirname(os.path.realpath(__file__))
dotfilesdir = path(thisdir, "dotfiles")
homedir = os.path.expanduser("~")


if __name__ == "__main__":
    args = sys.argv[1:]
    if not args:
        print(HELP)
        sys.exit(0)

    if args[0] == "install":
        IS_FORCE = "--force" in args
        IS_TEST = "--test" in args

        print(f"source: {dotfilesdir}")
        print(f"target: {homedir}")

        for root, dirs, files in os.walk(dotfilesdir):
            for fn in files:
                pathpart = root[len(dotfilesdir) + 1 :]
                src = path(root, fn)
                target = path(homedir, pathpart, fn)

                print(f"{src} -> {target}")

                # Create the target directory if it doesn't exist.
                targetdir = os.path.dirname(target)
                if not os.path.exists(targetdir):
                    print(f"  creating directory {targetdir} ...")
                    os.makedirs(targetdir)

                if os.path.exists(target):
                    if IS_FORCE:
                        print(f"  deleting {target} ...")
                        delete(target)
                    else:
                        print(f"  {target} is in the way ... skipping")
                        continue

                copy(src, target)

        with open(path(homedir, ".bashrc"), "r") as fp:
            bashrc = fp.read()
            if "bash_profile" not in bashrc:
                print("Make sure to add this line to the end of .bashrc:")
                print()
                print('[ -n "$PS1" ] && source ~/.bash_profile;')

    else:
        print(f"unrecognized command {args[0]} ... exiting")

    # FIXME: check command?
