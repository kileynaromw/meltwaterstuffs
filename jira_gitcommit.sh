# In the future this could run a test command first and only ask for a message upon 100% pass

if [[ -z $1 ]]; then
    echo "Story: ${JSTORY}"
    echo "Task: ${JTASK}"
    echo "What is your commit message?"
    read message
else
    message=$1
fi

git commit -m "${JSTORY} ${JTASK}: ${message}"
