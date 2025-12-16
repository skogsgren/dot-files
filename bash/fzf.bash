# activate venv in $HOME/.venv directory using fzf
function venva() {
    local selected_env
    selected_env=$(ls ~/.venv/ | fzf)
    if [ -n "$selected_env" ]; then
        source "$HOME/.venv/$selected_env/bin/activate"
    fi
}

# play internet radio from declaration json
function radio {
    local STATION
    local URL
    STATION=$(jq -r "keys[]" "$HOME"/.dot-files/bash/radio-stations.json | fzf)
    URL=$(jq -r .\""$STATION"\" "$HOME"/.dot-files/bash/radio-stations.json)
    if [[ $URL == "null" ]]; then
        return 1
    fi
    mpv --no-video --no-resume-playback "$URL"
}

function fzf_resume_job {
  local job job_id
  job=$(jobs -l | fzf --prompt="Job to resume: " --height=10 --reverse) || return
  job_id=$(echo "$job" | awk '{print $1}' | tr -d '[]')
  if [[ -n "$job_id" ]]; then
    fg "%$job_id"
  else
    echo "No job selected."
  fi
}
