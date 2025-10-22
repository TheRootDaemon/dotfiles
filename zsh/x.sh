x() {
    case "$1" in
    "")
        tmux ls 2>/dev/null || echo "No active tmux sessions."
        ;;
    -n | --new)
        if [ -z "$2" ]; then
            echo "Expected a session name."
            return 1
        fi
        tmux new -s "$2"
        ;;
    -c | --connect)
        if [ -z "$2" ]; then
            echo "Expected a session name."
            echo
            tmux ls 2>/dev/null || echo "No active tmux sessions."
            echo "Create one using x {{-n|--new}} {{session_name}}."
            return 1
        fi
        tmux attach -t "$2"
        ;;
    -k | --kill)
        tmux kill-server
        ;;
    -h | --help)
        echo "Usage: x {{option}} {{session_name}}"
        echo
        echo "Options:"
        echo "  (no flag)               List tmux sessions"
        echo "  -n, --new {{name}}      Create new tmux session"
        echo "  -c, --connect {{name}}  Connect to existing session"
        echo "  -k, --kill              Kill tmux server (all sessions)"
        echo "  -h, --help              Show this help message"
        ;;
    *)
        echo "Unknown option: $1"
        echo "Try 'x {{-h|--help}}' for help."
        return 1
        ;;
    esac
}
