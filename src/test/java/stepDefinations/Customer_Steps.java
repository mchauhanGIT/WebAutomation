package stepDefinations;

import com.cucumber.listener.Reporter;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import net.prodigylabs.config.ObjectRepository;
import net.prodigylabs.handlers.VerificationHandler;


public class Customer_Steps {
	
	private VASTBaseTest vastbasetest;
	private Login_Steps loginsteps;
	
	public Customer_Steps(VASTBaseTest vastbasetest, Login_Steps loginsteps) {
		this.vastbasetest=vastbasetest;
		this.loginsteps=loginsteps;
	}
	
	@Then("^Verify \"([^\"]*)\" is available in \"([^\"]*)\"$")
	public void verify_is_available_in(String arg1, String arg2) throws Throwable {
		vastbasetest.webelementHandler.setDriverWait(ObjectRepository.getobjectLocator(arg2));
		VerificationHandler.verifyTrue(vastbasetest.webelementHandler.getText(ObjectRepository.getobjectLocator(arg2)).contains(arg1));
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}
	
	@Given("^user selects \"([^\"]*)\" from \"([^\"]*)\" dropdown$")
	public void user_selects_from_dropdown(String value, String dropdown) throws Throwable {
		if (value.equals("Mr.")) {
			System.out.println("here");
		}
		vastbasetest.webelementHandler.clickButton(ObjectRepository.getobjectLocator(dropdown));
		String dropdownList = ObjectRepository.getString(dropdown).replace("//div", "//li").replaceAll("Xpath:", "");
		if (dropdown.equals("Opened_by_Officer_ID") || dropdown.equals("Officer_code")) {
			dropdownList=dropdownList+"//span";
		}
		vastbasetest.webelementHandler.clickElementByText(dropdownList, value);
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));
	}

	@Given("^user enters text \"([^\"]*)\" in textbox \"([^\"]*)\" using javascript$")
	public void user_enters_text_in_textbox_using_javascript(String arg1, String arg2) throws Throwable {
		vastbasetest.webelementHandler.enterTextUsingJavascript(ObjectRepository.getobjectLocator(arg2), arg1);
		Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}
	
	@Given("^user validates text \"([^\"]*)\" with expected value \"([^\"]*)\"$")
	public void user_validates_text_with_expected_value(String arg1, String arg2) throws Throwable {
		VerificationHandler.verifyTrue(vastbasetest.webelementHandler.getText(ObjectRepository.getString(arg1)).contains(arg2));
		Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}

	
}
