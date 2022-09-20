function pomo2(){
  arg=$1
  shift
  args="$*"

  if [[ $arg == "time" ]];
  then
    hour_left=$(($(date +%H)-hour_started))
    minute_left=$(($(date +%M)-minute_started))
    second_left=$(($(date +%S)-second_started))
    dunstify "Pomodoro: time left  " "${hour_left}:${minute_left}:${second_left}"
  else  
    min=${arg:?Invalid time}
    sec=$((min * 60))
    # break=$((sec/4))
    msg="${args:?Invalid message}"

    while ((${sec})) > 0; do
      hour_started=$(date +%H)
      minute_started=$(date +%M)
      second_started=$(date +%S)
      dunstify "Pomodoro: started  " "${hour_started}:${minute_started}:${second_started}"  && sleep "${sec:?}" && dunstify -u critical -t 0 "Pomodoro: finished  " -a pomo "${msg:?}"
      break
    done
  fi
}
