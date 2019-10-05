# Set JAVA_HOME
JRE=$(readlink -f $(which java))
JDK=$(readlink -f $(which javac))

if [ -f "$JRE" ]; then
    JAVA_HOME=$JRE
fi

if [ -f "$JDK" ]; then
    JAVA_HOME=$JDK
fi

export JAVA_HOME=$(cd $(dirname "$JAVA_HOME")/.. && pwd -P)

