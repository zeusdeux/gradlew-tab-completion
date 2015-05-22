# gradlew-tab-completion

This script adds tab completion for gradlew based on the current tasks configured in gradle.

## Installation

```bash
git clone ssh://git@stash.orbitz.net:7999/~mameta/gradlew-tab-completion.git
source <path to cloned dir>/gradlew-tab-completion.bash

# you can go ahead and add the source line to your .bashrc and source .bashrc
```

Or just `curl` the raw `gradlew-tab-completion.bash` from this repo and add a line to your `.bashrc` that sources it.

## Usage

Run `setupGradleTasksList` from within the project where you want auto completion for `gradlew`.

That's it, really.

## Limitations

This auto completion script can't really give you completions across multiple projects (yet).