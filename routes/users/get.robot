*** Settings ***
Resource    ../../resources/keywords.robot

*** Test Cases ***
Search Users
    No Auth Connection
    Search User By Username    ribeirofilipe


*** Keywords ***
Search User By Username
    [Arguments]        ${USERNAME}
    &{PARAMS}          Create Dictionary                q=${USERNAME}
    ${RESPONSE}        Get Request                      alias=mygithub           uri=${SEARCH_REPO_URI}    params=${PARAMS}
    ${RESULT}          Set Variable                     ${RESPONSE.json()}
    Log                ${RESULT['items'][0]['name']}
    Should Be Equal    ${RESULT['items'][0]['name']}    ${USERNAME}.github.io

