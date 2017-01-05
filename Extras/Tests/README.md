# Linear_Regression Workflow Tests



These tests were run at 2017-01-05 13:26:19



| id|name                     |status  |time           |message    |
|--:|:------------------------|:-------|:--------------|:----------|
|  1|_4_Scatterplot           |&#9989; |15.557 seconds |           |
|  2|_8_Linear_Regression     |&#9989; |16.682 seconds |6 warnings |
|  3|BasicTest                |&#9989; |10.777 seconds |2 warnings |
|  4|CVRegularizationTest1    |&#9989; |16.072 seconds |3 warnings |
|  5|CVRegularizationTest2    |&#9989; |13.880 seconds |3 warnings |
|  6|LinearTest1              |&#9989; |8.223 seconds  |1 warning  |
|  7|LinearTest2              |&#9989; |8.129 seconds  |1 warning  |
|  8|LinearTest3              |&#9989; |7.962 seconds  |1 warning  |
|  9|LinearTestAll            |&#9989; |16.389 seconds |3 warnings |
| 10|LinearWithCVTest         |&#9989; |6.116 seconds  |3 warnings |
| 11|LinearWithCVTest2        |&#9989; |6.881 seconds  |3 warnings |
| 12|LinearWithCVTest3        |&#9989; |6.047 seconds  |3 warnings |
| 13|RegularizationTest1      |&#9989; |10.064 seconds |1 warning  |
| 14|RegularizationTest2      |&#9989; |9.974 seconds  |1 warning  |
| 15|RegularizationTest3      |&#9989; |10.013 seconds |1 warning  |
| 16|RegularizationTest4      |&#9989; |8.048 seconds  |           |
| 17|RegularizationTest5      |&#9989; |7.860 seconds  |1 warning  |
| 18|RegularizationTest6      |&#9989; |10.137 seconds |           |
| 19|TestScoreTool            |&#9989; |15.180 seconds |3 warnings |
| 20|TestScoreTool2           |&#9989; |8.290 seconds  |1 warning  |
| 21|WeightedLinearWithCVTest |&#9989; |8.101 seconds  |3 warnings |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
