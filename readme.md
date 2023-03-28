## Installing for Window
1.  Install Python
To install python, go to python official site − https://www.python.org/downloads/ and download the latest version or the prior version of python as per your operating system (Windows).
2.  Setting Path for Window  (*Required Administrator right)
*   Open Search on Window (alternative: press the Window key)
*   Search for "Edit the system environment variables"
*   Open the "Edit the system environment variables" window
*   Under System Variables, find and select the Path variable
*   Click Edit
*   Add path of the directories `/Python/` and `/Python/Scripts/` into the Path variable
*   Save changes
3.  Install packages
*   Go to root folder (robot_nopCommerce)
*   Open Terminal, then run command:
    *   pip install --upgrade -r ./requirements.txt


## Folder structure
1. `/browser/`
Contains keywords that handle browser window.
2. `/keywords/`
Contains custom keywords. These custom keywords are combined from many different keywords to handle the certain action.
3. `/page_objects/`
Contains reusable keywords that are relevant to each pages.
4. `/test_data/`
Contains data for testing.
5. `/testcases/`
Contains all test cases.
6. `/web_locators/`
Contains web elements, grouped by page.
7. `./configuration_data.py`
Contains the initial data used for running the scripts.

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

4.  Run test then storage the output files in a specific directory:
    `robot -d <output_dir> <path_to_test_file>`
    `e.g: robot -d results testcases/login.robot`