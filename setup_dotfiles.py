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
            print('os.unlink %s' % path)
        else:
            os.unlink(path)
    elif os.path.isfile(path):
        if IS_TEST:
            print('os.remove %s' % path)
        else:
            os.remove(path)
    elif os.path.isdir(path):
        if IS_TEST:
            print('shutil.rmtree %s' % path)
        else:
            shutil.rmtree(path)


def copy(src, target):
    if IS_TEST:
        print('os.symlink %s -> %s' % (src, target))
    else:
        os.symlink(src, target)


thisdir = os.path.dirname(os.path.realpath(__file__))
dotfilesdir = path(thisdir, 'dotfiles')
homedir  = os.path.expanduser('~')


if __name__ == '__main__':
    args = sys.argv[1:]
    if not args:
        print(HELP)
        sys.exit(0)

    if args[0] == 'install':
        IS_FORCE = '--force' in args
        IS_TEST = '--test' in args

        print('source: %s' % dotfilesdir)
        print('target: %s' % homedir)

        for root, dirs, files in os.walk(dotfilesdir):
            for fn in files:
                pathpart = root[len(dotfilesdir)+1:]
                src = path(root, fn)
                target = path(homedir, pathpart, fn)

                print('%s -> %s' % (src, target))

                # Create the target directory if it doesn't exist.
                targetdir = os.path.dirname(target)
                if not os.path.exists(targetdir):
                    print('  creating directory %s ...' % targetdir)
                    os.makedirs(targetdir)

                if os.path.exists(target):
                    if IS_FORCE:
                        print('  deleting %s ...' % target)
                        delete(target)
                    else:
                        print('  %s is in the way ... skipping' % target)
                        continue

                copy(src, target)

    else:
        print('unrecognized command %s ... exiting' % args[0])

    # FIXME: check command?
