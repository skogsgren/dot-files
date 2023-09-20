import argparse
import json
import os
import sys
from shutil import copy
from distutils.dir_util import copy_tree as cptree
from pathlib import Path


def main():
    if os.getcwd() != os.path.dirname(os.path.abspath(__file__)):
        print("ERROR: must be run within the same directory as script")
        sys.exit(1)
    with open("stw_dcl.json", "r") as f:
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
            if f.is_dir():
                cptree(str(f.absolute()), f"{act[c]['dest']}/{f.name}")
            else:
                copy(f.absolute(), f"{act[c]['dest']}/{f.name}")
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
                    if l == "call plug#begin()\n":
                        f.write(l)
                        for x in act[c]["extras"]:
                            f.write(f"source $HOME/.vim/{x}\n")
                    else:
                        f.write(l)
        for f in act[c]["files"]:
            f = Path(f)
            if f.is_dir():
                cptree(str(f.absolute()), os.path.expandvars(f"$HOME/{f}"))
            else:
                copy(f.absolute(), os.path.expandvars(f"$HOME/{f}"))


if __name__ == "__main__":
    main()
