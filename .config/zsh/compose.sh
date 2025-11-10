compose() {
    echo ""
    FORCE=false
    STOP=false
    CLEAN=false
    RECREATE=false
    PURGE=false

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
        -C | --lazy-clean)
            STOP=true
            CLEAN=true
            ;;
        -r | --recreate)
            RECREATE=true
            ;;
        -p | --purge)
            PURGE=true
            ;;
        -h | --help)
            echo "Usage: compose {{options}}"
            echo
            echo "Options:"
            echo "  -s, --stop        Stop the containers"
            echo "  -c, --clean       Prune dangling containers/images"
            echo "  -C, --lazy-clean  Stop and prune dangling containers/images"
            echo "  -r, --recreate    Rebuild images and recreate containers"
            echo "  -f, --force       Stop, prune, and rebuild images before starting"
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

    if $PURGE; then
        echo "Purging..."
        echo ""
        echo ""
        docker system prune -a --volumes -f
        return 0
    fi

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
        docker image prune -a -f
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
