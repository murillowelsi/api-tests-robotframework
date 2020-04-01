*** Settings ***
Resource         ../../resources/keywords.robot

*** Test Cases ***
Usando parametros
    [Tags]                                               params
    Conectar na API do GitHub sem autenticação
    Pesquisar issues com o state "open" e label "bug"

*** Keywords ***
Pesquisar issues com o state "${STATE}" e label "${LABEL}"
    &{PARAMS}                        Create Dictionary                state=${STATE}    labels=${LABEl}
    ${MY_ISSUES}                     Get Request                      alias=mygithub    uri=${ISSUES_URI}    params=${PARAMS}
    Log                              Lista de Issues: ${MY_ISSUES}
    Confere sucesso na requisição    ${MY_ISSUES}


