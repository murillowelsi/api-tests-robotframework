*** Settings ***
Resource    ../../resources/keywords.robot

*** Test Cases ***
Basic Auth Connection
    [Tags]                    basic
    Basic Auth Connection
    Input My User And Pass

List Repos
    [Tags]                    repos
    No Auth Connection
    List User Repositories

Search Repositories
    [Tags]                      search
    No Auth Connection
    Search Repositories With    robot     RobotFramework

*** Keywords ***
Input My User And Pass
    ${MY_USER_DATA}          Get Request           alias=mygithubAuth        uri=/user
    ${RESULT}=               Set Variable          ${MY_USER_DATA.json()}
    Log                      ${RESULT['login']}
    Check Request Success    ${MY_USER_DATA}
    Check User Data          ${RESULT}             ${MY_GITHUB_USER}

List User Repositories
    ${REPOS}      Get Request                  alias=mygithub     uri=/users/${MY_GITHUB_USER}/repos
    ${RESULT}=    Set Variable                 ${REPOS.json()}
    Log           ${RESULT[0]['full_name']}

Search Repositories With
    [Arguments]     ${QUERY}                     ${LANGUAGE}
    ${PARAMS}       Set Variable                 q=${QUERY}+language:${LANGUAGE}&sort=stars&order=desc
    ${REPO_LIST}    Get Request                  alias=mygithub                                            uri=${SEARCH_REPO_URI}?${PARAMS}
    Log             Repos List: ${REPO_LIST.json()} 
