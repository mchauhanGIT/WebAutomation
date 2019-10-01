package stepDefinations;

import com.cucumber.listener.Reporter;

import cucumber.api.java.en.Then;
import net.prodigylabs.config.ObjectRepository;
import net.prodigylabs.handlers.VerificationHandler;


public class CustomerSearch_Steps {
	
	private VASTBaseTest vastbasetest;
	private Login_Steps loginsteps;
	
	public CustomerSearch_Steps(VASTBaseTest vastbasetest, Login_Steps loginsteps) {
		this.vastbasetest=vastbasetest;
		this.loginsteps=loginsteps;
	}
	
	@Then("^user record with \"([^\"]*)\" \"([^\"]*)\" is retrieved$")
	public void user_record_with_is_retrieved(String arg1, String arg2) throws Throwable {
		vastbasetest.webelementHandler.setDriverWait(ObjectRepository.getobjectLocator(arg1));
		VerificationHandler.verifyTrue(vastbasetest.webelementHandler.getText(ObjectRepository.getobjectLocator(arg1)).contains(arg2));
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}

	@Then("^user gets message as \"([^\"]*)\" on top of the page$")
	public void user_gets_message_as_on_top_of_the_page(String arg1) throws Throwable {
		vastbasetest.webelementHandler.setDriverWait(ObjectRepository.getobjectLocator("NoCustomersavailable_message"));
	    VerificationHandler.verifyTrue(vastbasetest.webelementHandler.getText(ObjectRepository.getobjectLocator("NoCustomersavailable_message")).contains(arg1));
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}
	
}
