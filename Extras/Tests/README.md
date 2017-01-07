# Linear_Regression Workflow Tests



These tests were run at 2017-01-07 04:06:54



| id|name                     |status  |time           |message    |
|--:|:------------------------|:-------|:--------------|:----------|
|  1|_4_Scatterplot           |&#9989; |19.205 seconds |1 warning  |
|  2|_8_Linear_Regression     |&#9989; |18.794 seconds |2 warnings |
|  3|BasicTest                |&#9989; |12.194 seconds |3 warnings |
|  4|CVRegularizationTest1    |&#9989; |11.917 seconds |7 warnings |
|  5|CVRegularizationTest2    |&#9989; |11.519 seconds |7 warnings |
|  6|LinearTest1              |&#9989; |9.138 seconds  |2 warnings |
|  7|LinearTest2              |&#9989; |9.067 seconds  |2 warnings |
|  8|LinearTest3              |&#9989; |8.888 seconds  |2 warnings |
|  9|LinearTestAll            |&#9989; |18.706 seconds |4 warnings |
| 10|LinearWithCVTest         |&#9989; |7.062 seconds  |5 warnings |
| 11|LinearWithCVTest2        |&#9989; |7.600 seconds  |5 warnings |
| 12|LinearWithCVTest3        |&#9989; |6.802 seconds  |5 warnings |
| 13|RegularizationTest1      |&#9989; |11.500 seconds |4 warnings |
| 14|RegularizationTest2      |&#9989; |11.384 seconds |4 warnings |
| 15|RegularizationTest3      |&#9989; |11.595 seconds |4 warnings |
| 16|RegularizationTest4      |&#9989; |9.099 seconds  |3 warnings |
| 17|RegularizationTest5      |&#9989; |8.874 seconds  |4 warnings |
| 18|RegularizationTest6      |&#9989; |11.545 seconds |2 warnings |
| 19|TestScoreTool            |&#9989; |17.263 seconds |4 warnings |
| 20|TestScoreTool2           |&#9989; |9.256 seconds  |4 warnings |
| 21|WeightedLinearWithCVTest |&#9989; |8.964 seconds  |5 warnings |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
