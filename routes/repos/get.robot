*** Settings ***
Resource         ../../resources/keywords.robot

*** Test Cases ***
Fazendo autenticação básica (Basic Auth Connectionentication)
    [Tags]                                               basic
    Basic Auth Connection
    Solicitar os dados do meu usuário

Listar Repositórios
    [Tags]                                              repos
    No Auth Connection
    Listar Repositório Do Usuário

*** Keywords ***
Solicitar os dados do meu usuário
    ${MY_USER_DATA}                  Get Request           alias=mygithubAuth        uri=/user
    ${RESULT}=                       Set Variable          ${MY_USER_DATA.json()}
    Log                              ${RESULT['login']}
    Check Request Success    ${MY_USER_DATA}
    Check User Data         ${RESULT}             ${MY_GITHUB_USER}

Listar Repositório Do Usuário
    ${REPOS}                         Get Request            alias=mygithub          uri=/users/${MY_GITHUB_USER}/repos
    ${RESULT}=                       Set Variable           ${REPOS.json()}
    Log                              ${RESULT[0]['full_name']}
