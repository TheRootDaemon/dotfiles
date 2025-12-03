warp() {
    case "$1" in
    "")
        tmux ls 2>/dev/null || echo "No active tmux sessions."
        ;;
    c | connect)
        if [ -z "$2" ]; then
            echo "Expected a session name."
            echo
            tmux ls 2>/dev/null || echo "No active tmux sessions."
            echo "Create one using x {{n|new}} {{session_name}}."
            return 1
        fi
        tmux attach -t "$2"
        ;;
    p | purge)
        tmux kill-server
        ;;
    h | help)
        echo "Usage: warp {{option}} {{session_name}}"
        echo
        echo "Options:"
        echo "  (no flag)            List tmux sessions"
        echo "  {{name}}             Create a new tmux session"
        echo "  c, connect {{name}}  Connect to existing session"
        echo "  p, purge             Kill tmux server (all sessions)"
        echo "  h, help              Show this help message"
        ;;
    *)
        tmux new -s "$1"
        ;;
    esac
}
