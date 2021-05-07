### for saucedemo
# urls
BASE_URL_SAUCEDEMO = 'https://www.saucedemo.com'
PRODUCTS_PAGE = "#{BASE_URL_SAUCEDEMO}/inventory.html"

# user data
INVALID_NAME = Faker::Internet.username
INVALID_PASSWORD = Faker::Internet.password
VALID_NAME = 'standard_user'
VALID_PASSWORD = 'secret_sauce'
LOCKED_OUT_USER_NAME = 'locked_out_user'

# error messages
ERROR = 'Epic sadface: Username and password do not match any user in this service'
ERROR_USERNAME = 'Epic sadface: Username is required'
ERROR_PASSWORD = 'Epic sadface: Password is required'
ERROR_FOR_LOCKED_USER = 'Epic sadface: Sorry, this user has been locked out.'
DENIED_ACCESS = "Epic sadface: You can only access '/inventory.html' when you are logged in."

# social media data
TWITTER_URL = 'https://twitter.com/saucelabs'
FACEBOOK_URL = 'https://www.facebook.com/saucelabs'
LINKEDIN_URL = 'https://www.linkedin.com/company/sauce-labs/'
ABOUT_URL = 'https://saucelabs.com/'

# order data
FIRST_NAME = Faker::Name.first_name
LAST_NAME = Faker::Name.last_name
POSTAL_CODE = Faker::Address.zip_code
SHIPPING_INFORMATION = 'FREE PONY EXPRESS DELIVERY!'
COMPLETE_HEADER = 'THANK YOU FOR YOUR ORDER'
COMPLETE_TEXT = 'Your order has been dispatched, and will arrive just as fast as the pony can get there!'
COMPLETE_IMG_URL = 'https://www.saucedemo.com/static/media/pony-express.46394a5d.png'

### for selenium
# urls
BASE_URL_SELENIUM = 'https://www.seleniumeasy.com/test'

## input forms urls
SIMPLE_FORM_DEMO = "#{BASE_URL_SELENIUM}/basic-first-form-demo.html"
CHECKBOX_DEMO = "#{BASE_URL_SELENIUM}/basic-checkbox-demo.html"
RADIO_BUTTONS_DEMO = "#{BASE_URL_SELENIUM}/basic-radiobutton-demo.html"
SELECT_DROPDOWN_DEMO = "#{BASE_URL_SELENIUM}/basic-select-dropdown-demo.html"
INPUT_FORM_SUBMIT = "#{BASE_URL_SELENIUM}/input-form-demo.html"
AJAX_FORM_SUBMIT = "#{BASE_URL_SELENIUM}/ajax-form-submit-demo.html"
JQUERY_SELECT_DROPDOWN = "#{BASE_URL_SELENIUM}/jquery-dropdown-search-demo.html"

## bootstrap date pickers
BOOTSTRAP_DATE_PICKERS = "#{BASE_URL_SELENIUM}/bootstrap-date-picker-demo.html"
JQUERY_DATE_PICKERS = "#{BASE_URL_SELENIUM}/jquery-date-picker-demo.html"

## table
TABLE_PAGINATION = "#{BASE_URL_SELENIUM}/table-pagination-demo.html"
TABLE_WITH_SEARCH_AND_FILTER = "#{BASE_URL_SELENIUM}/table-search-filter-demo.html"

# checkbox demo
STATUS_OF_SINGLE_CHECKBOX = 'Success - Check box is checked'

# input form
BASE_EMPTY_MESSAGE = 'Please supply'
EMPTY_FIRST_NAME = "#{BASE_EMPTY_MESSAGE} your first name"
EMPTY_LAST_NAME = "#{BASE_EMPTY_MESSAGE} your last name"
EMPTY_EMAIL_ADDRESS = "#{BASE_EMPTY_MESSAGE} your email address"
EMPTY_PHONE_NUMBER = "#{BASE_EMPTY_MESSAGE} your phone number"
EMPTY_STREET_ADDRESS = "#{BASE_EMPTY_MESSAGE} your street address"
EMPTY_CITY = "#{BASE_EMPTY_MESSAGE} your city"
EMPTY_STATE = 'Please select your state'
EMPTY_ZIP_CODE = "#{BASE_EMPTY_MESSAGE} your zip code"
EMPTY_DESCRIPTION = "#{BASE_EMPTY_MESSAGE} a description of your project"
EMPTY_LIST = [EMPTY_FIRST_NAME,
              EMPTY_LAST_NAME,
              EMPTY_EMAIL_ADDRESS,
              EMPTY_PHONE_NUMBER,
              EMPTY_STREET_ADDRESS,
              EMPTY_CITY,
              EMPTY_STATE,
              EMPTY_ZIP_CODE,
              EMPTY_DESCRIPTION]
INVALID_FIRST_NAME_MSG = 'Please enter more than 2 characters'
INVALID_EMAIL_MSG = 'Please supply a valid email address'
INVALID_PHONE_MSG = 'Please supply a vaild phone number with area code'
INVALID_ADDRESS_MSG = 'Please enter more than 8 characters'
INVALID_CITY_MSG = 'Please enter more than 4 characters'
INVALID_ZIP_CODE_MSG = 'Please supply a vaild zip code'
INVALID_DESCRIPTION_MSG = 'Please enter at least 10 characters and no more than 200'
INVALID_LIST = [INVALID_FIRST_NAME_MSG,
                INVALID_FIRST_NAME_MSG,
                INVALID_EMAIL_MSG,
                INVALID_PHONE_MSG,
                INVALID_ADDRESS_MSG,
                INVALID_CITY_MSG,
                INVALID_ZIP_CODE_MSG,
                INVALID_DESCRIPTION_MSG]
VALID_STATE = 'Alabama'
EMAIL = Faker::Internet.email
PHONE = Faker::PhoneNumber.cell_phone
ADDRESS = Faker::Address.full_address
CITY = Faker::Address.city
COMMENT = Faker::Alphanumeric.alpha(number: 20)
# ajax form
PROCCESING_MSG = 'Ajax Request is Processing!'
SUCCESS_MSG = 'Form submited Successfully!'

## jquery form
# single dropdown box with search field
NO_RESULT_FOUND = 'No results found'

## bootstrap date pickers
# date example
MONDAY = "Mo"
# date range
SUNDAY = "Su"

