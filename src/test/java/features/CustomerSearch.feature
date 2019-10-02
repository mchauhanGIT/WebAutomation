#Author: akash.deep@prodigylabs.net
#ModifiedBy: vaishali.katta@prodigylabs.net
#Keywords Summary : VAST Automation 
#Feature: Customer Search
#Scenario: #NA
Feature: Customer Search 
Background:
    Given User launches the Vast application "http://vnbaxmqaapp.vnb.internal:8080/bpc/"
    And user enters text "adeep" in textbox "Username"
    And user enters text "test" in textbox "Password"
	And user clicks on button "Environment"
	And user clicks on button "VAST_Jack_Henry_QAT"
    And user clicks on button "Login"
    And user waits for page to load
    And user is on "Dashboard_page"  
    
 @Smoke @Regression @TC003
Scenario Outline: Verify that VAST User is able to search existing customer when searched by Customer number
	Given user is on "Dashboard_page" 
		And user clicks on button "Customer"
		And user clicks on button "Search"
		And user enters text "<TIN (SSN/EIN)>" in textbox "TIN_SSN_EIN"
		And user clicks on button "Search"
		And user waits for page to load
		Then Verify "<TIN (SSN/EIN)>" is available in "Customer_no_column"
 
    Examples: 
	| TIN (SSN/EIN) |
	| 411111111 |
	
@Regression @TC004
Scenario Outline: Verify that VAST User gets message when searched customer is not available
	Given user is on "Dashboard_page" 
		And user clicks on button "Customer"
		And user clicks on button "Search"
		And user enters text "<TIN (SSN/EIN)>" in textbox "TIN_SSN_EIN"
		And user clicks on button "Search"
		And user waits for page to load
		Then user validates "No_Customers_available_message" with expected value "<Message>"
 
    Examples: 
	| TIN (SSN/EIN) | Message |
	| 648747849 | No customers available! |
	
 @Smoke @Regression	 @TC005
Scenario Outline: Verify that VAST User is able to search the customer when searched by Customer Full Name 
	Given user is on "Dashboard_page" 
		And user clicks on button "Customer"
		And user clicks on button "Search"
		And user enters text "<Full name>" in textbox "Full_name"
		And user clicks on button "Search"
		And user waits for page to load
		Then Verify "<Full name>" is available in "Full_name_column"

    Examples: 
	|	Full name	|
	|	Vast Tester	|