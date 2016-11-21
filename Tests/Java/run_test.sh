#!/usr/bin/env bash

set -e

if [ ! $(which javac) ]; then
	echo "No Java Installed."
	exit -1
fi

readonly TEST_CLASS_NAME='ChinaMobilePhoneNumberRegexesTest.java'
readonly JUNIT_PATH='junit-4.12.jar'
readonly HAMCREST_PATH='hamcrest-core-1.3.jar'
readonly JAVA_PATH=$(which java)
readonly JAVAC_PATH=$(which javac)

if [ "$(uname)" == "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	${JAVAC_PATH} -cp .:${JUNIT_PATH} ${TEST_CLASS_NAME}
	${JAVA_PATH} -cp .:${JUNIT_PATH}:${HAMCREST_PATH} "org.junit.runner.JUnitCore" "ChinaMobilePhoneNumberRegexesTest"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
	${JAVAC_PATH} -cp .;${JUNIT_PATH} ${TEST_CLASS_NAME}
	${JAVA_PATH} -cp .;${JUNIT_PATH};${HAMCREST_PATH} "org.junit.runner.JUnitCore" ${TEST_CLASS_NAME}
else
	echo "Unsupported OS."
	exit -1
fi