*** Settings ***
Library   DatabaseLibrary
Library   OperatingSystem

Suite Setup      Connect To Database     pymysql  ${DBName}    ${DBUser}    ${DBPass}   ${DBHost}  ${DBPort}

Suite Teardown   Disconnect From Database

*** Variables ***
${DBName}        batch59
${DBUser}        root
${DBPass}        Helsinki.900
${DBHost}        127.0.0.1
${DBPort}        3306

*** Test Cases ***


Verify row count is zero
    Row Count Is 0    select * from person where first_name="xyz";

Check Nesibe Yilmaz record present in person table
    Check If Exists In Database      select id from batch59.person where first_name="Nesibe Yilmaz";

Check Neslihan record not present in person table
    Check If Not Exists In Database    select id from batch59.person where first_name="Neslihan";

#Check Person Table exists in mydb database
#    table must exist    person
#    ${output}=  Execute Sql Script    ./TestData/mydbPersonInsertData.sql

Verify row count is equal to some value
    Row Count Is Equal To X         select id from batch59.person where first_name="Nesibe Yilmaz";    1

Verify Row Count Is Greater Than Some Value
    Row Count Is Greater Than X     select id from batch59.person where first_name="Nesibe Yilmaz";    0

Verify Row Count Is Less Than Some Value
    Row Count Is Less Than X    select id from batch59.person where first_name="Nesibe Yilmaz";     5

Update a record in person table
    ${output}=  Execute Sql String    update batch59.person set first_name="Zahide" where id=155;
     Log To Console    ${output}
     Should Be Equal As Strings     ${output}  None
     
Retrieve records from person table
    @{queryResults}=    Query      select * from batch59.person;
    Log To Console      many @{queryResults}

Delete records from person table
    ${output}=   Execute Sql String   delete from batch59.person;
       
        


