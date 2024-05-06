*** Settings ***
Documentation
Resource    ../resources/imports.robot

*** Variables ***
&{dictMainNav}
...     header=xpath=//h1
...     addItem=xpath=//div[@class='mdl-tabs__tab-bar']//a[contains(text(),'Add Item')]
...     toDoTasks=xpath=//div[@class='mdl-tabs__tab-bar']//a[contains(text(),'To-Do Tasks')]
...     completed=xpath=//div[@class='mdl-tabs__tab-bar']//a[contains(text(),'Completed')]

*** Keywords ***
Header Displays Correctly
    SeleniumLibrary.Element Text Should Be      ${dictMainNav}[header]      TO DO LIST

Add Item Button Is Shown
    SeleniumLibrary.Page Should Contain Element    ${dictMainNav}[addItem]

To-Do Tasks Button Is Shown
    SeleniumLibrary.Page Should Contain Element    ${dictMainNav}[toDoTasks]

Completed Button Is Shown
    SeleniumLibrary.Page Should Contain Element    ${dictMainNav}[completed]

Click Add Item Button
    SeleniumLibrary.Click Element    ${dictMainNav}[addItem]

Click To-Do Tasks Button
    SeleniumLibrary.Click Element    ${dictMainNav}[toDoTasks]

Click Completed Button
    SeleniumLibrary.Click Element    ${dictMainNav}[completed]