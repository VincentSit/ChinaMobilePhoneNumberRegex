#!/usr/bin/env bash

set -e

PYTHON_PATH=$(which python)

if [ ! ${PYTHON_PATH} ]; then
	echo "No Python Installed."
	exit -1
fi

${PYTHON_PATH} test.py
