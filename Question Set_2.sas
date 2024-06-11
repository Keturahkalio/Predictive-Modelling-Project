*importing an xlsx dataset into SAS with the name, Data;
proc import datafile = "/home/u63803621/HSCI_846/Week_8/Data.xlsx"
dbms = xlsx
out = data
replace;
run;

*Q1: Using histogram to get a graphical summary of the distribution of indoor PM2.5 concentrations;
proc sgplot data= data;
    histogram Indoor_PM25;
    density Indoor_PM25 / type= kernel;
    xaxis label="Indoor PM2.5_Concentration (micrograms/m3)";
    yaxis label="Frequency";
    title "7-Day Average Distribution of Indoor PM2.5 Concentrations in Ulaanbaatar Homes";
run;

*2:Log_transforming indoor and outdoor PM25 Conc variables;
data transform; *Instructing SAS to create a new variable called transform;
set data; 
log_Indoor_PM25 = log(Indoor_PM25); *Instructing SAS to create a new variable "log_Indoor_PM25" in the dataset transform;
log_Outdoor_PM25 = log(Out_PM25); *Instructing SAS to create a new variable "log_Outdoor_PM25" in the dataset transform;
run;

*generating a table that provides summary statistics for log_Indoor_PM25 variable;
title "A Simple Table"; 
proc tabulate data = transform;
var log_Indoor_PM25;
table log_Indoor_PM25*(N std mean median p25 p75);
run;

*In order to get GM and GSD we need to exp the log_transformed mean and sd;
data IndoorPM25;
GM_Indoor_PM25 = exp(3.02);
GSD_Indoor_PM25 = exp(0.70);
GMedian_Indoor_PM25 = exp(2.96);
Gp25_Indoor_PM25 = exp(2.52);
Gp75_Indoor_PM25 = exp(3.53);
run;
proc print data = IndoorPM25; run; 

*Summary statistics within categories of a categorical variable for log_Indoor_PM25;
*summarize Log_Indoor_PM25 by Season (you can select the summary statistics of interest – N, mean, median, std, min, p1, p10, p25, etc.); 
proc tabulate data = transform;
var log_Indoor_PM25;
class Season;
table log_Indoor_PM25*Season*(N mean std median p25 p75);
run;

*Exponentiating to get GM, GSD, GMed, Gp25, Gp75;
data IndoorPM25_Season;
GM_Indoor_PM25_F = exp(2.40);
GSD_Indoor_PM25_F = exp(0.35);
GMedian_Indoor_PM25_F = exp(2.41);
Gp25_Indoor_PM25_F = exp(2.14);
Gp75_Indoor_PM25_F = exp(2.67);

GM_Indoor_PM25_Sp = exp(3.60);
GSD_Indoor_PM25_Sp = exp(0.66);
GMedian_Indoor_PM25_Sp = exp(3.65);
Gp25_Indoor_PM25_Sp = exp(3.30);
Gp75_Indoor_PM25_Sp = exp(4.04);

GM_Indoor_PM25_Su = exp(2.88);
GSD_Indoor_PM25_Su = exp(0.54);
GMedian_Indoor_PM25_Su = exp(2.90);
Gp25_Indoor_PM25_Su = exp(2.60);
Gp75_Indoor_PM25_Su = exp(3.20);

GM_Indoor_PM25_W = exp(3.10);
GSD_Indoor_PM25_W = exp(0.59);
GMedian_Indoor_PM25_W = exp(3.09);
Gp25_Indoor_PM25_W = exp(2.68);
Gp75_Indoor_PM25_W = exp(3.46);
run;
proc print data = IndoorPM25_Season; run; 


*summarize Log_Indoor_PM25 by Intervention (Binary: Control/filter);
proc tabulate data = transform;
var log_Indoor_PM25;
class Intervention;
table log_Indoor_PM25*Intervention*(N mean std median p25 p75);
run;

*Exponentiating to get GM, GSD, GMed, Gp25, Gp75;
data IndoorPM25_Intervention;
GM_Indoor_PM25_C = exp(3.20);
GSD_Indoor_PM25_C = exp(0.70);
GMedian_Indoor_PM25_C = exp(3.20);
Gp25_Indoor_PM25_C = exp(2.66);
Gp75_Indoor_PM25_C = exp(3.81);
GM_Indoor_PM25_Fi = exp(2.85);
GSD_Indoor_PM25_Fi = exp(0.65);
GMedian_Indoor_PM25_Fi = exp(2.84);
Gp25_Indoor_PM25_Fi = exp(2.42);
Gp75_Indoor_PM25_Fi = exp(3.25);
run;
proc print data = IndoorPM25_Intervention; run; 

*summarize Log_Indoor_PM25 by Live_with_smokers (Dichotomous: Yes/No);
proc tabulate data = transform;
var log_Indoor_PM25;
class Live_with_smokers;
table log_Indoor_PM25*Live_with_smokers*(N mean std median p25 p75);
run;

*Exponentiating to get GM, GSD, GMed, Gp25, Gp75;
data IndoorPM25_Live_with_Smokers;
GM_Indoor_PM25_No = exp(2.98);
GSD_Indoor_PM25_No = exp(0.70);
GMedian_Indoor_PM25_No = exp(2.94);
Gp25_Indoor_PM25_No = exp(2.46);
Gp75_Indoor_PM25_No = exp(3.49);
GM_Indoor_PM25_Yes = exp(3.08);
GSD_Indoor_PM25_Yes = exp(0.70);
GMedian_Indoor_PM25_Yes = exp(3.01);
Gp25_Indoor_PM25_Yes = exp(2.63);
Gp75_Indoor_PM25_Yes = exp(3.58);
run;
proc print data = IndoorPM25_Live_with_Smokers; run; 

*summarize Log_Indoor_PM25 by Filters_deployed (Continuous:0,1,2);
proc tabulate data = transform;
var log_Indoor_PM25;
class Filters_deployed;
table log_Indoor_PM25*Filters_deployed*(N mean std median p25 p75);
run;

*Exponentiating to get GM, GSD, GMed, Gp25, Gp75;
data IndoorPM25_Filters_deployed;
GM_Indoor_PM25_0 = exp(3.20);
GSD_Indoor_PM25_0 = exp(0.70);
GMedian_Indoor_PM25_0 = exp(3.20);
Gp25_Indoor_PM25_0 = exp(2.66);
Gp75_Indoor_PM25_0 = exp(3.81);

GM_Indoor_PM25_1 = exp(2.95);
GSD_Indoor_PM25_1 = exp(0.69);
GMedian_Indoor_PM25_1 = exp(2.93);
Gp25_Indoor_PM25_1 = exp(2.70);
Gp75_Indoor_PM25_1 = exp(3.51);

GM_Indoor_PM25_2 = exp(2.81);
GSD_Indoor_PM25_2 = exp(0.63);
GMedian_Indoor_PM25_2 = exp(2.83);
Gp25_Indoor_PM25_2 = exp(2.34);
Gp75_Indoor_PM25_2 = exp(3.23);
run;
proc print data = IndoorPM25_Filters_deployed; run; 

*Q3: Create a table showing the correlation coefficient and p-value (i.e., a correlation matrix) for the continuous variables; 
*Using 'proc corr' and 'proc sgscatter' creates correlation and scatterplot matrices for each continous variable;
title "Scatterplot Matrix for Continuous Variables"; 
proc sgscatter data = transform;
matrix log_Indoor_PM25 log_Outdoor_PM25 SO2 T4 ger5000;
run;

title "Correlation Matrix for Continuous Variables"; 
proc corr data = transform;
 var log_Indoor_PM25 Out_PM25 SO2 T4 ger5000;
run;

*Q4: Calculating the variance in indoor PM2.5 concentration explained (R2) by each predictor variable;
*Starting with creating dummy variables for categorical variables;
*The category that does not have a dummy variable 
becomes the reference category (i.e., the category indicated when all dummy variables = 0). I;
data dummy;
set transform;
if Intervention = "control" then do; *creating a dummy variable for Intervention, using category 'Control' as reference category;
 filter = 0;  
end; 
if Intervention = "filter" then do; 
 filter = 1; 
end;  
if Season = "Spring" then do; *creating a dummy variable for Season, using category 'Spring' as reference category;
 Summer = 0; 
 Fall = 0; 
 Winter = 0;
end; 
if Season = "Summer" then do; 
 Summer = 1; 
 Fall =  0; 
 Winter = 0;
end; 
if Season = "Fall" then do; 
 Summer = 0; 
 Fall = 1; 
 Winter = 0;
end; 
if Season = "Winter" then do; 
 Summer = 0; 
 Fall = 0; 
 Winter = 1;
end;
if Live_with_smokers = "Yes" then do; *creating a dummy variable for Live_with_smokers, using category 'Yes' as reference category;
 No = 0; 
end; 
if Live_with_smokers = "No" then do; 
 No = 1; 
end; 
if Filters_deployed = '1' then do; *creating a dummy variable for Filters_deployed, using category '0' as reference category;
Filter1 = 1;
Filter2 = 0;
end;
if Filters_deployed = '2' then do;
Filter1 = 0;
Filter2 = 1;
end;
if Filters_deployed = '0' then do;
Filter1 = 0;
Filter2 = 0;
end;
run;

*evaluating the variance in log_Indoor_PM25 explained (R2) by each variable by running a separate 
regression for each predictor variable. 
*regressing log_Indoor_PM25 on the Intervention dummy variables;
proc reg data = dummy;
model log_Indoor_PM25 = filter;
run;

*regressing log_Indoor_PM25 on the Season dummy variables;
proc reg data = dummy;
model log_Indoor_PM25 = Summer Fall Winter;
run;

*regressing log_Indoor_PM25 on the Live_with_smokers dummy variables;
proc reg data = dummy;
model log_Indoor_PM25 = No;
run;

*regressing Log_Concentration on the filters_deployed variable;
proc reg data = dummy;
model log_Indoor_PM25 = filter1 filter2;
run;

*regressing log_Indoor_PM25 on the continous variables;
*regressing log_Indoor_PM25 on the outdoorPM25 variable;
proc reg data = dummy;
model log_Indoor_PM25 = Out_PM25;
run;

*regressing log_Indoor_PM25 on the Wind Stagnation index variable;
proc reg data = dummy;
model log_Indoor_PM25 = WindS;
run;

*regressing log_Indoor_PM25 on the temp variable;
proc reg data = dummy;
model log_Indoor_PM25 = T4;
run;

*regressing log_Indoor_PM25 on the SO2 variable;
proc reg data = dummy;
model log_Indoor_PM25 = SO2;
run;

*regressing log_Indoor_PM25 on the b5000 variable;
proc reg data = dummy;
model log_Indoor_PM25 = b5000;
run;

*regressing log_Indoor_PM25 on the wet5000 variable;
proc reg data = dummy;
model log_Indoor_PM25 = wet5000;
run;

*regressing log_Indoor_PM25 on the Green100 variable;
proc reg data = dummy;
model log_Indoor_PM25 = Green100;
run;

*regressing log_Indoor_PM25 on the ger750 variable;
proc reg data = dummy;
model log_Indoor_PM25 = ger750;
run;

*regressing log_Indoor_PM25 on the ger5000 variable;
proc reg data = dummy;
model log_Indoor_PM25 = ger5000;
run;

*regressing log_Indoor_PM25 on the road100 variable;
proc reg data = dummy;
model log_Indoor_PM25 = road100;
run;

*regressing log_Indoor_PM25 on the road500 variable;
proc reg data = dummy;
model log_Indoor_PM25 = road500;
run;

*regressing log_Indoor_PM25 on the road2500 variable;
proc reg data = dummy;
model log_Indoor_PM25 = road2500;
run;

*regressing log_Indoor_PM25 on the Elevation variable;
proc reg data = dummy;
model log_Indoor_PM25 = Elevation;
run;

*regressing log_Indoor_PM25 on the Meals_Cooked variable;
proc reg data = dummy;
model log_Indoor_PM25 = Meals_Cooked;
run;

*regressing log_Indoor_PM25 on the Fried_Meals variable;
proc reg data = dummy;
model log_Indoor_PM25 = Fried_Meals;
run;

*regressing log_Indoor_PM25 on the Smokers_at_Home variable;
proc reg data = dummy;
model log_Indoor_PM25 = Smokers_at_Home;
run;

*Q5: Showing the relationship between log-transformed indoor PM_2.5 and season;
*Season is the variable that predicts the most variabilit from Q4;
proc sgplot data= transform;
    vbox log_Indoor_PM25 / category = season 
        boxwidth=0.5 /* box width */
        fillattrs=(color=lightblue); /* Box fill color */
    xaxis label='Seasons'
    	discreteorder=data /* Order by the data */
        valueattrs=(size=12)/* Font size of axis values */;
    yaxis label='log_Indoor_PM25 (micrograms/m3)'
    		grid /* Include grid for precision */
           valueattrs=(size=12);
    title "Seasonal Variation of Average Indoor PM2.5 Concentrations in Participant's Homes, Ulaanbaatar";
    title2 '7-day Period Analysis'; /* Subtitle for additional context */
run;

*Q6: Creating a predictive model for PM2.5;
proc reg data = dummy;
model log_Indoor_PM25 = {Summer Fall Winter} No {filter1 filter2}
Out_PM25 WindS T4 SO2 b5000 wet5000 Green100 ger750
ger5000 road100 road500 road2500 Elevation Meals_Cooked Fried_Meals 
Smokers_at_Home  / selection=forward sle=0.05; 
run;

proc reg data = dummy;
model log_Indoor_PM25 = {Summer Fall Winter} {filter1 filter2}
Out_PM25 Green100 ger750 ger5000   / clb;
run;

*generate a graph that compares your predictions with the actual measurements;
data prediction_data;
	set dummy;
	log_predicted = 3.00811 + (-0.50950 * Summer) + (-0.34478 * Winter) + (-1.05951 * Fall) +
					(-0.24002 * Filter1) + (-0.46940 * Filter2) + (0.00303 * Out_PM25) + 
					(-0.00135 * ger750) + (0.01153 * green100) + (0.20600 * ger5000);
	Predicted_PM25 = exp(log_predicted); *Adding a new column predicted_ordinary which is the exp of the log_predicted;
	label Predicted_PM25 = "Predicted PM2.5 Concentrations (micrograms/m3)";
	label Indoor_PM25 = "Measured PM2.5 Concentrations (micrograms/m3)";
run;

Proc reg data = prediction_data;
	model Predicted_PM25 = Indoor_PM25;
	*title "Figure 1 Scatter Plot Comparing Measured and Predicted Indoor PM2.5 Concentrations in Ulaanbaatar Homes"
	height = 20;
	*axis;
	plot  Predicted_PM25 * Indoor_PM25;
run;

