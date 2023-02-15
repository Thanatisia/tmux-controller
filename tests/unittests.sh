: "
Shellscripting/Bash Scripting Unit Testing Library

[Setup]
1. Import/Source this library into your script
    . unittests.sh

[Documentation]
### Functions
- assertEquals : Compares and checks that the result/return value of the function/command equals to the expected value provided.
- assertProcess : Tests and check that the process was successful/failed via the status code returned by the command
- assertSuccess : Tests and check that the process was successful/failed using the '&&' and '||' success/error condition operator
"

assertEquals()
{
    : "
    Assertion Unit Testing function

    :: Summary
    - Check if the result/return value of the function is equals to the expected value
    "
    # Get Parameters
    cmd="$1" # Command to test
    expected_value="$2" # Expected value that the command should return
    success_msg="${3:-"[OK] test for '$cmd' success."}" # Success Message
    error_msg="${4:-"[X] Error detected running '$cmd'"}" # Error message

    # Execute command and get standard output
    stdout="$($cmd)"

    # Compare value
    if [[ "$stdout" == "$expected_value" ]]; then
        # Success message
        echo -e "$success_msg"
    else
        # Error
        echo -e "$error_msg"
    fi
}

assertProcess()
{
    : "
    Process call assertion Unit Testing function
    
    :: Summary
    - Check if the process was Successful/Error using the status code
    "

    # Get Parameters
    cmd="$1" # Command to test
    success_msg="${2:-"[OK] test for '$cmd' success."}" # Success Message
    error_msg="${3:-"[X] Error detected running '$cmd'"}" # Error message
    verbose="${4:-False}"

    # Execute command and check process ID
    if [[ "$verbose" == "True" ]]; then
    	$cmd
    else
	    $cmd >> /dev/null
    fi
    status_code="$?"

    # Compare value
    # Check if success/error
    # == 0 = Success
    # > 0 = Error/Failed
    if [[ "$status_code" == "0" ]]; then
        # Success message
        echo -e "$success_msg"
    else
        # Error
        echo -e "$error_msg"
    fi
}

assertSuccess()
{
    : "
    Success checker assertion Unit Testing function
    
    :: Summary
    - Check if the process was Successful/Error with the '&&' operator
    "

    # Get Parameters
    cmd="$1" # Command to test
    success_msg="${2:-"[OK] test for '$cmd' success."}" # Success Message
    error_msg="${3:-"[X] Error detected running '$cmd'"}" # Error message
    verbose="${4:-False}"

    # Execute command and check process ID
    if [[ "$verbose" == "True" ]]; then
        $cmd && \
            # Success message
            echo -e "$success_msg" || \
            # Error
            echo -e "$error_msg"
    else
        $cmd >> /dev/null && \
            # Success message
            echo -e "$success_msg" || \
            # Error
            echo -e "$error_msg"
    fi
}
