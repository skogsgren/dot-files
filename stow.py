import argparse
import json
import os
import sys
from shutil import copy2, copytree, rmtree
import subprocess
from pathlib import Path

def stow_files(choice: str, actions: dict) -> None:
    """ copies files according to specification """
    for f in actions[choice]["files"]:
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

def stow_text(choice: str, actions: dict) -> None:
    """ appends lines to an already existing file """
    with open(os.path.expandvars(actions[choice]["dest"]), "r") as f:
        lines = [x.rstrip() for x in f]
    with open(os.path.expandvars(actions[choice]["dest"]), "a") as f:
        for l in actions[choice]["cfg"]:
            if l not in lines:
                f.write(l + "\n")

def stow_vim(choice: str, actions: dict) -> None:
    """ installs selected set of vimrc(full/minimal/base) """
    if actions[choice]["full"]:
        with open(".vimrc", "r") as f:
            lines = [x for x in f]
        with open(os.path.expandvars("$HOME/.vimrc"), "w") as f:
            for l in lines:
                if l == "call plug#end()\n":
                    for x in actions[choice]["extras"]:
                        f.write(f"source $HOME/.vim/{x}\n")
                    f.write(l)
                else:
                    f.write(l)
        subprocess.run("./install_coc_extensions.sh")
    for file in actions[choice]["files"]:
        srcdir = Path(file)
        destdir = Path(os.path.expandvars(f"$HOME/{file}"))
        if srcdir.is_dir():
            copytree(srcdir, destdir, dirs_exist_ok=True)
        else:
            copy2(srcdir, destdir)
    if not os.path.exists(os.path.expandvars("$HOME/.vim/undodir")):
        os.makedirs(os.path.expandvars("$HOME/.vim/undodir"))

def stow(choice: str, actions: dict):
    """ wrapper for stowing dot files with recursive functionality """
    if choice == "all":
        for a in actions:
            stow(choice=a, actions=actions)
    action_type = actions[choice]["type"]
    if action_type == "files":
        stow_files(choice, actions)
    elif action_type == "text":
        stow_text(choice, actions)
    elif action_type == "vim":
        stow_vim(choice, actions)

def main():
    if os.getcwd() != os.path.dirname(os.path.abspath(__file__)):
        print("ERROR: must be run within the same directory as script")
        sys.exit(1)
    with open("stow_dcl.json", "r") as f:
        actions = json.load(f)
    parser = argparse.ArgumentParser(prog="stow", description=".file stow")
    parser.add_argument("cfg", help=" ".join(list(actions)) + " all")
    args = parser.parse_args()
    if args.cfg not in actions:
        parser.print_help()
    else:
        stow(args.cfg, actions)

if __name__ == "__main__":
    main()
