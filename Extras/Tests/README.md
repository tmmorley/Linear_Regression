# Linear_Regression Workflow Tests



These tests were run at 2017-01-05 14:27:12



| id|name                     |status  |time           |message    |
|--:|:------------------------|:-------|:--------------|:----------|
|  1|_4_Scatterplot           |&#9989; |16.399 seconds |           |
|  2|_8_Linear_Regression     |&#9989; |16.550 seconds |           |
|  3|BasicTest                |&#9989; |10.621 seconds |2 warnings |
|  4|CVRegularizationTest1    |&#9989; |11.652 seconds |3 warnings |
|  5|CVRegularizationTest2    |&#9989; |10.730 seconds |3 warnings |
|  6|LinearTest1              |&#9989; |8.140 seconds  |1 warning  |
|  7|LinearTest2              |&#9989; |8.103 seconds  |1 warning  |
|  8|LinearTest3              |&#9989; |8.022 seconds  |1 warning  |
|  9|LinearTestAll            |&#9989; |17.103 seconds |3 warnings |
| 10|LinearWithCVTest         |&#9989; |6.652 seconds  |3 warnings |
| 11|LinearWithCVTest2        |&#9989; |7.250 seconds  |3 warnings |
| 12|LinearWithCVTest3        |&#9989; |6.044 seconds  |3 warnings |
| 13|RegularizationTest1      |&#9989; |9.846 seconds  |1 warning  |
| 14|RegularizationTest2      |&#9989; |10.072 seconds |1 warning  |
| 15|RegularizationTest3      |&#9989; |9.978 seconds  |1 warning  |
| 16|RegularizationTest4      |&#9989; |8.133 seconds  |           |
| 17|RegularizationTest5      |&#9989; |7.858 seconds  |1 warning  |
| 18|RegularizationTest6      |&#9989; |10.068 seconds |           |
| 19|TestScoreTool            |&#9989; |15.436 seconds |3 warnings |
| 20|TestScoreTool2           |&#9989; |8.193 seconds  |1 warning  |
| 21|WeightedLinearWithCVTest |&#9989; |8.241 seconds  |3 warnings |


## UI Test Checklist.

1. Check that configuration persists. This includes widgets, tabs, pages, accordions, and pretty much any other ui element that the user interacts with. The configuration window should always.
2. Check navigation. This includes checking if pages show up correctly when the Customize/Back buttons are clicked. It is also important to check that persistence holds under these operations.
3. The `Customize` button should appear only after the user has filled out the model name, target variable and predictors.
4. Clicking on the `Customize` button should take the user to the second page.
5. Checking `Use a weighted variable ...` should bring up a dropdown to let the user select a weighting variable. This dropdown should be clearable. If the user checks this option, but does not select a weighting variable, then the workflow should display a configuration time error.
