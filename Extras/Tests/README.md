# Linear_Regression Workflow Tests



These tests were run at 2016-12-18 19:28:01



| id|name                |status  |time           |message    |
|--:|:-------------------|:-------|:--------------|:----------|
|  1|BasicTest           |&#9989; |12.506 seconds |4 warnings |
|  2|LinearTest1         |&#9989; |8.975 seconds  |3 warnings |
|  3|LinearTest2         |&#9989; |9.204 seconds  |3 warnings |
|  4|LinearTest3         |&#9989; |9.376 seconds  |3 warnings |
|  5|LinearTestAll       |&#9989; |18.533 seconds |5 warnings |
|  6|LinearWithCVTest    |&#9989; |7.765 seconds  |3 warnings |
|  7|LinearWithCVTest2   |&#9989; |8.756 seconds  |3 warnings |
|  8|LinearWithCVTest3   |&#9989; |7.439 seconds  |3 warnings |
|  9|RegularizationTest1 |&#9989; |11.129 seconds |3 warnings |
| 10|RegularizationTest2 |&#9989; |11.334 seconds |3 warnings |
| 11|RegularizationTest3 |&#9989; |10.709 seconds |3 warnings |
| 12|RegularizationTest4 |&#9989; |8.453 seconds  |2 warnings |
| 13|RegularizationTest5 |&#9989; |8.368 seconds  |3 warnings |
| 14|RegularizationTest6 |&#9989; |11.086 seconds |2 warnings |
| 15|TestScoreTool       |&#9989; |17.263 seconds |5 warnings |
| 16|TestScoreTool2      |&#9989; |8.629 seconds  |3 warnings |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
