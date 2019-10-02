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

	@Then("^user gets message as \"([^\"]*)\" on top of the page$")
	public void user_gets_message_as_on_top_of_the_page(String arg1) throws Throwable {
		vastbasetest.webelementHandler.setDriverWait(ObjectRepository.getobjectLocator("NoCustomersavailable_message"));
	    VerificationHandler.verifyTrue(vastbasetest.webelementHandler.getText(ObjectRepository.getobjectLocator("NoCustomersavailable_message")).contains(arg1));
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}
	
	
	@Then("^Verify \"([^\"]*)\" is available in \"([^\"]*)\"$")
	public void verify_is_available_in(String arg1, String arg2) throws Throwable {
		vastbasetest.webelementHandler.setDriverWait(ObjectRepository.getobjectLocator(arg2));
		VerificationHandler.verifyTrue(vastbasetest.webelementHandler.getText(ObjectRepository.getobjectLocator(arg2)).contains(arg1));
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}
	
}
