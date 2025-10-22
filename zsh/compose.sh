compose() {
    echo ""
    FORCE=false
    STOP=false
    CLEAN=false
    RECREATE=false

    while [[ $# -gt 0 ]]; do
        case "$1" in
        -f | --force)
            FORCE=true
            STOP=true
            CLEAN=true
            ;;
        -s | --stop)
            STOP=true
            ;;
        -c | --clean)
            CLEAN=true
            ;;
        -r | --recreate)
            RECREATE=true
            ;;
        -h | --help)
            echo "Usage: compose {{options}}"
            echo
            echo "Options:"
            echo "  -f, --force       Stop, prune, and rebuild images before starting"
            echo "  -s, --stop        Stop containers and prune (no rebuild)"
            echo "  -c, --clean       Prune dangling containers/images only"
            echo "  -r, --recreate    Rebuild images and recreate containers"
            echo
            return 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Try 'compose {{-h|--help}}' for help."
            return 1
            ;;
        esac
        shift
    done

    if $STOP; then
        echo "Stopping containers..."
        echo ""
        echo ""
        docker compose stop
    fi

    if $CLEAN; then
        echo "Pruning containers and images..."
        echo ""
        echo ""
        docker container prune -f
        docker image prune -f
    fi

    if $FORCE; then
        echo "Force rebuilding and recreating containers..."
        echo ""
        echo ""
        docker compose build --no-cache
        docker compose up -d --force-recreate
    elif $RECREATE; then
        echo "Rebuilding and recreating containers..."
        echo ""
        echo ""
        docker compose up -d --build --force-recreate
    fi

    if ! $STOP && ! $CLEAN; then
        echo "Starting containers..."
        echo ""
        echo ""
        docker compose up -d
    fi
}
