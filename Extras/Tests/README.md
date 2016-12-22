# Linear_Regression Workflow Tests



These tests were run at 2016-12-22 11:21:24



| id|name                     |status  |time           |message    |
|--:|:------------------------|:-------|:--------------|:----------|
|  1|_4_Scatterplot           |&#9989; |14.155 seconds |           |
|  2|_8_Linear_Regression     |&#9989; |15.364 seconds |8 warnings |
|  3|BasicTest                |&#9989; |10.235 seconds |4 warnings |
|  4|CVRegularizationTest1    |&#9989; |9.871 seconds  |3 warnings |
|  5|CVRegularizationTest2    |&#9989; |10.588 seconds |3 warnings |
|  6|LinearTest1              |&#9989; |7.799 seconds  |1 warning  |
|  7|LinearTest2              |&#9989; |7.897 seconds  |3 warnings |
|  8|LinearTest3              |&#9989; |7.874 seconds  |3 warnings |
|  9|LinearTestAll            |&#9989; |16.037 seconds |3 warnings |
| 10|LinearWithCVTest         |&#9989; |5.996 seconds  |3 warnings |
| 11|LinearWithCVTest2        |&#9989; |6.436 seconds  |3 warnings |
| 12|LinearWithCVTest3        |&#9989; |7.387 seconds  |3 warnings |
| 13|RegularizationTest1      |&#9989; |9.058 seconds  |1 warning  |
| 14|RegularizationTest2      |&#9989; |9.100 seconds  |1 warning  |
| 15|RegularizationTest3      |&#9989; |9.631 seconds  |1 warning  |
| 16|RegularizationTest4      |&#9989; |8.135 seconds  |           |
| 17|RegularizationTest5      |&#9989; |7.161 seconds  |1 warning  |
| 18|RegularizationTest6      |&#9989; |9.155 seconds  |           |
| 19|TestScoreTool            |&#9989; |14.125 seconds |5 warnings |
| 20|TestScoreTool2           |&#9989; |7.421 seconds  |1 warning  |
| 21|WeightedLinearWithCVTest |&#9989; |8.402 seconds  |3 warnings |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
