LPDEST=ECNSHPR201
export LPDEST
test -r $HOME/../login/profile && . $HOME/../login/profile

. ~/.bashrc.user

# TMUX
#if which tmux >/dev/null 2>&1; then
if [ $HOSTNAME = "ecnshts3010" ]; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux attach -t work|| tmux new-session -s work)
fi
