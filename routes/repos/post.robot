*** Settings ***
Resource    ../../resources/keywords.robot

*** Variables ***


*** Test Cases ***
Create a repository
    [Tags]                                      newrepo
    Basic Auth Connection
    Create Repository With Name "robothello"
    Delete Repository                           -robothello-    

