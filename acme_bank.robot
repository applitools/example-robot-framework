*** Settings ***
Library  SeleniumLibrary
Library  EyesLibrary       runner=web    config=applitools.yaml

*** Test Cases ***
Check the Login page 
  Open Browser  https://applitools.github.io/demo  Chrome
  Eyes Open
  Eyes Check Window  DemoApp Login  Fully
  Eyes Close Async
  Close All Browsers