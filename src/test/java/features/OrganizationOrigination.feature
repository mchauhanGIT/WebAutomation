#Author: vaishali.katta@prodigylabs.net
#Keywords Summary : VAST Automation 
#Feature: Organization Origination
#Scenario: #NA
Feature: Organization Origination 
Background:
    Given User launches the application "http://vnbaxmqaapp.vnb.internal:8080/bpc/"
    And user enters text "adeep" in textbox "Username"
    And user enters text "test" in textbox "Password"
	And user clicks on button "Environment"
	And user clicks on button "VAST_Jack_Henry_QAT"
    And user clicks on button "Login"
    And user waits for "5" seconds
    And user validates that "Dashboard_page" is displayed 
 	
@Smoke @Regression	 @TC007
Scenario Outline: Validate the user is able to create new record for organization when customer isn't' available in VAST
	Given user validates that "Dashboard_page" is displayed 
	And user clicks on button "Customer"
	And user clicks on button "Organization_Origination"
	And user enters text "<TIN (SSN/EIN)>" in textbox "TIN_SSN_EIN"
	And user clicks on button "Search"
	And user waits for page to load
	And user clicks on button "Create_Organization"	
	And user waits for "4" seconds
	And user enters text "<Entity name>" in textbox "Entity_name"
	And user selects "<Organization type>" from "Organization_type" dropdown
	And user selects "<Registered state>" from "Registered_state" dropdown
	And user enters text "<Street address>" in textbox "Street_address"
	And user enters text "<City>" in textbox "City"
	And user selects "<State>" from "State" dropdown
	And user enters text "<Zip code>" in textbox "Zip_code"	
	And user clicks on button "Add_Phone_number"	
	And user selects "<Phone type>" from "Phone_type" dropdown
	And user enters text "<Phone number>" in textbox "Phone_number" using javascript
	And user clicks on button "Save_Phone_Number"
	And user validates "Phone_type_column" with expected value "<Phone type>"
	And user validates "Phone_Number_column" with expected value "<Phone number>"
	And user clicks on button "Add_Email_address"
	And user enters text "<Email address>" in textbox "Email_address"
	And user clicks on button "Save_Email_address"
	And user validates "Email_address_column" with expected value "<Email address>"
	And user selects "<ID type>" from "ID_type" dropdown
	And user enters text "<Number>" in textbox "Number"	
	And user enters text "<Issuing authority>" in textbox "Issuing_authority"
	And user selects "<ID state>" from "ID_State" dropdown
	And user enters text "<Issuance date>" in textbox "Issuance_date"	
	And user enters text "<Expiration date>" in textbox "Expiration_date"	
	And user selects "<Officer code>" from "Officer_code" dropdown
	And user selects "<Branch>" from "Branch" dropdown
	And user clicks on button "Next"
	And user validates that "Capture_relationships_screen" is displayed 
	And user clicks on button "Add_Relationships"
	And user selects "<Relation type>" from "Relation_type" dropdown
	And user enters text "<Customer>" in textbox "*Customer"
	And user clicks on button "Save_Relation"
	And user clicks on button "Save_Relation"
	And user clicks on button "Next"
	And user validates that "Show_check_results_screen" is displayed 
	And user clicks on button "Next"	
	And user validates that "Add_customer_screen" is displayed 
	And user clicks on button "Confirm"
	And user validates that "Display_customer_screen" is displayed 
	And user validates text "actual_customer_no" with expected value "<TIN (SSN/EIN)>"
	And user validates text "actual_name" with expected value "<Entity name>"
	And user validates text "actual_Email_address" with expected value "<Email address>"
	And user validates text "actual_address" with expected value "<Address>"
	And user clicks on button "Exit"

    Examples: 
	|	TIN (SSN/EIN)	|	Entity name	|	Organization type	|	Registered state |	Street address	|	City	|	State		|	Zip code	|	Phone type	|	Phone number	|	Email address	|	ID type						|	Number	|	Issuing authority	|	ID state	|	Issuance date	|	Expiration date	|	Officer code	|	Branch	     | Relation type | Customer  | Address                       |
	|	427591443		|	VAST Entity	|	Corporation			|	Oklahoma 		 |	1234 Main St	|	Tulsa	|	Oklahoma	|	12345		|	Cell		|	987-654-3210	|	abc@abc.com		|	Articles of Incorporation	|	DMV1234	|	DMV					|	Texas		|	Jun 07, 2016	|	Jun 05, 2022	|	RBS             |	Tulsa - Yale | Trustee       | 444444444 | 1234 Main St, Tulsa, OK 12345 |	
	

	