# Linear_Regression Workflow Tests



These tests were run at 2016-12-30 10:11:19



| id|name                     |status  |time           |message    |
|--:|:------------------------|:-------|:--------------|:----------|
|  1|_4_Scatterplot           |&#9989; |17.925 seconds |           |
|  2|_8_Linear_Regression     |&#9989; |23.287 seconds |6 warnings |
|  3|BasicTest                |&#9989; |14.300 seconds |2 warnings |
|  4|CVRegularizationTest1    |&#9989; |13.391 seconds |2 warnings |
|  5|CVRegularizationTest2    |&#9989; |11.635 seconds |1 warning  |
|  6|LinearTest1              |&#9989; |7.450 seconds  |1 warning  |
|  7|LinearTest2              |&#9989; |8.529 seconds  |1 warning  |
|  8|LinearTest3              |&#9989; |8.255 seconds  |1 warning  |
|  9|LinearTestAll            |&#9989; |17.821 seconds |3 warnings |
| 10|LinearWithCVTest         |&#9989; |6.685 seconds  |1 warning  |
| 11|LinearWithCVTest2        |&#9989; |7.702 seconds  |1 warning  |
| 12|LinearWithCVTest3        |&#9989; |7.394 seconds  |1 warning  |
| 13|RegularizationTest1      |&#9989; |10.234 seconds |1 warning  |
| 14|RegularizationTest2      |&#9989; |10.156 seconds |1 warning  |
| 15|RegularizationTest3      |&#9989; |10.559 seconds |1 warning  |
| 16|RegularizationTest4      |&#9989; |8.759 seconds  |           |
| 17|RegularizationTest5      |&#9989; |8.486 seconds  |1 warning  |
| 18|RegularizationTest6      |&#9989; |10.085 seconds |           |
| 19|TestScoreTool            |&#9989; |15.507 seconds |3 warnings |
| 20|TestScoreTool2           |&#9989; |8.352 seconds  |1 warning  |
| 21|WeightedLinearWithCVTest |&#9989; |8.829 seconds  |1 warning  |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
