function parse_args {
  while (( "$#" )); do
    if [[ $1 == '--skip-lint' ]]; then
      skip_lint=true
    else
      msg=$1
    fi
    shift
  done
}

function set_default_msg {
  if [[ ! $msg ]]; then
    msg=$(git log -n 1 --oneline | cut -d " " -f 2-)
    echo "using last commit message: $msg"
  fi
}

function run_linter {
  has_linter=$(yarn run 2> /dev/null | grep -q '\- lint'; echo $?)
  if [[ $skip_lint != true ]] && [[ $has_linter == "0" ]]; then
    yarn lint
    if [[ $? != "0" ]] && [[ $skip_lint != true ]]; then
      exit 1
    fi
  fi
}

function run_tests {
  timedatectl set-timezone 'Africa/Lagos' && \
    yarn test && \
    timedatectl set-timezone 'America/Edmonton' && \
    return
  exit 1
}

function push_remote {
  dir=$(pwd)
  if [[ dir =~ "central-market/joe-vs" ]]; then
    remote_branch=$(get_remote)
    if [[ $remote_branch ]]; then
      git push origin ${remote_branch}
    else
      git push --track origin $(git branch --show-current)
    fi
  else
    echo "remote branch detection not set up for directory: $dir"
    exit 1
  fi
}

function list_todos {
  rg -i 'todo.*tolu'
}

parse_args "$@"
set_default_msg
rebase
run_linter
run_tests
push_remote
list_todos
