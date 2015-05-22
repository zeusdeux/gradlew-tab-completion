# run this whenever there is a new task added or a task is removed from gradle
setupGradleTasksList() {
    local tasks_file="$HOME/.gradleTasksList"

    if [[ -x ./gradlew ]]; then
        ./gradlew --no-color --quiet tasks | grep ' - ' | awk '{print $1}' | tr '\n' ' ' > $tasks_file
	printf "Done!\n"
    else
        printf "Error: No gradlew in this folder. \nPlease run setupGradleTasksList from a folder that contains a gradlew executable\n" 1>&2
        return 1
    fi
}

# gotta love bash
_gradle() {
    local tasks=''
    local cur=${COMP_WORDS[COMP_CWORD]}
    local tasks_file="$HOME/.gradleTasksList"

    if [[ ! -f $tasks_file ]]; then
        setupGradleTasksList
    fi

    tasks=$(cat $tasks_file)
    COMPREPLY=( $(compgen -W "$tasks" -- $cur) )
}

# setup gradle commands to use _gradle completion function
complete -F _gradle gradle
complete -F _gradle gradlew
complete -F _gradle ./gradlew
