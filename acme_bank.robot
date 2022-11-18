*** Settings ***
Library     SeleniumLibrary
Library     EyesLibrary       runner=web    config=applitools.yaml

Test Setup        Setup
Test Teardown     Teardown

*** Keywords ***
Setup
    Open Browser    https://demo.applitools.com    Chrome
    Eyes Open

Teardown
    Eyes Close Async
    Close All Browsers

*** Test Cases ***
Log into bank account
    Eyes Check Window    Login Page     Fully

    Input Text        id:username    applibot
    Input Text        id:password    I<3VisualTests
    Click Element     id:log-in

    Eyes Check Window    Main Page    Fully