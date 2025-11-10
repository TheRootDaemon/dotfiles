act() {
    if [ -z "$1" ]; then
        if [ ! -f "bin/activate" ]; then
            echo "bin/activate Not Found"
            return 1
        else
            source bin/activate
            return 0
        fi
    fi

    if [ ! -f "$1/bin/activate" ]; then
        echo "$1/bin/activate Not Found"
        return 1
    fi

    source "$1/bin/activate"
}
