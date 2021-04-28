## for saucedemo
# urls
BASE_URL_SAUCEDEMO = 'https://www.saucedemo.com'.freeze
PRODUCTS_PAGE = "#{BASE_URL_SAUCEDEMO}/inventory.html".freeze

# user data
INVALID_NAME = 'Username'.freeze
INVALID_PASSWORD = 'Password'.freeze
VALID_NAME = 'standard_user'.freeze
VALID_PASSWORD = 'secret_sauce'.freeze
LOCKED_OUT_USER_NAME = 'locked_out_user'.freeze

# error messages
ERROR = 'Epic sadface: Username and password do not match any user in this service'.freeze
ERROR_USERNAME = 'Epic sadface: Username is required'.freeze
ERROR_PASSWORD = 'Epic sadface: Password is required'.freeze
ERROR_FOR_LOCKED_USER = 'Epic sadface: Sorry, this user has been locked out.'.freeze
DENIED_ACCESS = "Epic sadface: You can only access '/inventory.html' when you are logged in.".freeze

# social media data
TWITTER_URL = 'https://twitter.com/saucelabs'.freeze
FACEBOOK_URL = 'https://www.facebook.com/saucelabs'.freeze
LINKEDIN_URL = 'https://www.linkedin.com/company/sauce-labs/'.freeze
ABOUT_URL = 'https://saucelabs.com/'.freeze

# order data
FIRST_NAME = 'First Name'.freeze
LAST_NAME = 'Last Name'.freeze
POSTAL_CODE = 'Postal Code'.freeze
SHIPPING_INFORMATION = 'FREE PONY EXPRESS DELIVERY!'.freeze
COMPLETE_HEADER = 'THANK YOU FOR YOUR ORDER'.freeze
COMPLETE_TEXT = 'Your order has been dispatched, and will arrive just as fast as the pony can get there!'.freeze
COMPLETE_IMG_URL = 'https://www.saucedemo.com/static/media/pony-express.46394a5d.png'.freeze

## for selenium
# urls
BASE_URL_SELENIUM = 'https://www.seleniumeasy.com/test'.freeze

# input forms urls
SIMPLE_FORM_DEMO = "#{BASE_URL_SELENIUM}/basic-first-form-demo.html".freeze
CHECKBOX_DEMO = "#{BASE_URL_SELENIUM}/basic-checkbox-demo.html".freeze
RADIO_BUTTONS_DEMO = "#{BASE_URL_SELENIUM}/basic-radiobutton-demo.html".freeze
SELECT_DROPDOWN_DEMO = "#{BASE_URL_SELENIUM}/basic-select-dropdown-demo.html".freeze
INPUT_FORM_SUBMIT = "#{BASE_URL_SELENIUM}/input-form-demo.html".freeze
AJAX_FORM_SUBMIT = "#{BASE_URL_SELENIUM}/ajax-form-submit-demo.html".freeze
JQUERY_SELECT_DROPDOWN = "#{BASE_URL_SELENIUM}/jquery-dropdown-search-demo.html".freeze

# checkbox demo
STATUS_OF_SINGLE_CHECKBOX = 'Success - Check box is checked'.freeze

# input form
BASE_EMPTY_MESSAGE = 'Please supply'.freeze
EMPTY_FIRST_NAME = "#{BASE_EMPTY_MESSAGE} your first name".freeze
EMPTY_LAST_NAME = "#{BASE_EMPTY_MESSAGE} your last name".freeze
EMPTY_EMAIL_ADDRESS = "#{BASE_EMPTY_MESSAGE} your email address".freeze
EMPTY_PHONE_NUMBER = "#{BASE_EMPTY_MESSAGE} your phone number".freeze
EMPTY_STREET_ADDRESS = "#{BASE_EMPTY_MESSAGE} your street address".freeze
EMPTY_CITY = "#{BASE_EMPTY_MESSAGE} your city".freeze
EMPTY_STATE = 'Please select your state'.freeze
EMPTY_ZIP_CODE = "#{BASE_EMPTY_MESSAGE} your zip code".freeze
EMPTY_DESCRIPTION = "#{BASE_EMPTY_MESSAGE} a description of your project".freeze
EMPTY_LIST = [EMPTY_FIRST_NAME,
              EMPTY_LAST_NAME,
              EMPTY_EMAIL_ADDRESS,
              EMPTY_PHONE_NUMBER,
              EMPTY_STREET_ADDRESS,
              EMPTY_CITY,
              EMPTY_STATE,
              EMPTY_ZIP_CODE,
              EMPTY_DESCRIPTION].freeze
INVALID_VALUE = '1'.freeze
INVALID_FIRST_NAME_MSG = 'Please enter more than 2 characters'.freeze
INVALID_EMAIL_MSG = 'Please supply a valid email address'.freeze
INVALID_PHONE_MSG = 'Please supply a vaild phone number with area code'.freeze
INVALID_ADDRESS_MSG = 'Please enter more than 8 characters'.freeze
INVALID_CITY_MSG = 'Please enter more than 4 characters'.freeze
INVALID_ZIP_CODE_MSG = 'Please supply a vaild zip code'.freeze
INVALID_DESCRIPTION_MSG = 'Please enter at least 10 characters and no more than 200'.freeze
INVALID_LIST = [INVALID_FIRST_NAME_MSG,
                INVALID_FIRST_NAME_MSG,
                INVALID_EMAIL_MSG,
                INVALID_PHONE_MSG,
                INVALID_ADDRESS_MSG,
                INVALID_CITY_MSG,
                INVALID_ZIP_CODE_MSG,
                INVALID_DESCRIPTION_MSG].freeze
VALID_FIRST_NAME = 'FirstName'.freeze
VALID_LAST_NAME = 'LastName'.freeze
VALID_EMAIL = 'test@test.com'.freeze
VALID_PHONE = '(111)111-1111'.freeze
VALID_ADDRESS = 'Address form'.freeze
VALID_CITY = 'Minsk'.freeze
VALID_ZIP_CODE = '1111'.freeze
VALID_DESCRIPTION = 'testtesttest'.freeze
VALID_STATE = 'Alabama'.freeze

# ajax form
PROCCESING_MSG = 'Ajax Request is Processing!'.freeze
SUCCESS_MSG = 'Form submited Successfully!'.freeze

## jquery form
# single dropdown box with search field
NO_RESULT_FOUND = 'No results found'.freeze
