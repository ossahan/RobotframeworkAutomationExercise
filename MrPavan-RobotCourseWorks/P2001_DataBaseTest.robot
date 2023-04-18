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
#    Check Nesibe Yilmaz record present in person table
#
#    Check Neslihan record not present in person table
#
#    Check Person Table exists in mydb database

Verify row count is zero
    Row Count Is 0    select * from person where first_name="xyz";
#     ${output}=  Execute Sql String    Create table Perhe(id int, first_name varchar(20), last_name varchar(20));
#    Log To Console    ${output}
    #Should Be Equal As Strings     ${output}  None


    #Inserting Data in person Table
#  ${output}=  Execute Sql Script    ./TestData/mydbPersonInsertData.sql
#
#  Log To Console    ${output}
  #Should Be Equal As Strings     ${output}  None


*** Keywords ***
Create person table
    ${output}=  Execute Sql String    Create table Perhe(id int, first_name varchar(20), last_name varchar(20));
    Log To Console    ${output}
    #Should Be Equal As Strings     ${output}  None


Inserting Data in person Table
    #Single Record
    #${output}=  Execute Sql String    Insert into person values(103,"Zahide", "Sahan");
    #Multiple Records
    ${output}=  Execute Sql Script    ./TestData/mydbPersonInsertData.sql

    Log To Console    ${output}
    Should Be Equal As Strings     ${output}  None

Check Nesibe Yilmaz record present in person table
    Check If Exists In Database      select id from batch59.person where first_name="Nesibe Yilmaz";
    
Check Neslihan record not present in person table
    Check If Not Exists In Database    select id from batch59.person where first_name="Neslihan";

Check Person Table exists in mydb database
    table must exist    person
    
Verify row count is zero
    Row Count Is 0    select * from person where first_name="xyz";    








