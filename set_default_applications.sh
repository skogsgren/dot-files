#!/bin/bash
filetypes=(
    "text/plain"
    "text/markdown"
    "text/x-python"
    "text/x-tex"
    "text/x-go"
    "text/x-scss"
    "text/x-css"
    "text/x-javascript"
    "application/x-shellscript"
)

for filetype in "${filetypes[@]}"; do
    xdg-mime default vim.desktop "${filetype}"
done
