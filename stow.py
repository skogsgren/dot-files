import argparse
import json
import os
import sys
from shutil import copy2, copytree, rmtree
from pathlib import Path


def main():
    if os.getcwd() != os.path.dirname(os.path.abspath(__file__)):
        print("ERROR: must be run within the same directory as script")
        sys.exit(1)
    with open("stow_dcl.json", "r") as f:
        act = json.load(f)
    parser = argparse.ArgumentParser(prog="stow", description=".file stow")
    parser.add_argument("cfg", help=" ".join([x for x in act]) + " all")
    args = parser.parse_args()
    if args.cfg not in act:
        parser.print_help()
    else:
        stow(args.cfg, act)


def stow(c: str, act: dict):
    if c == "all":
        for a in act:
            stow(c=a, act=act)
    tp = act[c]["type"]
    if tp == "files":
        for f in act[c]["files"]:
            f = Path(f)
            srcdir = Path(f)
            destdir = Path(os.path.expandvars(f"$HOME/{f}"))
            if f.is_dir():
                if srcdir.is_dir():
                    if destdir.exists():
                        rmtree(destdir.absolute())
                    copytree(srcdir, destdir)
            else:
                copy2(srcdir, destdir)
    elif tp == "text":
        with open(os.path.expandvars(act[c]["dest"]), "r") as f:
            lines = [x.rstrip() for x in f]
        with open(os.path.expandvars(act[c]["dest"]), "a") as f:
            for l in act[c]["cfg"]:
                if l not in lines:
                    f.write(l + "\n")
    elif tp == "vim":
        if act[c]["full"]:
            with open(".vimrc", "r") as f:
                lines = [x for x in f]
            with open(os.path.expandvars("$HOME/.vimrc"), "w") as f:
                for l in lines:
                    if l == "call plug#end()\n":
                        for x in act[c]["extras"]:
                            f.write(f"source $HOME/.vim/{x}\n")
                        f.write(l)
                    else:
                        f.write(l)
        for f in act[c]["files"]:
            srcdir = Path(f)
            destdir = Path(os.path.expandvars(f"$HOME/{f}"))
            if srcdir.is_dir():
                if destdir.exists():
                    rmtree(destdir.absolute())
                copytree(srcdir, destdir)
            else:
                copy2(srcdir, destdir)
        if not os.path.exists(os.path.expandvars("$HOME/.vim/undodir")):
            os.makedirs(os.path.expandvars("$HOME/.vim/undodir"))


if __name__ == "__main__":
    main()
