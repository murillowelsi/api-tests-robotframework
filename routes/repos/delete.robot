*** Settings ***
Resource    ../../resources/keywords.robot

*** Variables ***


*** Test Cases ***
Delete a Github Repository
    [Tags]                                        deleterepo
    Basic Auth Connection
    Create Repository With Name "deletar-repo"
    Delete Repository                             -deletar-repo-

