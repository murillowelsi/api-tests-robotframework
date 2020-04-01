*** Settings ***
Resource         ../../resources/keywords.robot

*** Test Cases ***
Fazendo autenticação básica (Basic Authentication)
    [Tags]                                               basic
    Conectar com autenticação básica na API do GitHub
    Solicitar os dados do meu usuário

Usando parametros
    [Tags]                                               params
    Conectar na API do GitHub sem autenticação
    Pesquisar issues com o state "open" e label "bug"

*** Keywords ***
Solicitar os dados do meu usuário
    ${MY_USER_DATA}                  Get Request           alias=mygithubAuth        uri=/user
    ${RESULT}=                       Set Variable          ${MY_USER_DATA.json()}
    Log                              ${RESULT['login']}
    Confere sucesso na requisição    ${MY_USER_DATA}
    Confere dados do usuário         ${RESULT}             ${MY_GITHUB_USER}

Pesquisar issues com o state "${STATE}" e label "${LABEL}"
    &{PARAMS}                        Create Dictionary                state=${STATE}    labels=${LABEl}
    ${MY_ISSUES}                     Get Request                      alias=mygithub    uri=${ISSUES_URI}    params=${PARAMS}
    Log                              Lista de Issues: ${MY_ISSUES}
    Confere sucesso na requisição    ${MY_ISSUES}


