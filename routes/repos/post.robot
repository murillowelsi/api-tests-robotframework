*** Settings ***
Resource    ../../resources/keywords.robot

*** Variables ***


*** Test Cases ***
Create a repository
    [Tags]                                               newrepo
    Conectar com autenticação básica na API do GitHub
    Criar novo repositório com nome "robothello"
    Deletar repositório             -robothello-        

