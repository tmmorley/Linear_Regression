# Linear_Regression Workflow Tests



These tests were run at 2016-12-21 13:29:19



| id|name                     |status  |time           |message    |
|--:|:------------------------|:-------|:--------------|:----------|
|  1|BasicTest                |&#9989; |13.232 seconds |4 warnings |
|  2|CVRegularizationTest1    |&#9989; |12.874 seconds |3 warnings |
|  3|CVRegularizationTest2    |&#9989; |10.085 seconds |3 warnings |
|  4|LinearTest1              |&#9989; |7.020 seconds  |1 warning  |
|  5|LinearTest2              |&#9989; |7.838 seconds  |3 warnings |
|  6|LinearTest3              |&#9989; |7.759 seconds  |3 warnings |
|  7|LinearTestAll            |&#9989; |16.292 seconds |3 warnings |
|  8|LinearWithCVTest         |&#9989; |5.699 seconds  |3 warnings |
|  9|LinearWithCVTest2        |&#9989; |6.328 seconds  |3 warnings |
| 10|LinearWithCVTest3        |&#9989; |5.645 seconds  |3 warnings |
| 11|RegularizationTest1      |&#9989; |8.503 seconds  |1 warning  |
| 12|RegularizationTest2      |&#9989; |8.543 seconds  |1 warning  |
| 13|RegularizationTest3      |&#9989; |8.599 seconds  |1 warning  |
| 14|RegularizationTest4      |&#9989; |6.948 seconds  |           |
| 15|RegularizationTest5      |&#9989; |6.773 seconds  |1 warning  |
| 16|RegularizationTest6      |&#9989; |8.685 seconds  |           |
| 17|TestScoreTool            |&#9989; |14.115 seconds |5 warnings |
| 18|TestScoreTool2           |&#9989; |6.965 seconds  |1 warning  |
| 19|WeightedLinearWithCVTest |&#9989; |7.458 seconds  |3 warnings |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
