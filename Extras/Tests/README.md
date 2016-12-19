# Linear_Regression Workflow Tests



These tests were run at 2016-12-18 18:46:23



| id|name                |status   |time           |message                   |
|--:|:-------------------|:--------|:--------------|:-------------------------|
|  1|BasicTest           |&#9989;  |13.466 seconds |5 warnings                |
|  2|LinearTest1         |&#9989;  |9.432 seconds  |4 warnings                |
|  3|LinearTest2         |&#9989;  |9.280 seconds  |4 warnings                |
|  4|LinearTest3         |&#9989;  |10.366 seconds |4 warnings                |
|  5|LinearTestAll       |&#9989;  |21.239 seconds |6 warnings                |
|  6|LinearWithCVTest    |&#9989;  |7.786 seconds  |4 warnings                |
|  7|LinearWithCVTest2   |&#9989;  |8.462 seconds  |4 warnings                |
|  8|LinearWithCVTest3   |&#9989;  |7.919 seconds  |4 warnings                |
|  9|RegularizationTest1 |&#9989;  |12.703 seconds |4 warnings                |
| 10|RegularizationTest2 |&#9989;  |12.693 seconds |3 warnings                |
| 11|RegularizationTest3 |&#x274C; |12.761 seconds |18 errors and 18 warnings |
| 12|RegularizationTest4 |&#x274C; |10.511 seconds |18 errors and 18 warnings |
| 13|RegularizationTest5 |&#x274C; |10.223 seconds |18 errors and 19 warnings |
| 14|RegularizationTest6 |&#9989;  |11.654 seconds |4 warnings                |
| 15|TestScoreTool       |&#9989;  |18.333 seconds |6 warnings                |
| 16|TestScoreTool2      |&#x274C; |9.489 seconds  |18 errors and 19 warnings |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
