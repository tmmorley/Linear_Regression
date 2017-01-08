# Linear_Regression Workflow Tests



These tests were run at 2017-01-07 17:13:59



| id|name                     |status  |time           |message    |
|--:|:------------------------|:-------|:--------------|:----------|
|  1|_4_Scatterplot           |&#9989; |18.988 seconds |1 warning  |
|  2|_8_Linear_Regression     |&#9989; |20.876 seconds |           |
|  3|BasicTest                |&#9989; |13.203 seconds |2 warnings |
|  4|CVRegularizationTest1    |&#9989; |12.905 seconds |4 warnings |
|  5|CVRegularizationTest2    |&#9989; |12.797 seconds |4 warnings |
|  6|LinearTest1              |&#9989; |9.411 seconds  |1 warning  |
|  7|LinearTest2              |&#9989; |9.357 seconds  |1 warning  |
|  8|LinearTest3              |&#9989; |10.306 seconds |1 warning  |
|  9|LinearTestAll            |&#9989; |19.482 seconds |3 warnings |
| 10|LinearWithCVTest         |&#9989; |7.520 seconds  |4 warnings |
| 11|LinearWithCVTest2        |&#9989; |9.454 seconds  |4 warnings |
| 12|LinearWithCVTest3        |&#9989; |10.127 seconds |5 warnings |
| 13|RegularizationTest1      |&#9989; |14.769 seconds |2 warnings |
| 14|RegularizationTest2      |&#9989; |14.854 seconds |2 warnings |
| 15|RegularizationTest3      |&#9989; |17.692 seconds |2 warnings |
| 16|RegularizationTest4      |&#9989; |10.825 seconds |1 warning  |
| 17|RegularizationTest5      |&#9989; |10.711 seconds |2 warnings |
| 18|RegularizationTest6      |&#9989; |14.548 seconds |2 warnings |
| 19|TestScoreTool            |&#9989; |22.279 seconds |4 warnings |
| 20|TestScoreTool2           |&#9989; |10.053 seconds |2 warnings |
| 21|WeightedLinearWithCVTest |&#9989; |9.877 seconds  |5 warnings |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
