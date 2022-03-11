#!/bin/env bash
VENVDIR="venv"

if [ ! -d "$VENVDIR" ]; then
    echo "no python virtualenv found.."
    echo "creating one....."
    python -m venv venv
else
    echo "python virtualenv exists.. enabling it.."
fi



source $VENVDIR/bin/activate

echo "installing test dependencies..."

pip install -r requirements.dev.txt

exit 0
