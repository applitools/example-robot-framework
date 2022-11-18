*** Settings ***
# Use Selenium WebDriver and Applitools Eyes with the Ultrafast Grid.
Library     SeleniumLibrary
Library     EyesLibrary       runner=web_ufg    config=applitools.yaml

# Declare setup and teardown routines.
Test Setup        Setup
Test Teardown     Teardown


*** Keywords ***
# For setup, load the demo site's login page and open Eyes to start visual testing.
Setup
    Open Browser    https://demo.applitools.com    headlesschrome
    Eyes Open

# For teardown, close Eyes and the browser.
Teardown
    Eyes Close Async
    Close All Browsers


*** Test Cases ***
# This test covers login for the Applitools demo site, which is a dummy banking app.
# The interactions use typical Selenium WebDriver calls,
# but the verifications use one-line snapshot calls with Applitools Eyes.
# If the page ever changes, then Applitools will detect the changes and highlight them in the dashboard.
# Traditional assertions that scrape the page for text values are not needed here.
Log into bank account

    # Verify the full login page loaded correctly.
    Eyes Check Window    Login Page     Fully

    # Perform login.
    Input Text        id:username    applibot
    Input Text        id:password    I<3VisualTests
    Click Element     id:log-in

    # Verify the full main page loaded correctly.
    # This snapshot uses LAYOUT match level to avoid differences in closing time text.
    Eyes Check Window    Main Page    Fully    Match Level  LAYOUT