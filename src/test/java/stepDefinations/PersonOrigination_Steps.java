package stepDefinations;

import com.cucumber.listener.Reporter;

import cucumber.api.java.en.Given;
import net.prodigylabs.config.ObjectRepository;

public class PersonOrigination_Steps {
	
	private VASTBaseTest vastbasetest;
	private Login_Steps loginsteps;
	
	public PersonOrigination_Steps(VASTBaseTest vastbasetest, Login_Steps loginsteps) {
		this.vastbasetest=vastbasetest;
		this.loginsteps=loginsteps;
	}

	@Given("^user selects \"([^\"]*)\" from \"([^\"]*)\"$")
	public void user_selects_from(String arg1, String arg2) throws Throwable {
		vastbasetest.webelementHandler.clickElementByText(ObjectRepository.getobjectLocator(arg2), arg1);
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}
	
	@Given("^user enters text \"([^\"]*)\" in textbox \"([^\"]*)\" using javascript$")
	public void user_enters_text_in_textbox_using_javascript(String arg1, String arg2) throws Throwable {
		vastbasetest.webelementHandler.enterTextUsingJavascript(ObjectRepository.getobjectLocator(arg2), arg1);
	}

	@Given("^user clicks on button \"([^\"]*)\" to add phone number$")
	public void user_clicks_on_button_to_add_phone_number(String arg1) throws Throwable {

	}

	@Given("^user clicks on button \"([^\"]*)\" to add email address$")
	public void user_clicks_on_button_to_add_email_address(String arg1) throws Throwable {

	}

	@Given("^user reaches on ID Verification screen$")
	public void user_reaches_on_ID_Verification_screen() throws Throwable {

	}

	@Given("^user reaches on confirmation screen$")
	public void user_reaches_on_confirmation_screen() throws Throwable {

	}


}
