*** Settings ***
Resource         ../../resources/keywords.robot

*** Variables ***


*** Test Cases ***
Usando headers
    [Tags]                                               headers
    Conectar com autenticação básica na API do GitHub
    Enviar a reação "+1" para a issue "2"
    Enviar a reação "heart" para a issue "2"
    Enviar a reação "eyes" para a issue "2"

Postando com body template
    [Tags]                                              template
    Conectar com autenticação básica na API do GitHub
    Postar uma nova issue com label "robot framework"

*** Keywords ***
Conectar com autenticação básica na API do GitHub
    ${AUTH}           Create List           ${MY_GITHUB_USER}    ${MY_GITHUB_PASS}
    Create Session    alias=mygithubAuth    url=${BASE_URL}      auth=${AUTH}         disable_warnings=True

Enviar a reação "${REACTION}" para a issue "${ISSUE_NUMBER}"
    ${HEADERS}                       Create Dictionary                    Accept=application/vnd.github.squirrel-girl-preview+json
    ${MY_REACTION}                   Post Request                         alias=mygithubAuth                                          uri=${ISSUES_URI}/${ISSUE_NUMBER}/reactions
    ...                              data={"content": "${REACTION}"}      headers=${HEADERS}
    Log                              Meus Dados: ${MY_REACTION.json()}
    Confere sucesso na requisição    ${MY_REACTION}

Postar uma nova issue com label "${LABEL}"
    ${BODY}     Format String       ${DATA}/post_issue.json
    ...         user_git=${MY_GITHUB_USER}
    ...         label=${LABEL}
    Log         Meu body ficou:\n${BODY}
    ${RESPONSE}     Post Request    alias=mygithubAuth      uri=${ISSUES_URI}       data=${BODY}
    Confere sucesso na requisição  ${RESPONSE}