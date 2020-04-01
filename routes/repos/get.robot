*** Settings ***
Resource         ../../resources/keywords.robot

*** Test Cases ***
Fazendo autenticação básica (Basic Authentication)
    [Tags]                                               basic
    Conectar com autenticação básica na API do GitHub
    Solicitar os dados do meu usuário

Listar Repositórios
    [Tags]                                              repos
    Conectar na API do GitHub sem autenticação
    Listar Repositório Do Usuário

*** Keywords ***
Solicitar os dados do meu usuário
    ${MY_USER_DATA}                  Get Request           alias=mygithubAuth        uri=/user
    ${RESULT}=                       Set Variable          ${MY_USER_DATA.json()}
    Log                              ${RESULT['login']}
    Confere sucesso na requisição    ${MY_USER_DATA}
    Confere dados do usuário         ${RESULT}             ${MY_GITHUB_USER}

Listar Repositório Do Usuário
    ${REPOS}                         Get Request            alias=mygithub          uri=/users/${MY_GITHUB_USER}/repos
    ${RESULT}=                       Set Variable           ${REPOS.json()}
    Log                              ${RESULT[0]['full_name']}
