# Linear_Regression Workflow Tests



These tests were run at 2016-12-20 20:10:12



| id|name                     |status  |time           |message    |
|--:|:------------------------|:-------|:--------------|:----------|
|  1|BasicTest                |&#9989; |13.787 seconds |6 warnings |
|  2|CVRegularizationTest1    |&#9989; |12.628 seconds |5 warnings |
|  3|CVRegularizationTest2    |&#9989; |12.478 seconds |5 warnings |
|  4|LinearTest1              |&#9989; |9.243 seconds  |3 warnings |
|  5|LinearTest2              |&#9989; |10.909 seconds |5 warnings |
|  6|LinearTest3              |&#9989; |9.797 seconds  |5 warnings |
|  7|LinearTestAll            |&#9989; |20.759 seconds |5 warnings |
|  8|LinearWithCVTest         |&#9989; |9.331 seconds  |5 warnings |
|  9|LinearWithCVTest2        |&#9989; |8.560 seconds  |5 warnings |
| 10|LinearWithCVTest3        |&#9989; |9.307 seconds  |5 warnings |
| 11|RegularizationTest1      |&#9989; |12.119 seconds |3 warnings |
| 12|RegularizationTest2      |&#9989; |12.264 seconds |3 warnings |
| 13|RegularizationTest3      |&#9989; |14.442 seconds |3 warnings |
| 14|RegularizationTest4      |&#9989; |9.628 seconds  |2 warnings |
| 15|RegularizationTest5      |&#9989; |9.508 seconds  |3 warnings |
| 16|RegularizationTest6      |&#9989; |11.749 seconds |2 warnings |
| 17|TestScoreTool            |&#9989; |20.358 seconds |7 warnings |
| 18|TestScoreTool2           |&#9989; |10.144 seconds |3 warnings |
| 19|WeightedLinearWithCVTest |&#9989; |10.135 seconds |5 warnings |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
