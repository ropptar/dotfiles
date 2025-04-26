pid=$(pgrep $1)
if [[ -z $pid ]]; then
	exec $1;
else
	kill $pid;
fi
