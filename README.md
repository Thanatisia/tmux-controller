# tmux-controller

This is tmux-controller, a simple tmux wrapper project that is designed to add extension to tmux functionality as well as
make tmux more comfortable to use

## Basics
### Introduction
+ Tmux is a Terminal Multiplexer, this means that essentially, its job is to new shell "sessions" in the background as processes, allowing you to manage multiple shell sessions as long as the tmux server is up.

### System Structure/Architecture
```
    [server]
        |
        |-- Create a session ---> Session (The current server instance that will carry your shell processes)
                                    |
                                    |--- Create a new Window ---> Window (Shown in the status bar below)
                                                                    |
                                                                    |--- Create horizontal/vertical panes ---> Panes (Nodes/Seperator in your screen (aka Window), like a Window Manager)
```

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
                - -c {options} <arguments>               | --create {options} <arguments>               : Create a new session
                    - Options
                        + -s | --session-name : Explicitly specify the new session's name
                        + -n | --window-name  : Explicitly specify name of window to create alongside the session
                + -r [target-session] [new-session-name] | --rename [target-session] [new-session-name] : Rename a target session to a new session name
            - Flags
                + -d | --detach : Detach from current session
                + -p | --print : Print all session names
                + -h | --help : Display this verbose help message
    - w | window {options} <arguments> : Manage tmux windows
        - Options
            - With Arguments
                + -sp {options} <arguments> | --split {options} <arguments> : Split window; You can even stack them together
                    - Options
                        + d [direction] | daemon [direction] : Open pane as a daemon/background process - split but dont automatically switch to it
                        + h | horizontal : Split horizontally (classically known as vertically; downwards)
                        + v | vertical   : Split vertically (classically known as horizontally; sideways)
                + -sw {options} <arguments> | --swap {options} <arguments> : Swap windows
                    - Options
                        + s [source-window-number] | source [source-window-number] : Specify the source window to switch with; used with 't|target'
                        + t [destination-window-number] | source [destination-window-number] : Specify the target/destination window to switch to; used with 's|source' to trade places; can be used individually by adding a prefix '+ | -' behind a number to move Right or Left by 1 space respectively.
            - Flags
                + -h | --help : Display this verbose help message
                + -k | --kill : Kill the current window
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
        tmuxctrl {s|session} -c {-s|--session-name [new-session-name]} {-n|--window-name [new-window-name}
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
- Windows
    1. Split window panes
        - Horizontally (Downwards)
            ```console
            tmuxctrl {w|window} -sp {h|horizontal}
            ```
        - Vertically (Sideways)
            ```console
            tmuxctrl {w|window} -sp {v|vertical}
            ```
        - Horizontally in the background as a process
            ```console
            tmuxctrl {w|window} -sp d [h|horizontal]
            ```
        - Vertically in the background as a process (default if orientation is not provided)
            ```console
            tmuxctrl {w|window} -sp d [v|vertical]
            ```
        - You can even split multiple times!
            - "Golden Ratio" Spiral
                ```console
                tmuxctrl {w|window} -sp {v|vertical} {h|horizontal} {v|vertical} {h|horizontal}
                ```
             - "Golden Ratio" Spiral with a background daemon
                ```console
                tmuxctrl {w|window} -sp {v|vertical} {h|horizontal} {v|vertical} {h|horizontal} {d|daemon} [orientation (default: vertical)]
                ```           
    2. Swap Windows
        - Move panes in window [0] <=> window [1]
            ```console
            tmuxctrl {w|window} -sw source 0 target 1
            ```
        - Move window to the right (forward) by 1 position
            ```console
            tmuxctrl {w|window} -sw target +1
            ```
        - Move window to the left (backwards) by 1 position
            ```console
            tmuxctrl {w|window} -sw target -1
            ```

- General
    + Display this verbose help message
        ```console
        tmuxctrl -h
        ```

## References

## Resources

## Remarks
