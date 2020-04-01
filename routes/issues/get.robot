*** Settings ***
Resource    ../../resources/keywords.robot

*** Test Cases ***
Using Query Params
    [Tags]                                             params
    No Auth Connection
    Search Issues With State "open" And Label "bug"

*** Keywords ***
Search Issues With State "${STATE}" And Label "${LABEL}"
    &{PARAMS}                Create Dictionary                state=${STATE}    labels=${LABEl}
    ${MY_ISSUES}             Get Request                      alias=mygithub    uri=${ISSUES_URI}    params=${PARAMS}
    Log                      Lista de Issues: ${MY_ISSUES}
    Check Request Success    ${MY_ISSUES}


