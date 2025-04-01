function ts {
  args=$@
  tmux send-keys -t right "$args" C-m
}

# nts : "Note to self"
function nts {
  args=$@
  ~/scripts/note_to_self.rb "$args"
}

function ntc {
  args=$@
  ~/scripts/note_to_self.rb -t cpelczarski@gmail.com "$args"
}

function gdd {
  arg1=$([ -z "$1" ] && echo 1 || echo $1)
  arg2=$([ -z "$2" ] && echo $2 || echo "--diff-filter=A")
  cmd="git diff $arg2 HEAD~$arg1..HEAD"
  echo $cmd
  eval $cmd
}

function gdl {
  if [ -z "$1" ]
  then
    back_commits=1
  else
    back_commits=$1
  fi
  if [ -z "$2" ]
  then
    new=
  else
    new=--diff-filter=A
  fi
  cmd="git diff --name-only $new HEAD~$back_commits..HEAD"
  echo $cmd
  eval $cmd
}

function bs() {
  ag "$1" $(bundle show --paths)
}

function lastdl() {
  ls -alt ~/Downloads | head -n ${1:-10}
}

function hcli {
  app=$1
  cmd="heroku run \"bash -i -c 'echo set editing-mode vi > ~/.inputrc'; rails c -- --noautocomplete\" --app=$app"
  echo $cmd
  eval $cmd
}

function go-base {
  url=$1
  echo $url
  shift
  args=$@
  params="$(ruby -r cgi -e 'puts CGI.escape(ARGV[0])' "$args")"
  url=$(printf $url "$params")
  cmd="w3m \"$url\""
  eval $cmd
}

function go-th {
  go-base "https://words.bighugelabs.com/%s" $@
}

function go-d {
  go-base "https://www.duckduckgo.com/search?btnI&q=%s" $@
}

function go-g {
  go-base "https://www.google.com/search?q=%s" $@
}

function reset-conn {
  db=$1
  port=$([ -z "$2" ] && echo 5432 || echo $2)

  echo "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = current_database() AND pid <> pg_backend_pid();" | psql --port $port -U minimul $db
}

function dkrails {
  docker compose exec rails $@
}

function dkconsole {
  dkinputrc
  dkinputrc irbrc
  docker compose exec rails rails console
}

function dk-ip {
  docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $@
}

function pg-ctl {
  # example: pg-ctl 16.1 '-l log/postgres.log start'
  [[ $1 ]] || return "You must supply a Postgres server version"
  [[ $2 ]] || return "You must supply pg_ctl arguments"
  $HOME/.asdf/installs/postgres/$1/bin/pg_ctl -D $HOME/.asdf/installs/postgres/$1/data $2
}

function dkinputrc {
  docker compose cp $HOME/oss/dotfiles/.${1:-inputrc} rails:${2:-/home}
}

function remindme {
  # decimals supported in first/sleep arg
  sleep ${1}m
  shift 1
  yad --text="$*"
}

function time-tables {
  # ig20180122 - displays meeting options in other time zones
  # ml20220712 - Linux GNU date compatible
  # set the following variable to the start and end of your working day
  myday="0 23" # start and end time, with one space
  # set the local TZ
  myplace='America/New_York'
  # set the most common places
  place[1]='UTC'
  place[2]='Europe/Athens'
  place[3]='America/Chicago' # Houston as well
  place[4]='Europe/Amsterdam'
  place[5]='America/Denver'
  place[6]='America/Los_Angeles'
  place[7]='Australia/Brisbane'
  # add cities using place[5], etc.
  # set the date format for search
  dfmt="%m/%d" # date format for meeting date \
  # New format so It can be used as argument
  hfmt="+%B %e, %Y" # date format for the header
  # no need to change onwards
  format1="%-13s " # Increase if your cities are large
  format2="%02d "
  mdate=$1
  if [[ "$1" == "" ]]; then mdate=`date +"$dfmt"`; fi
  # date -j -f "$dfmt" "$hfmt" "$mdate"
  date -d $mdate "$hfmt" # GNU linux compliant
  here=`TZ=$myplace date -d $mdate +%z` # Same Here
  here=$((`printf "%g" $here` / 100))
  printf "$format1" "Eastern USA" 
  printf "$format2" `seq $myday` 
  printf "\n"
  for i in `seq 1 "${#place[*]}"`
  do
      there=`TZ=${place[$i]} date -d "$mdate" +%z` # same here
      there=$((`printf "%g" $there` / 100))
      city[$i]=${place[$i]/*\//}
      tdiff[$i]=$(($there - $here))
      printf "$format1" ${city[$i]}
      for j in `seq $myday`
      do
          printf "$format2" $(($j+${tdiff[$i]}))
      done
      printf "(%+d)\n" ${tdiff[$i]}
  done
}
# WHEN MAKING CHANGES DO NOT FORGET TO SOURCE THIS FILE OR ~/.bash_profile BEFORE RUNNING
