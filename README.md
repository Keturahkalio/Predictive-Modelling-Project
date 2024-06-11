# Predictive-Modelling-Project
This project aims to develop a statistical model that estimates 7-day average PM2.5 concentrations inside the homes of pregnant women enrolled in a birth cohort study in Ulaanbaatar, Mongolia.
As part of the birth cohort study, PM2.5 concentrations were measured for seven days in each participant’s home. However, knowing the concentration during a single 7-day period tells us nothing about a woman’s exposure during other weeks of pregnancy. 

So, I built a model that allows us to estimate PM2.5 concentrations during each week of pregnancy to estimate each participant’s average exposure during pregnancy and during each trimester.

The basic idea is this: we do not know PM2.5 concentrations at every time for every woman, but there are lots of things we do know (from questionnaires, government monitoring, etc.). If those other variables are predictive of indoor PM2.5 we can estimate the concentration even during weeks when we don’t have a measurement.


Studies:

Allen et al., "An assessment of air pollution and its attributable mortality in Ulaanbaatar, Mongolia"

Yuchi et al., "A description of methods for deriving air pollution land use regression model predictor variables from remote sensing data in Ulaanbaatar, Mongolia"

Barn et al., "The effect of portable HEPA filter air cleaners on indoor PM2.5 concentrations and second hand tobacco smoke exposure among pregnant women in Ulaanbaatar, Mongolia: The UGAAR randomized controlled trial"
