#Author: akash.deep@prodigylabs.net
#ModifiedBy: vaishali.katta@prodigylabs.net
#Keywords Summary : VAST Automation 
#Feature: Person Origination
#Scenario: #NA
Feature: Customer Search 
Background:
    Given User launches the Vast application "http://vnbaxmqaapp.vnb.internal:8080/bpc/"
    And user enters text "adeep" in textbox "Username"
    And user enters text "test" in textbox "Password"
	And user clicks on button "Environment"
	And user clicks on button "VAST_Jack_Henry_QAT"
    And user clicks on button "Login"
    And user is on Vast Homepage    
 	
@Smoke @Regression	 @TC003
Scenario Outline: Validate the user is able to create new record for person in VAST system when no customer is retreived from the system
	Given user is on Vast Homepage
	And user clicks on button "Customer"
	And user clicks on button "Person_Origination"
	And user enters text "<TIN (SSN/EIN)>" in textbox "TIN_SSN_EIN"
	And user clicks on button "Search"
	And user waits for page to load
	And user clicks on button "Create_Person"
	And user clicks on button "Title"
	And user selects "<Title>" from "available_Titles"
	And user enters text "<First name>" in textbox "First_name"
	And user enters text "<Last name>" in textbox "Last_name"
	And user clicks on button "Gender"
	And user selects "<Gender>" from "available_Genders"
	And user enters text "<Birth Date>" in textbox "Birth_Date"
	And user enters text "<Street address>" in textbox "Street_address"
	And user enters text "<City>" in textbox "City"
	And user clicks on button "State"
	And user selects "<State>" from "available_States"
	And user enters text "<Zip code>" in textbox "Zip_code"
	And user clicks on button "Add_Phone_number"
	And user clicks on button "Phone_type"
	And user selects "<Phone type>" from "available_Phone_types"
	And user enters text "<Phone number>" in textbox "Phone_number" using javascript
	And user clicks on button "Save_Phone_Number"
	And user clicks on button "Add_Email_address"
	And user enters text "<Email address>" in textbox "Email_address"
	And user clicks on button "Save_Email_address"
	And user selects "<ID type>" from "ID_type"
	And user enters text "<Number>" in textbox "Number"
	And user enters text "<Issuing authority>" in textbox "Issuing_authority"
	And user selects "<ID state>" from "State"
	And user enters text "<Issuance date>" in textbox "Issuing_date"
	And user enters text "<Expiration date>" in textbox "Expiration_date"
	And user enters text "<Employer>" in textbox "Employer"
	And user enters text "<Job title>" in textbox "Job_title"
	And user enters text "<Salary>" in textbox "Salary"
	And user selects "<Officer code>" from "Officer_code"
	And user selects "<Branch>" from "Branch"
	And user clicks on button "Next"
	And user reaches on ID Verification screen
	And user clicks on button "Next"
	And user clicks on button "Next"
	And user clicks on button "Confirm"
	And user reaches on confirmation screen
	And user clicks on button "Click"

    Examples: 
	|	TIN (SSN/EIN)	|	Title	|	First name	|	Last name	|	Gender	|	Birth Date	|	Street address	|	City	|	State		|	Zip code	|	Phone type	|	Phone number	|	Email address	|	ID type				|	Number	|	Issuing authority	|	ID state	|	Issuance date	|	Expiration date	|	Employer	|	Job title	| Salary	|	Officer code	|	Branch			|
	|	4111111555		|	Mr.		|	Andrew		|	Lopez		|	Male	| Oct 20, 1991  |	1234 Main St	|	Tulsa	|	Oklahoma	|	12345		|	Cell		|	987-654-3210		|	abc@abc.com		|	Driver's Licence	|	DMV1234	|	DMV					|	Texas		|	07/06/2016		|	07/05/2022		|	ABC LLC		|	Tester		|	50,000	|	RBS				|	Tulsa - Yale	|					
	

	