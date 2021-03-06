# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export GREP_OPTIONS='--color=auto'

# Prevent less from clearing the screen while still showing colors.
export LESS=-XR

# Set the terminal's title bar.
function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

# SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
  complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp sftp
fi

#Terminal Notifier
alias tmn="terminal-notifier -message"

# Disable ansible cows }:]
export ANSIBLE_NOCOWS=1

#CMatrix Shortcut
alias cm='cmatrix -a -u 5 -s; clear'

dockertail() {
usage="dockertail (dev|pro) (tomcat | loggly | datadog) ip_address"
  if [ $# -ne 3 ]
    then
      echo $usage
  else
    ssh -i ~/.ssh/vic-deploy-$1.pem ec2-user@$3 "sudo docker logs --tail=100 -f \$(sudo docker ps | grep $2 | cut -f1 -d' ')"
  fi
}


eval $(thefuck --alias)

alias mvndev='BUILD_VERSION=dev mvn package'

alias backup_consul='consul kv export vikings/ > ~/Backups/$(date +"%Y")/consul_backup_$(date +"%m%d%Y").json'

alias be='bundle exec'
alias tf='terraform'
