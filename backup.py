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
    with open("backup_dcl.json", "r") as f:
        act = json.load(f)
    parser = argparse.ArgumentParser(prog="backup", description=".file backup")
    parser.add_argument("cfg", help=" ".join([x for x in act]) + " all")
    args = parser.parse_args()
    if args.cfg == "all":
        backup("all", act)
    else:
        if args.cfg not in act:
            parser.print_help()
        else:
            backup(args.cfg, act)


def backup(c: str, act: dict):
    if c == "all":
        for a in act:
            backup(c=a, act=act)
        sys.exit(1)
    for i in act[c].get("inherits", []):
        act[c]["files"] += act[i]["files"]
    for f in act[c]["files"]:
        dest = Path(f)
        src = Path(f"{os.path.expandvars(act[c]['src'])}/{f}")
        if src.is_dir():
            if dest.exists():
                rmtree(dest.absolute())
            copytree(src.absolute(), dest.absolute())
        else:
            copy2(src.absolute(), dest.absolute())
        if f == ".vimrc":  # special case since vimrc can import files
            os.system("egrep -v '^source' .vimrc >/tmp/.vimrc")
            os.system("mv /tmp/.vimrc .vimrc")


if __name__ == "__main__":
    main()
