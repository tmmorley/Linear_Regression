# Linear_Regression Workflow Tests



These tests were run at 2016-12-19 10:21:15



| id|name                |status  |time           |message    |
|--:|:-------------------|:-------|:--------------|:----------|
|  1|BasicTest           |&#9989; |13.991 seconds |6 warnings |
|  2|LinearTest1         |&#9989; |9.425 seconds  |3 warnings |
|  3|LinearTest2         |&#9989; |10.445 seconds |5 warnings |
|  4|LinearTest3         |&#9989; |11.736 seconds |5 warnings |
|  5|LinearTestAll       |&#9989; |20.889 seconds |5 warnings |
|  6|LinearWithCVTest    |&#9989; |7.469 seconds  |5 warnings |
|  7|LinearWithCVTest2   |&#9989; |8.952 seconds  |5 warnings |
|  8|LinearWithCVTest3   |&#9989; |7.503 seconds  |5 warnings |
|  9|RegularizationTest1 |&#9989; |12.946 seconds |3 warnings |
| 10|RegularizationTest2 |&#9989; |11.632 seconds |3 warnings |
| 11|RegularizationTest3 |&#9989; |11.973 seconds |3 warnings |
| 12|RegularizationTest4 |&#9989; |9.810 seconds  |2 warnings |
| 13|RegularizationTest5 |&#9989; |9.588 seconds  |3 warnings |
| 14|RegularizationTest6 |&#9989; |12.796 seconds |2 warnings |
| 15|TestScoreTool       |&#9989; |18.334 seconds |7 warnings |
| 16|TestScoreTool2      |&#9989; |9.017 seconds  |3 warnings |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
