#!/usr/bin/env bash

HYPRPROP_PID='/tmp/hyprprop.pid'
echo $$ >"$HYPRPROP_PID"

EVENT_HANDLER="/usr/share/hyprprop/event_handler"

prop() {
  out_file=/tmp/hyprprop.out
  error_file=/tmp/hyprprop.error
  visible_workspaces=$(hyprctl monitors -j |
    jq -r '[.[].activeWorkspace.id,
                                  .[].specialWorkspace.id | select(. != null and . != 0)]
                                 | flatten
                                 | unique')

  hyprctl clients -j | jq --argjson visibleWorkspaces "$visible_workspaces" \
    -r '.[] | select(.workspace.id | IN($visibleWorkspaces[]))
                                    | [.at[0], .at[1], .size[0], .size[1]]
                                    | "\(.[0]),\(.[1]) \(.[2])x\(.[3])"' |
    slurp -r
  PID=$!
  wait $PID
  error=$(cat $error_file)
  rm $error_file

  selection=$(cat $out_file)
  rm $out_file

  [ -n "$error" ] && prop # invalid box format: null,null nullxnull
  [ -z "$selection" ] && cleanup && exit
  cleanup
  exit
}

cleanup() {
  hyprevents -f "$EVENT_HANDLER" -k
  rm "$HYPRPROP_PID"
}

event_handler() {
  pkill slurp
  wait "$PID" 2>/dev/null
  prop
}

terminate() {
  pkill slurp
  wait "$PID" 2>/dev/null
  cleanup
  exit
}

# Capture events on hyprland window/workspace change events
hyprevents -f "$EVENT_HANDLER" 2>/dev/null &
trap event_handler USR1

#trap terminate SIGINT
prop
