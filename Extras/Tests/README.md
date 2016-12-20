# Linear_Regression Workflow Tests



These tests were run at 2016-12-19 18:01:37



| id|name                     |status   |time           |message                   |
|--:|:------------------------|:--------|:--------------|:-------------------------|
|  1|BasicTest                |&#9989;  |12.486 seconds |6 warnings                |
|  2|CVRegularizationTest1    |&#x274C; |11.404 seconds |18 errors and 18 warnings |
|  3|LinearTest1              |&#9989;  |8.484 seconds  |3 warnings                |
|  4|LinearTest2              |&#9989;  |9.568 seconds  |5 warnings                |
|  5|LinearTest3              |&#9989;  |9.349 seconds  |5 warnings                |
|  6|LinearTestAll            |&#9989;  |19.399 seconds |5 warnings                |
|  7|LinearWithCVTest         |&#9989;  |7.072 seconds  |5 warnings                |
|  8|LinearWithCVTest2        |&#9989;  |7.706 seconds  |5 warnings                |
|  9|LinearWithCVTest3        |&#9989;  |7.097 seconds  |5 warnings                |
| 10|RegularizationTest1      |&#9989;  |11.027 seconds |3 warnings                |
| 11|RegularizationTest2      |&#9989;  |10.980 seconds |3 warnings                |
| 12|RegularizationTest3      |&#9989;  |11.131 seconds |3 warnings                |
| 13|RegularizationTest4      |&#9989;  |8.779 seconds  |2 warnings                |
| 14|RegularizationTest5      |&#9989;  |8.648 seconds  |3 warnings                |
| 15|RegularizationTest6      |&#9989;  |11.135 seconds |2 warnings                |
| 16|TestScoreTool            |&#9989;  |17.948 seconds |7 warnings                |
| 17|TestScoreTool2           |&#9989;  |9.122 seconds  |3 warnings                |
| 18|WeightedLinearWithCVTest |&#9989;  |9.523 seconds  |5 warnings                |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
