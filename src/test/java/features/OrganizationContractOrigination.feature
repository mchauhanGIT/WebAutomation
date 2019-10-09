#Author: vaishali.katta@prodigylabs.net
#Keywords Summary : VAST Automation 
#Feature: Contract Origination
#Scenario: #NA
Feature: Organization Contract Origination 
Background:
    Given User launches the Vast application "http://vnbaxmqaapp.vnb.internal:8080/bpc/"
    And user enters text "adeep" in textbox "Username"
    And user enters text "test" in textbox "Password"
	And user clicks on button "Environment"
	And user clicks on button "VAST_Jack_Henry_QAT"
    And user clicks on button "Login"
    And user waits for "5" seconds
    And user is on "Dashboard_page"    
 	
@Smoke @Regression	 @TC008
Scenario Outline: Validate the user is able to apply for Money Market Product for Commercial account by adding relationship as Officer and requesting card for him
	Given user is on "Dashboard_page" 
	And user clicks on button "Contract"
	And user clicks on button "Origination"
	And user waits for "4" seconds
	And user enters text "<Customer number>" in textbox "Customer_number" using javascript
	And user clicks on button "Search_Customer"
	And user waits for "4" seconds
    And user validates "Client_data" with expected value "<Customer number>" 
    And user selects "<Product type>" from "Product_type" dropdown
	And user selects "<Sub Product type>" from "Product_card"
	And user clicks on button "Next"
    And user waits for "4" seconds
    And user is on "Account_origination_make_decission_new_process"
    And user clicks on button "Next"
    And user waits for "4" seconds
    And user is on "Account_origination_Account_details"
    And user enters text "<Opening amount>" in textbox "Opening_amount"
    And user selects "<Account ownership>" from "Account_ownership" dropdown
    And user selects "<Opened by (Officer ID)>" from "Opened_by_Officer_ID" dropdown
  	And user selects "<Branch>" from "*Branch" dropdown
    And user enters text "<Resolution date>" in textbox "Resolution_date"    
    And user clicks on button "Next"
    And user waits for "4" seconds
    And user is on "Account_origination_Relationships" 
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
	And Verify "<Customer>" is available in "Customer_Number_Column"
	And Verify "<Type of Relationship>" is available in "Type_Of_Relationship_Column"
	And Verify "<Percentage>" is available in "Percentage_Column"
	And user clicks on button "Next"
    And user waits for "3" seconds    
	And user is on "Account_origination_Card_Origination"  
	And user clicks on button "Does_the_customer_want_to_have_a_card_YES"
	And user waits for page to load	
	And user clicks on button "Issue_debit_cards_to_dropdown"
	And user selects "<Secondary Customer Name>" from "Issue_debit_cards_to_list"	
    And user selects "<Account status ATM & POS>" from "Account_status_ATM_&_POS" dropdown
	And user validates "Account_designation_value" with expected value "<Account designation>"	
	And user clicks on button "Next"
	And user waits for page to load
    And user is on "Account_origination_E-statement"  
    And user clicks on button "Does_the_customer_want_an_e-statement_YES"
	And user clicks on button "Next"
    And user is on "Account_origination_Mobile_Deposit"  
    And user clicks on button "Does_the_customer_want_to_setup_mobile_deposit_YES"
	And user clicks on button "Next"
    And user is on "Account_origination_Online_Banking" 
	And user clicks on button "Does_the_customer_want_to_access_online_banking_YES"
	And user clicks on button "Next"
    And user is on "Account_origination_Confirmation"   
    And user validates text "Contracted_Product_On_Confirmation_Screen" with expected value "<Sub Product type>" 
   # And user validates that "Account_Number_On_Confirmation_Screen" is displayed
    And user validates text "Interest_Rate" with expected value "<Interest Rate>" 
    And user validates text "APY" with expected value "<APY>" 
    And user clicks on button "Confirm"
    And user waits for "30" seconds
	And user waits for page to load
    And user is on "Account_origination_Signature"  
   # And user clicks on button "Printed_Signed"   Commenting as this piece is under development
   # And user clicks on button "Submit"

    Examples: 
	| Customer number |	Product type |	Sub Product type |	Opening amount	|	Account ownership	|  Opened by (Officer ID) |	Branch			| Resolution date |	Type of Relationship	| Customer | Percentage | Secondary Customer Name  | Account status ATM & POS    				|Account designation  | Interest Rate | APY   | 	
	| 114467611		  |	Money Market |	Money Market     |	20000			|	Commercial			|	VNB 				  |	Collinsville	| Oct 1, 2019     |	Officer			    	| 444444444| 40         | Test Person 			   | Open money market deposit; Restricted POS  | Business  		  |  0.25%		  | 0.25% |


@TC009
Scenario Outline: Validate the user is able to apply for Business Savings Product for Trust account by adding relationship as Officer and requesting card for him
	Given user is on "Dashboard_page" 
	And user clicks on button "Contract"
	And user clicks on button "Origination"
	And user waits for "4" seconds
	And user enters text "<Customer number>" in textbox "Customer_number" using javascript
	And user clicks on button "Search_Customer"
	And user waits for "4" seconds
    And user validates "Client_data" with expected value "<Customer number>"
    And user selects "<Product type>" from "Product_type" dropdown
	And user selects "<Sub Product type>" from "Product_card"
	And user clicks on button "Next"
    And user waits for "4" seconds
    And user is on "Account_origination_make_decission_new_process"
    And user clicks on button "Next"
    And user waits for "4" seconds
    And user is on "Account_origination_Account_details"
    And user enters text "<Opening amount>" in textbox "Opening_amount"
    And user selects "<Account ownership>" from "Account_ownership" dropdown
    And user selects "<Trust account>" from "Trust_account" dropdown
    And user selects "<Opened by (Officer ID)>" from "Opened_by_Officer_ID" dropdown
    And user selects "<Branch>" from "*Branch" dropdown
    And user enters text "<Resolution date>" in textbox "Resolution_date"    
    And user clicks on button "Next"
    And user waits for "4" seconds
    And user is on "Account_origination_Relationships" 
    And user validates text "Contracted_Product" with expected value "<Sub Product type>"
    And user validates that "Account_Number" is displayed
    And user clicks on button "Add_Relationships"
    And user selects "<Type of Relationship>" from "Type_of_Relationship" dropdown
    And user enters text "<Customer>" in textbox "*Customer"
    And user clicks on button "Save_Relation"
   	And user enters text "<Percentage>" in textbox "Percentage"
    And user waits for page to load
	And user clicks on button "Save_Relation"
	And user waits for page to load
	And Verify "<Customer>" is available in "Customer_Number_Column"
	And Verify "<Type of Relationship>" is available in "Type_Of_Relationship_Column"
	And Verify "<Percentage>" is available in "Percentage_Column"
	And user clicks on button "Next"
    And user waits for "3" seconds    
	And user is on "Account_origination_Card_Origination"  
	And user clicks on button "Does_the_customer_want_to_have_a_card_YES"
	And user waits for page to load	
	And user clicks on button "Issue_debit_cards_to_dropdown"
	And user selects "<Secondary Customer Name>" from "Issue_debit_cards_to_list"
	And user selects "<Account status ATM & POS>" from "Account_status_ATM_&_POS" dropdown
	And user validates "Account_designation_value" with expected value "<Account designation>"	
	And user clicks on button "Next"
	And user waits for page to load
    And user is on "Account_origination_E-statement"  
    And user clicks on button "Does_the_customer_want_an_e-statement_YES"
	And user clicks on button "Next"
    And user is on "Account_origination_Mobile_Deposit"  
    And user clicks on button "Does_the_customer_want_to_setup_mobile_deposit_YES"
	And user clicks on button "Next"
    And user is on "Account_origination_Online_Banking" 
	And user clicks on button "Does_the_customer_want_to_access_online_banking_YES"
	And user clicks on button "Next"
    And user is on "Account_origination_Confirmation"   
    And user validates text "Contracted_Product_On_Confirmation_Screen" with expected value "<Sub Product type>" 
   # And user validates that "Account_Number_On_Confirmation_Screen" is displayed           defect
    And user validates text "Interest_Rate" with expected value "<Interest Rate>" 
    And user validates text "APY" with expected value "<APY>" 
    And user clicks on button "Confirm"
    And user waits for "30" seconds
	And user waits for page to load
    And user is on "Account_origination_Signature"  
  #  And user clicks on button "Printed_Signed"  Commenting as this piece is under development
  #  And user clicks on button "Submit"

    Examples: 
	| Customer number |	Product type |	Sub Product type |	Opening amount	|	Account ownership	| Trust account   |  Opened by (Officer ID) |	Branch			| Resolution date |	Type of Relationship	| Customer | Percentage | Secondary Customer Name  | Account status ATM & POS    				|Account designation  | Interest Rate | APY   | 	
	| 114464611		  |	Savings      |	Business Savings |	23450			|	Trust				| Mortgage Escrow |	   VNB 				    |	Ketchum			| Oct 1, 2019     |	Officer			    	| 444444444| 40         | Test Person 			   | Open money market deposit; Restricted POS  | Business  		  |  0.25%		  | 0.25% |
