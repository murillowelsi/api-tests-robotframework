*** Settings ***
Documentation    Exemplos da Library Requests: https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot
...              Documentação da API do GitHub: https://developer.github.com/v3/
Library          RequestsLibrary
Library          Collections
Library          String
Resource         ./user_pass.robot
Resource         ./environments.robot

*** Variables ***


*** Keywords ***
Conectar com autenticação básica na API do GitHub
    ${AUTH}           Create List           ${MY_GITHUB_USER}    ${MY_GITHUB_PASS}
    Create Session    alias=mygithubAuth    url=${BASE_URL}      auth=${AUTH}         disable_warnings=True

Conectar na API do GitHub sem autenticação
    Create Session    alias=mygithub    url=${BASE_URL}    disable_warnings=True

Confere sucesso na requisição
    [Arguments]       ${RESPONSE}
    Should Be True    '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...               msg=Erro na requisição! Verifique: ${RESPONSE}

Confere dados do usuário
    [Arguments]       ${RESULT}                              ${USERNAME}
    Should Be True    '${RESULT['login']}'=='${USERNAME}'
