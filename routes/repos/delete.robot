*** Settings ***
Resource    ../../resources/keywords.robot

*** Variables ***


*** Test Cases ***
Create a repository
    [Tags]                                               deleterepo
    Conectar com autenticação básica na API do GitHub
    Criar novo repositório com nome "deletar-repo"
    Deletar repositório                      -deletar-repo-

