# tmux-controller

This is tmux-controller, a simple tmux wrapper project that is designed to add extension to tmux functionality as well as
make tmux more comfortable to use

## Setup
### Pre-Requisites

### Dependencies
+ tmux

### Obtaining
- Clone the repository
    ```console
    git clone https://github.com/Thanatisia/tmux-controller
    ```

### Installation
- Install the script from system
    ```console
    sudo make install
    ```

### Uninstall
- Remove the script from system
    ```console
    sudo make uninstall
    ```

## Documentation
### Synopsis/Syntax
```console
tmuxctrl {options} [positionals {suboptions}] <arguments>
```

### Parameters
- Positionals
    - p | panes [actions] {options} <arguments> : Manage tmux panes
        - Actions
            + m | move {options} : Pane movements
                - Options
                    + -l | --left  : Move to the pane on the left
                    + -r | --right : Move to the pane on the right
                    + -u | --up    : Move to the pane above
                    + -d | --down  : Move to the pane below
    - s | session {options} <arguments> : Manage tmux sessions
        - Options
            - With Arguments
                + -a [target-session-name]               | --attach [target-session-name]               : Attach to an existing session
                + -c [new-session-name]                  | --create [new-session-name]                  : Create a new session
                + -r [target-session] [new-session-name] | --rename [target-session] [new-session-name] : Rename a target session to a new session name
            - Flags
                + -d | --detach : Detach from current session
                + -p | --print : Print all session names
                + -h | --help : Display this verbose help message
- Optionals
    - With Arguments
    - Flags
        + -h | --help : Display this verbose help message

### Usage
- Panes
    1. Move to the pane on the left, right, above or below
        ```console
        tmuxctrl {p|pane} {m|move} {-l|-r|-u|-d}
        ```
- Sessions
    1. Create a new session
        ```console
        tmuxctrl {s|session} -c
        ```
    2. Attach to an existing session
        ```console
        tmuxctrl {s|session} -a
        ```
    3. Detach from the current session
        ```console
        tmuxctrl {s|session} -d
        ```
    4. List all existing sessions
        ```console
        tmuxctrl {s|session} -p
        ```

- General
    + Display this verbose help message
        ```console
        tmuxctrl -h
        ```

## References

## Resources

## Remarks
