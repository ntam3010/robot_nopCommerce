## Installing for Window
1.  Install Python
To install python, go to python official site − https://www.python.org/downloads/ and download the latest version or the prior version of python as per your operating system (Windows).
2.  Install packages
*   Go to root folder (nopCommerce)
*   Open Terminal, then run command:
    *   pip install --upgrade -r ./requirements.txt

## Folder structure
1. /browser/
Contains keywords that handle browser window.
2. /keywords/
Contains custom keywords. These custom keywords are combined from many different keywords to handle the certain action.
3. /page_objects/
Contains reusable keywords that are relevant to each pages.
4. /test_data/
Contains data for testing.
5. /testcases/
Contains all test cases.
6. /web_locators/
Contains web elements, grouped by page.


## Test execution on Window
1.   Run all tests:
    `robot <path_to_testcases_folder>`
    `e.g: robot testcases`

2.   Run test file:
    `robot <path_to_test_file>`
    `e.g: robot testcases/login.robot`

3.   Run single testcase:
    `robot -t "<testcase_name>"   <path_to_test_file>`
    `e.g: robot -t "Successfully logged in" testcases/login.robot`