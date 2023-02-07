# tmux-controller

This is tmux-controller, a simple tmux wrapper project that is designed to add extension to tmux functionality as well as
make tmux more comfortable to use

## Setup
### Pre-Requisites

### Dependencies
+ tmux

### Installation
```console
sudo make install
```

### Uninstall
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
    - session {options} <arguments> : Manage tmux sessions
        - Options
            + -a | --attach : Attach to an existing session
            + -c | --create : Create a new session
            + -d | --detach : Detach from current session
            + -p | --print : Print all session names
            + -h | --help : Display this verbose help message
- Optionals
    - With Arguments
    - Flags
        + -h | --help : Display this verbose help message

### Usage
- Sessions
    1. Create a new session
        ```console
        tmuxctrl session -c
        ```
    2. Attach to an existing session
        ```console
        tmuxctrl session -a
        ```
    3. Detach from the current session
        ```console
        tmuxctrl session -d
        ```
    4. List all existing sessions
        ```console
        tmuxctrl session -p
        ```

- General
    + Display this verbose help message
        ```console
        tmuxctrl -h
        ```

## References

## Resources

## Remarks
