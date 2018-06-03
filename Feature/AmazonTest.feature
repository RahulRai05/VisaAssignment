Feature: AmazonLogin and Product Search

@positiveLogin
Scenario Outline:Open Amazon Home Page and Sign In by Providing Correct User ID and Password
	Given opens Amazon Home Page "<url>" in "<browser>"
	When Sign In and Account List Link is Clicked 
	And Login_Id is Entered
	|rahulrai0501@gmail.com|
	And Continue Button is CLicked
	And Password is Entered
	|123456|
	And Sign In Button is CLicked
	Then verify the Login Success message "Hello, Rahul"
Examples:
	| url 					  | browser |
	| https://www.amazon.com/ | CH      |
#	| https://www.amazon.com/ | IE      |
#	| https://www.amazon.com/ | FF      |

@negativeLogin
Scenario Outline:Open Amazon Home Page and Sign In by Providing Incorrect User ID
	Given opens Amazon Home Page "<url>" in "<browser>"
	When Sign In and Account List Link is Clicked 
	And Login_Id is Entered
	|xysgh@abc.com|
	And Continue Button is CLicked
	Then verify the Login Failure message "We cannot find an account with that email address"
Examples:
	| url 					  | browser |
#	| https://www.amazon.com/ | CH      | 
#	| https://www.amazon.com/ | IE      | 
#	| https://www.amazon.com/ | FF      | 


@negativeLogin
Scenario Outline:Open Amazon Home Page and Sign In by Providing correct User ID and Incorrect Password
	Given opens Amazon Home Page "<url>" in "<browser>"
	When Sign In and Account List Link is Clicked 
	And Login_Id is Entered
	|rahulrai0501@gmail.com|
	And Continue Button is CLicked
	And Password is Entered
	|123444456|
	And Sign In Button is CLicked
	Then verify the Login Failure message "Your password is incorrect"
Examples:
	| url 					  | browser |
#	| https://www.amazon.com/ | CH      | 
#	| https://www.amazon.com/ | IE      | 
#	| https://www.amazon.com/ | FF      | 


@AddToCart
Scenario Outline:Search Product and Verify Name and Price of First Listed Product
	Given Product name "iphone x 64 gb" is Provided
	When Search Button is Clicked 
	And Select 1st Product in the search result
	Then verify Product_Name and Price
	|Apple iPhone X, GSM Unlocked 5.8", 64 GB - Space Gray|
	|$1,129.00|
	And Successful Add to Cart "Added to Cart"
	And Verify Product Name and Price in Cart
	|Apple iPhone X, GSM Unlocked 5.8", 64 GB - Space Gray|
	|$1,129.00|
	
@Logout
Scenario Outline:Logout of www.amazon.com
  Given Already Logged In as "Hello, Rahul"
  When Sign Out Button Is clicked
  Then Logout Successfully
  
@ReverifyCart 
Scenario Outline:Logout and Relogin in www.amazon.com and verifying name and price of Product added earlier
  Given Already Logged In as "Hello, Rahul"
  When Go to cart after Re-Login
  Then Verify Product Name and Price in Cart
  |Apple iPhone X, GSM Unlocked 5.8", 64 GB - Space Gray|
  |$1,129.00|
