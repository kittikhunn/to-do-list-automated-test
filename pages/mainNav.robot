*** Settings ***
Documentation
Resource    ../resources/imports.robot

*** Variables ***
&{dictMainNav}
...     addItem=xpath=//div[@class='mdl-tabs__tab-bar']//a[contains(text(),'Add Item')]
...     toDoTasks=xpath=//div[@class='mdl-tabs__tab-bar']//a[contains(text(),'To-Do Tasks')]
...     completed=xpath=//div[@class='mdl-tabs__tab-bar']//a[contains(text(),'Completed')]

*** Keywords ***
Click Add Item Button
    Click Element    ${dictMainNav}[addItem]

Click To-Do Tasks Button
    Click Element    ${dictMainNav}[toDoTasks]

Click Completed Button
    Click Element    ${dictMainNav}[completed]