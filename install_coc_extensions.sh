#!/bin/bash

mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions || exit
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi

npm install coc-pyright @yaegassy/coc-ruff coc-go coc-json coc-eslint coc-css coc-tsserver coc-prettier coc-emmet coc-clangd coc-html coc-sh --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
