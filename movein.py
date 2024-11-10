#!/bin/python3
__doc__ = """move in dot files to new machine. WARNING: removes existing files"""
from pathlib import Path
import fnmatch
import os


HOME: Path = Path(os.path.expandvars("$HOME"))
assert HOME
with open(".gitignore") as f:
    IGNORES = [x.strip() for x in f]
    assert IGNORES
IGNORED_DIRS = ["setup", "bin", "bash"]


def is_ignored(file: Path) -> bool:
    """checks if file is to be ignored during symlinking"""
    for pattern in IGNORES:
        if fnmatch.fnmatch(str(file), pattern):
            return True
    if file.name in ["movein.py", ".git", ".gitignore"]:
        return True
    if file.is_dir() and file.name in IGNORED_DIRS:
        return True
    return False


def symlink_files_in_directory(dot_file_dir: Path, tgt_root: Path = HOME):
    for dot_file in dot_file_dir.iterdir():
        if is_ignored(dot_file):
            continue
        # we don't want to symlink dirs directly, bc of dirs like .vim/undodir
        if dot_file.is_dir():
            # (tgt_root / dot_file.name).mkdir(parents=True, exist_ok=True)
            symlink_files_in_directory(
                dot_file_dir=dot_file,
                tgt_root=tgt_root / dot_file.name,
            )
            continue
        dot_file.absolute()
        tgt: Path = tgt_root / dot_file.name
        tgt.unlink(missing_ok=True)
        tgt.symlink_to(dot_file.absolute())
        print(f"{tgt} -> {dot_file.absolute()}")


if __name__ == "__main__":
    if os.getcwd() != os.path.dirname(os.path.abspath(__file__)):
        print("ERROR: must be run within the same directory as script")
        exit(1)
    symlink_files_in_directory(Path("./"))
