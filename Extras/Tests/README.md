# Linear_Regression Workflow Tests



These tests were run at 2016-11-15 19:50:35



| id|name          |status   |time           |message               |
|--:|:-------------|:--------|:--------------|:---------------------|
|  1|BasicTest     |&#9989;  |9.263 seconds  |5 warnings            |
|  2|BasicXDFTest  |&#x274C; |0.100 seconds  |1 error and 1 warning |
|  3|LinearTest1   |&#9989;  |5.227 seconds  |2 warnings            |
|  4|LinearTest2   |&#9989;  |4.770 seconds  |4 warnings            |
|  5|LinearTest3   |&#9989;  |5.065 seconds  |4 warnings            |
|  6|LinearTestAll |&#9989;  |11.138 seconds |6 warnings            |
|  7|TestScoreTool |&#9989;  |9.911 seconds  |4 warnings            |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
