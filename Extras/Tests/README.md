# Linear_Regression Workflow Tests



These tests were run at 2016-12-27 11:57:36



| id|name                     |status  |time           |message    |
|--:|:------------------------|:-------|:--------------|:----------|
|  1|_4_Scatterplot           |&#9989; |13.154 seconds |           |
|  2|_8_Linear_Regression     |&#9989; |14.496 seconds |6 warnings |
|  3|BasicTest                |&#9989; |8.553 seconds  |2 warnings |
|  4|CVRegularizationTest1    |&#9989; |8.987 seconds  |2 warnings |
|  5|CVRegularizationTest2    |&#9989; |8.943 seconds  |1 warning  |
|  6|LinearTest1              |&#9989; |6.700 seconds  |1 warning  |
|  7|LinearTest2              |&#9989; |7.810 seconds  |1 warning  |
|  8|LinearTest3              |&#9989; |8.123 seconds  |1 warning  |
|  9|LinearTestAll            |&#9989; |21.953 seconds |3 warnings |
| 10|LinearWithCVTest         |&#9989; |7.185 seconds  |1 warning  |
| 11|LinearWithCVTest2        |&#9989; |7.946 seconds  |1 warning  |
| 12|LinearWithCVTest3        |&#9989; |6.682 seconds  |1 warning  |
| 13|RegularizationTest1      |&#9989; |8.780 seconds  |1 warning  |
| 14|RegularizationTest2      |&#9989; |9.066 seconds  |1 warning  |
| 15|RegularizationTest3      |&#9989; |9.311 seconds  |1 warning  |
| 16|RegularizationTest4      |&#9989; |9.549 seconds  |           |
| 17|RegularizationTest5      |&#9989; |6.863 seconds  |1 warning  |
| 18|RegularizationTest6      |&#9989; |9.082 seconds  |           |
| 19|TestScoreTool            |&#9989; |14.963 seconds |3 warnings |
| 20|TestScoreTool2           |&#9989; |6.632 seconds  |1 warning  |
| 21|WeightedLinearWithCVTest |&#9989; |8.313 seconds  |1 warning  |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
