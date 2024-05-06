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
    Element Text Should Be      ${dictMainNav}[header]      TO DO LIST

Add Item Button Is Shown
    Page Should Contain Element    ${dictMainNav}[addItem]

To-Do Tasks Button Is Shown
    Page Should Contain Element    ${dictMainNav}[toDoTasks]

Completed Button Is Shown
    Page Should Contain Element    ${dictMainNav}[completed]

Click Add Item Button
    Click Element    ${dictMainNav}[addItem]

Click To-Do Tasks Button
    Click Element    ${dictMainNav}[toDoTasks]

Click Completed Button
    Click Element    ${dictMainNav}[completed]