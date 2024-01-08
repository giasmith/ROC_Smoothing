## Features
- Plots ROC curves
- Displays density plots
- Generates Q-Q plots

## Description

### ROC Curve
The R code `/ROC_Func_v6.R` displays an ROC curve which is created using the following steps:

1. **Calculate Parameters (`a` and `b`):**
   - `a` is determined as the difference of means (`m.0 - m.1`) divided by the standard deviation of Group 0 (`sd.0`).
   - `b` is the ratio of the standard deviation of Group 0 to the standard deviation of Group 1 (`sd.0/sd.1`).

2. **Generate ROC Points:**
   - Generate false positive rates (`fpf`) from 0 to 1 with a step of 0.001.
   - Calculate true positive rates (`tpr`) using the normal distribution and the calculated parameters `a` and `b`.

3. **Plot ROC Curve:**
   - Create a 2x2 plot layout.
   - Plot the ROC curve using `plot()` and draw the cutoff point with a purple dot.
   - Add dashed vertical line at the specified probability (`prob`).

### Density Plots
1. **Define Distributions (`y1` and `y2`):**
   - Generate normal distributions for Group 0 (`y1`) and Group 1 (`y2`) based on mean (`m.0` and `m.1`) and standard deviations (`sd.0` and `sd.1`).

2. **Plot Densities:**
   - Plot the density curves for both groups.
   - Add a vertical dashed line at the cutoff point (`c`) in light pink and light blue regions.

### Q-Q Plots
1. **Calculate Quantiles (`q0` and `q1`):**
   - Calculate quantiles for Group 0 (`q0`) and Group 1 (`q1`) using the normal distribution.

2. **Plot Q-Q Plot:**
   - Plot the Q-Q plot with quantiles from Group 0 on the x-axis and Group 1 on the y-axis.
   - Add a line representing perfect correlation.
   - Mark the cutoff point with a purple dot.

3. **Density Plots in Q-Q Space:**
   - Plot density curves for both groups in Q-Q space.
   - Add vertical dashed lines at the cutoff quantiles (`q0.p` and `q1.p`).

## Parameters 
- m.0: Mean of Group 0
- m.1: Mean of Group 1
- sd.0: Standard deviation of Group 0
- sd.1: Standard deviation of Group 1
- prob: Probability threshold

## Usage
`plot.roc()`
Once this repo has been cloned, run the following commands in command line to execute:
`chmod +x ROC_Func_v6.R`
`./ROC_Func_v6.R`

![Sim Image](sim.png)


