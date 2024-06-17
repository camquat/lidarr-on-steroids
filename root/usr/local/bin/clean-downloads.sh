#!/bin/bash

if [ "$CLEAN_DOWNLOADS" != "true" ]; then
    exit
fi

DOWNLOAD_DIR="${DOWNLOAD_DIR:-/downloads}"

# shellcheck disable=SC2154
echo "Info|Lidarr event: $lidarr_eventtype" >&2

# Handle Lidarr Test event
if [[ "$lidarr_eventtype" = "Test" ]]; then
    echo "Info|Script was test executed successfully." >&2
    exit 0
fi

echo "Info|Cleaning empty folders" >&2
find "$DOWNLOAD_DIR" -type d -empty -print -delete >&2
