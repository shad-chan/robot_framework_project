*** Settings ***
Documentation    Test suite for skleptest.pl
Library          SeleniumLibrary

*** Variables ***
${BROWSER}       chrome
${DELAY}         0.5
${URL}           https://skleptest.pl/
${SEARCH_TERM}   Robot Framework

*** Test Cases ***
Search for a product
    Open Browser          ${URL}          ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Input Text            css=#woocommerce-product-search-field-0        ${SEARCH_TERM}
    Click Button          css=.search-form [type="submit"]
    Wait Until Page Contains Element    css=.woocommerce-LoopProduct-link
    Should Be True        "${SEARCH_TERM}" in Page Title
    Close Browser

Check navigation links
    Open Browser          ${URL}          ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Click Link            css=#menu-item-58 > a
    Wait Until Page Contains Element    css=.woocommerce-LoopProduct-link
    Click Link            css=#menu-item-57 > a
    Wait Until Page Contains Element    css=#content
    Close Browser