## Description
The ROC/Q-Q function presented here takes a random sample of data and visually represents classifier performance through Sensitivity over 1-Specificity on the ROC curve. The ROC curve highlights a specific threshold, corresponding to the threshold on the density plot to the right. The Q-Q plot illustrates the transition into the quantile-quantile space, aligning with the ROC curve threshold for both populations, creating a linear representation. The accompanying density plot to the right provides a visual correlation of thresholds on both populations. The mathematical concept behind the ROC curve moving into a linear space is detailed in the presentation titled `ROCSmoothing_Presentation`. For the analytical proof of this concept, refer to [this link](https://rpubs.com/gsmit013/1136190).

## Usage
`plot.roc()`
* Once this repo has been cloned, run the following commands to execute:
* `chmod +x ROC_Smoothing/ROC_Func_v6.R` 
* `./ROC_Func_v6.R` 

![Sim Image](sim.png)


