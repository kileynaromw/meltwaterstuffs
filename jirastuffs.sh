
# NOTE: This script exports environment variables and must be sourced for the variables to be set in the shell that runs this command.
# An example where we "source" this script:
# $bash:. ./jirastuffs.sh


# functions
function promptForStoryAndTask {
    echo "Story (${JSTORY}): "
    read jstory
    
    if [[ $jstory != "" ]]
    then
        tmp_story="${jstory}"
    fi

    echo "Task (${JTASK}): "
    read jtask

    if [[ $jtask != "" ]]
    then
        tmp_task="${jtask}"
    fi
}

function clearStoryAndTask {
    echo "--CLEARED--"
    tmp_story=""
    tmp_task=""
}

function setStoryFromArg {
    echo "Story SET: $1"
    tmp_story="$1"

    echo "Task: ${JTASK}"
    tmp_task="${JTASK}"
}

function setTaskFromArg {
    echo "Story: ${JSTORY}"
    echo "Task SET: $1"
    tmp_task="$1"
}

function setStoryAndTaskFromArgs {
    echo "Story SET: $1"
    echo "Task SET: $2"
    tmp_story="$1"
    tmp_task="$2"
}

function showStoryAndTask {
    echo "Story: ${JSTORY}"
    echo "Task: ${JTASK}"
}

function showHelp {
    echo "jss to get interactive prompts for story and task (you can just hit enter to keep the existing values)"
    echo "jss <story> to set story"
    echo "jss <story> <task> to set story and task"
    echo "jss -t to clear task"
    echo "jss -t <task> to set task"
    echo "jss -c for clear story and task"
    echo "jss -show to show current story and task"
    echo "jss -help to show this message"
    echo ""
    echo "jgc to get interactive prompts for a jira git commit"
    echo "jgc <message> to commit with a message"
    echo ""
}


# handle arguments on call
if [[ -z $1 && -z $2 ]]
then

    promptForStoryAndTask

elif [[ -z $2 ]]
then

    if [[ $1 == "-c" ]]
    then
        clearStoryAndTask
    elif [[ $1 == "-t" ]]
    then
        setTaskFromArg ""
    elif [[ $1 == "-s" ]]
    then
        showStoryAndTask
    elif [[ $1 == "-h" || $1 == "-?" ]]
    then
        showHelp
    else
        setStoryFromArg $1
    fi

else

    if [[ $1 == "-t" ]]
    then
        setTaskFromArg $2
    else
        setStoryAndTaskFromArgs $1 $2
    fi

fi


# export environment variables for use
export JSTORY="${tmp_story}"
export JTASK="${tmp_task}"

