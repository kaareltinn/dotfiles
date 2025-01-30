alias d="docker "
alias dc="docker compose "
alias dcps="docker compose ps --all --format 'table {{.State}}\t{{.Name}}\t{{.Status}}' "
alias docker-compose="docker compose "
alias docker-clean="docker system prune --force --all; docker volume prune --force --all "
alias fdps="docker ps --format '{{.Names}}' | fzf | xargs | tr -d '\n' | pbcopy"
alias gcoh='git checkout $(git branch | fzf | xargs)'
alias lzd="lazydocker"
alias lzg="lazygit"

gh_run_view() {
  local workflow_name=$1
  local web_flag=true
  local branch_name=$(git rev-parse --abbrev-ref HEAD)

  # Parse named arguments
  while [[ "$#" -gt 1 ]]; do
    case $2 in
      --web) web_flag=$3; shift 2;;
      --branch) branch_name=$3; shift 2;;
      *) echo "Unknown parameter passed: $2"; return 1;;
    esac
  done

  # Fetch the databaseId of the latest run for the specified workflow and branch
  local run_id=$(gh run list --workflow="$workflow_name" --branch="$branch_name" --limit=1 --json databaseId | jq -r '.[0].databaseId')

  if [ -z "$run_id" ]; then
    echo "No run found for workflow: $workflow_name on branch: $branch_name"
    return 1
  fi

  # View the run
  if [ "$web_flag" = true ]; then
    gh run view --verbose "$run_id" --web
  else
    gh run view --verbose "$run_id"
  fi
}

function ec2-list {
  if [ -n "$1" ];then
    aws ec2 describe-instances --filters "Name=tag:environment,Values=$1" "Name=instance-state-name,Values=running"  --query 'Reservations[*].Instances[*].[PrivateIpAddress, InstanceId, Tags[?Key==`Name`].Value | [0], State.Name]' --output text
  else
    echo "Missing required argument ENVIRONMENT"
  fi  
}
