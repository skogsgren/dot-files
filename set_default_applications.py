import subprocess

if __name__ =="__main__":
    file_declarations: dict[str, list[str]] = {
        "vim.desktop": [
            "text/plain",
            "text/markdown",
            "text/x-csrc",
            "text/x-python",
            "text/x-tex",
            "text/x-go",
            "text/x-scss",
            "text/x-css",
            "text/x-javascript",
            "application/x-shellscript",
        ],

        "com.calibre_ebook.calibre.ebook-viewer.desktop": [
            "application/epub+zip",
            "application/x-mobipocket-ebook"
        ],

        "org.gnome.eog.desktop": [
            "image/webp"
        ],

        "pcmanfm.desktop": [
            "inode/directory"
        ],

    }

    for desktop_file, filetypes in file_declarations.items():
        for filetype in filetypes:
            print(f"setting {desktop_file} for {filetype}")
            subprocess.run([
                "xdg-mime",
                "default",
                desktop_file,
                filetype
            ], check=False)
