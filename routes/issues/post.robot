*** Settings ***
Resource    ../../resources/keywords.robot

*** Variables ***


*** Test Cases ***
Usando headers
    [Tags]                                 headers
    Basic Auth Connection
    Send Reaction "+1" For Issue "2"
    Send Reaction "heart" For Issue "2"
    Send Reaction "eyes" For Issue "2"

Create New Issue With Body Template
    [Tags]                                           template
    Basic Auth Connection
    Create New Issue With Label "robot framework"

*** Keywords ***
Send Reaction "${REACTION}" For Issue "${ISSUE_NUMBER}"
    ${HEADERS}               Create Dictionary                    Accept=application/vnd.github.squirrel-girl-preview+json
    ${MY_REACTION}           Post Request                         alias=mygithubAuth                                          uri=${ISSUES_URI}/${ISSUE_NUMBER}/reactions
    ...                      data={"content": "${REACTION}"}      headers=${HEADERS}
    Log                      Meus Dados: ${MY_REACTION.json()}
    Check Request Success    ${MY_REACTION}

Create New Issue With Label "${LABEL}"
    ${BODY}                  Format String                 ${DATA}/post_issue.json
    ...                      user_git=${MY_GITHUB_USER}
    ...                      label=${LABEL}
    Log                      Meu body ficou:\n${BODY}
    ${RESPONSE}              Post Request                  alias=mygithubAuth         uri=${ISSUES_URI}    data=${BODY}
    Check Request Success    ${RESPONSE}