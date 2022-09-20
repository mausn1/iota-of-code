function pomo(){
  arg=$1

  if [[ $arg != "time" ]];
  then
    start=$(date +%s)
    min=${arg:?Invalid time}
    sec=$((min * 60))
    shift
    args="$*"
    msg="${args:?Invalid message}"
    time_started=$(date +%T)
    dunstify "Pomodoro: started  " "${time_started}" 
    (sleep "${sec}" && dunstify -u critical -t 0 "Pomodoro: finished  " -a pomo "${msg:?}")&
  else  
    end=$(date +%s)
    arg_seconds=$(echo "$start + $sec - $end" | bc)
    format=$(awk -v t=$arg_seconds 'BEGIN{printf "%d:%02d:%02d\n", t/3600, t/60%60, t/1%60}')
    dunstify "Pomodoro: time left  " "${format}" 

  fi
}

# REMINDER, BASH SYNTAX IS ASS

