#Author: vaishali.katta@prodigylabs.net
#Keywords Summary : VAST Automation 
#Feature: Contract Origination
#Scenario: #NA
Feature: Person Contract Origination 
Background:
    Given User launches the application "http://vnbaxmqaapp.vnb.internal:8080/bpc/"
    And user enters text "adeep" in textbox "Username"
    And user enters text "test" in textbox "Password"
	And user clicks on button "Environment"
	And user clicks on button "VAST_Jack_Henry_QAT"
    And user clicks on button "Login"
    And user waits for "5" seconds
    And user validates that "Dashboard_page" is displayed   
 	
@Smoke  @Regression @TC007
Scenario Outline: Validate the user is able to apply for Easy Checking Product for Individual account with default values
	Given user validates that "Dashboard_page" is displayed 
	And user clicks on button "Contract"
	And user clicks on button "Origination"
	And user waits for "4" seconds
	And user enters text "<Customer number>" in textbox "Customer_number" using javascript
	And user clicks on button "Search_Customer"
	And user waits for "6" seconds
    And user validates "Client_data" with expected value "<Customer number>"
    And user selects "<Product type>" from "Product_type" dropdown
	And user selects "<Sub Product type>" from "Product_card"
	And user clicks on button "Next"
    And user waits for "4" seconds    
    And user validates that "Account_origination_make_decission_new_process" is displayed 
    And user clicks on button "Next"
    And user waits for "4" seconds    
    And user validates that "Account_origination_Account_details" is displayed 
    And user enters text "<Opening amount>" in textbox "Opening_amount"
    And user selects "<Account ownership>" from "Account_ownership" dropdown
    And user selects "<Opened by (Officer ID)>" from "Opened_by_Officer_ID" dropdown
  	And user selects "<Branch>" from "*Branch" dropdown
    And user clicks on button "Next"
    And user waits for "4" seconds
	And user validates that "Account_origination_Relationships" is displayed 
    And user validates text "Contracted_Product" with expected value "<Sub Product type>"
    And user validates that "Account_Number" is displayed
	And user clicks on button "Next"
	And user waits for page to load
	And user validates that "Account_origination_Checks" is displayed 
	And user waits for page to load	
	And user validates switch "Does_the_customer_require_checks?" with expected value "NO"
	And user clicks on button "Next"
	And user validates that "Account_origination_Card_Origination" is displayed 
    And user validates switch "Does_the_customer_want_to_have_a_card?" with expected value "NO"
	And user clicks on button "Next"
	And user validates that "Account_origination_E-statement" is displayed 
    And user validates switch "Does_the_customer_want_an_e-statement?" with expected value "YES"
	And user clicks on button "Next"
	And user validates that "Account_origination_Mobile_Deposit" is displayed 
    And user validates switch "Does_the_customer_want_to_setup_mobile_deposit?" with expected value "YES"
	And user clicks on button "Next"
	And user validates that "Account_origination_Online_Banking" is displayed 
    And user validates switch "Does_the_customer_want_to_access_online_banking?" with expected value "YES"
	And user clicks on button "Next"	
	And user validates that "Account_origination_Confirmation" is displayed 
    And user validates text "Contracted_Product_On_Confirmation_Screen" with expected value "<Sub Product type>" 
    And user validates that "Account_Number_On_Confirmation_Screen" is displayed
    And user validates text "Interest_Rate" with expected value "<Interest Rate>" 
    And user validates text "APY" with expected value "<APY>" 
    And user clicks on button "Confirm"
    And user waits for "30" seconds
	And user waits for page to load
	And user validates that "Account_origination_Signature" is displayed 
  #  And user clicks on button "Printed_Signed"    Commenting as this piece is under development
  #  And user clicks on button "Submit"

    Examples: 
	| Customer number |	Product type |	Sub Product type |	Opening amount	|	Account ownership	|  Opened by (Officer ID) |	Branch	| Interest Rate | APY   | 	
	| 444985592 	  |	Checking     |	Easy Checking    |	1000			|	Individual			|	 DIR				  |	Bixby	|  0.00%	    | 0.00% |
	
@Smoke @Regression	 @TC008
Scenario Outline: Validate the user is able to apply for Rewards Checking Product for Joint account by adding relationship with another customer and requesting card for both
	Given user validates that "Dashboard_page" is displayed 		
	And user clicks on button "Contract"
	And user clicks on button "Origination"
	And user waits for "4" seconds
	And user enters text "<Customer number>" in textbox "Customer_number" using javascript
	And user clicks on button "Search_Customer"
	And user waits for "6" seconds
    And user validates "Client_data" with expected value "<Customer number>"
    And user selects "<Product type>" from "Product_type" dropdown
	And user selects "<Sub Product type>" from "Product_card"
	And user clicks on button "Next"
    And user waits for "4" seconds
   	And user validates that "Account_origination_make_decission_new_process" is displayed 
    And user clicks on button "Next"
    And user waits for "4" seconds    
    And user validates that "Account_origination_Account_details" is displayed 
    And user enters text "<Opening amount>" in textbox "Opening_amount"
    And user selects "<Account ownership>" from "Account_ownership" dropdown
    And user selects "<Opened by (Officer ID)>" from "Opened_by_Officer_ID" dropdown
  	And user selects "<Branch>" from "*Branch" dropdown
    And user clicks on button "Next"
    And user waits for "4" seconds
	And user validates that "Account_origination_Relationships" is displayed 
    And user validates text "Contracted_Product" with expected value "<Sub Product type>"
    And user validates that "Account_Number" is displayed
    And user clicks on button "Add_Relationships"
    And user selects "<Type of Relationship>" from "Type_of_Relationship" dropdown
    And user enters text "<Customer>" in textbox "*Customer"
    And user clicks on button "Save_Relation"
    And user waits for page to load
    And user enters text "<Percentage>" in textbox "Percentage"
	And user clicks on button "Save_Relation"
	And user waits for page to load
	And Verify "<Customer>" is displayed in "Customer_Number_Column"
	And Verify "<Type of Relationship>" is displayed in "Type_Of_Relationship_Column"
	And Verify "<Percentage>" is displayed in "Percentage_Column"
	And user clicks on button "Next"
    And user waits for "3" seconds
    And user validates that "Account_origination_Checks" is displayed     
    And user selects "YES" for switch "Does_the_customer_require_checks?"
	And user waits for page to load
	And user validates "Address_on_checks_value" with expected value "<Address on checks>"
	And user validates "Shipping_Address" with expected value "<Shipping Address>"
	And user clicks on button "Next"
    And user waits for "3" seconds
    And user validates that "Account_origination_Card_Origination" is displayed 
    And user selects "YES" for switch "Does_the_customer_want_to_have_a_card?"
	And user waits for page to load	
	And user validates "Issue_debit_cards_to" with expected value "<Customer Name>"
	And user clicks on button "Issue_debit_cards_to_dropdown"
	And user selects "<Secondary Customer Name>" from "Issue_debit_cards_to_list"
	And user validates "Account_status_ATM_&_POS_value" with expected value "<Account status ATM & POS>"
	And user validates "Account_designation_value" with expected value "<Account designation>"	
	And user clicks on button "Next"
	And user waits for page to load
	And user validates that "Account_origination_E-statement" is displayed 
	And user selects "NO" for switch "Does_the_customer_want_an_e-statement?"
	And user clicks on button "Next"
	And user validates that "Account_origination_Mobile_Deposit" is displayed 
	And user selects "NO" for switch "Does_the_customer_want_to_setup_mobile_deposit?"
	And user clicks on button "Next"
	And user validates that "Account_origination_Online_Banking" is displayed
	And user selects "NO" for switch "Does_the_customer_want_to_access_online_banking?" 
	And user clicks on button "Next"
	And user validates that "Account_origination_Confirmation" is displayed 
    And user validates text "Contracted_Product_On_Confirmation_Screen" with expected value "<Sub Product type>" 
    And user validates that "Account_Number_On_Confirmation_Screen" is displayed
    And user validates text "Interest_Rate" with expected value "<Interest Rate>" 
    And user validates text "APY" with expected value "<APY>" 
    And user clicks on button "Confirm"
    And user waits for "30" seconds
	And user waits for page to load
	And user validates that "Account_origination_Signature" is displayed 
   # And user clicks on button "Printed_Signed"            Commenting as this piece is under development
   # And user clicks on button "Submit"

    Examples: 
	| Customer number |	Product type |	Sub Product type |	Opening amount	|	Account ownership	|  Opened by (Officer ID) |	Branch	|	Type of Relationship	| Customer | Percentage | Address on checks                 | Shipping Address                 | Customer Name   | Secondary Customer Name | Account status ATM & POS    |Account designation | Interest Rate | APY   | 	
	| 599813966		  |	Checking     |	Rewards Checking |	5000			|	Joint   			|	VNB 				  |	Catoosa	|	Joint Owner		    	| 444444444| 40         | 1186 Sonora Rd, Canton, AL 13116	| 1186 Sonora Rd, Canton, AL 13116 | Lindsey Craft   | Test Person 			   | Primary open ATM; Open POS  | Personal  		  |  2.03%		  | 2.05% |

	
@Smoke @Regression	 @TC011
Scenario Outline: Validate the Person user is able to apply for Safe Deposit Box Product for Joint account and Account Number is NOT generated for it
	Given user validates that "Dashboard_page" is displayed 		
	And user clicks on button "Contract"
	And user clicks on button "Origination"
	And user waits for "4" seconds
	And user enters text "<Customer number>" in textbox "Customer_number" using javascript
	And user clicks on button "Search_Customer"
	And user waits for "6" seconds
    And user validates "Client_data" with expected value "<Customer number>"
    And user selects "<Product type>" from "Product_type" dropdown
	And user selects "<Sub Product type>" from "Product_card"
	And user clicks on button "Next"
    And user waits for "4" seconds
   	And user validates that "Account_origination_make_decission_new_process" is displayed 
    And user clicks on button "Next"
    And user waits for "4" seconds    
    And user validates that "Account_origination_Account_details" is displayed 
    And user enters text "<Box No>" in textbox "Box_No"
    And user selects "<Account ownership>" from "Account_ownership" dropdown    
    And user selects "<Opened by (Officer ID)>" from "Opened_by_Officer_ID" dropdown
    And user selects "<Branch>" from "*Branch_Safe_Deposit_Box" dropdown
    And user clicks on button "Next"
    And user waits for "4" seconds   
	And user validates that "Account_origination_Relationships" is displayed 
    And user validates text "Contracted_Product" with expected value "<Sub Product type>"    
    And user validates that "Account_Number" is NOT displayed
    And user validates that "Box_Number_On_Relationships" is displayed        
    And user clicks on button "Add_Relationships"    
    And user selects "<Type of Relationship>" from "Type_of_Relationship" dropdown
    And user enters text "<Description>" in textbox "Description"
    And user enters text "<Customer>" in textbox "*Customer"
    And user clicks on button "Save_Relation"
    And user waits for page to load
    And user enters text "<Percentage>" in textbox "Percentage"
	And user clicks on button "Save_Relation"
	And user waits for page to load
	And Verify "<Customer>" is displayed in "Customer_Number_Column"
	And Verify "<Type of Relationship>" is displayed in "Type_Of_Relationship_Column"
	And Verify "<Percentage>" is displayed in "Percentage_Column"
	And user clicks on button "Next"
    And user waits for "3" seconds    
    And user validates that "Account_origination_Confirmation" is displayed 
    And user validates text "Contracted_Product_On_Confirmation_Screen" with expected value "<Sub Product type>" 
    And user validates that "Box_Number_On_Confirmation_Screen" is displayed
    And user validates that "Account_Number" is NOT displayed
    And user validates text "Annual_Rent" with expected value "<Annual Rent>" 
 And user clicks on button "Confirm"
    And user waits for "30" seconds
	And user waits for page to load
	And user validates that "Account_origination_Signature" is displayed 
   # And user clicks on button "Printed_Signed"            Commenting as this piece is under development
   # And user clicks on button "Submit"

    Examples: 
	| Customer number |	Product type 	 |	Sub Product type |	Box No	|	Account ownership	|  Opened by (Officer ID) |	Branch	|	Type of Relationship	| Description | Customer | Percentage | Annual Rent | 	
	| 599813966		  |	Safe Deposit Box |	10 X 10			 |	1234	|	Individual 			|	AJH 				  |	Owasso	|	Other			    	| Spouse 	  | 444444444| 40         | $96.00      |
