#!/bin/sh

# This script is a wrapper that adds the --no-sandbox flag
# and then executes the real Chromium binary with all arguments passed to it.
exec /usr/bin/chromium-browser --no-sandbox "$@"
