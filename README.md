# Leveraging important variables for corn yield prediction   

Authors: B. Schumacher*, E. Burchfield, M. Yost, and B. Bean

*Corresponding author

=======

Accurate yield information empowers farmers to adapt, their governments to adopt timely agricultural and food policy interventions, and the markets they supply to prepare for production shifts. Unfortunately, the most representative yield data in the US, provided by the USDA-NASS Surveys, are spatiotemporally patchy and inconsistent; across the coterminous US between 2008 and 2018, 25% of US county-year corn yield data is missing in counties reporting at least one year of corn yields. Given the sparse nature of these data, and the importance of accurate yield information to farmer livelihoods and the US economy, researchers and other agricultural stakeholders would benefit from a more comprehensive yield data product. This paper seeks to provide a framework for producing this product using a simple and highly predictive non-parametric algorithm. Our objective is to examine the spatiotemporal efficacy of Random Forest (RF) in predicting county-level yields of corn—the most widely cultivated crop in the US—using both traditional and novel features. To meet our objective, we build biophysical RFs, test the sensitivity of our analyses to the addition of farm(er) characteristics, and utilize variable importance measures and partial dependence plots to compare and contextualize how key variables interact with corn yield across models. Results suggest that RF predicts US corn yields well (RMSE = 17.22 bushels/acre (1.16 tons/hectare) in the biophysical ensemble and RMSE = 17.29 bushels/acre (1.16 tons/hectare) in the farm(er) ensemble) across space (coterminous US) and time (2008-2018). Results also point to the importance of space and time in corn yield prediction, and the highly nonlinear response of corn yield to irrigation, climate, agricultural diversity, and farm(er) covariates. These results demonstrate the efficacy and predictive capacity of RF regression to model complex corn yield responses to biophysical and farm(er) conditions. We conclude by contextualizing our findings with existing knowledge about yield response to important covariates and make recommendations about relationships that warrant further exploration. The empirical evidence detailed in this paper, along with the clean datasets produced, should be an effective tool for further elucidating links between crop yields and future cropscapes.

**Key words**: yield modeling, corn, random forest, data infilling, yield prediction
 

## Getting started

If you've stumbled up on this repo and are interested in the infilled corn yield data we produced, or the code we built, please see the descriptions below of each dataset and each .Rmd/.html file:

### Data files in corn-yield-infill/data

‘all-available-BIOPH-attributes.RDS’: all available biophysical attributes; used to compare model performance with a full v. selected set of biophysical variables.

‘all-available-FARMER-attributes.RDS’: all available biophysical and farm(er) attributes; used to compare model performance with a full v. selected set of variables.

‘county.RDS’: R spatial file of US counties in coterminous US.

‘farm-er-interp.RDS’: interpolated Census of Agriculture data using the mean of bounding years to produce NA-year estimates.

‘farm-er-linearinterp.RDS’: interpolated Census of Agriculture data using the linear interpolation between bounding years (from {zoo} package, na.approx() funx) to produce NA-year estimates.

‘FRR.RDS’: R spatial file of US Farm Resource Regions.

‘full_merged_irrigation.RDS’: county-based US irrigation estimates.

‘states.RDS’: R spatial file of US states in coterminous US.

‘true-test-infillobs.RDS’: the "true test" dataset, or *infill* dataset. County-years for which no data is reported in counties reporting at least one year of data between 2008 and 2018.

‘true-train.RDS’: 

‘tune-bioph-ranger.RDS’: results from {ranger} RF tuning procedure for biophysical models.

‘tune-farmer-ranger.RDS’: results from {ranger} RF tuning procedure for farm(er) models.

‘yieldRF.RDS’: full cleaned, merged, and interpolated biophysical and farm(er) dataset. Includes all county-years for which data is reported in counties reporting at least one year of data between 2008 and 2018.

### Data files in corn-yield-infill/data/data-out

'ensemble_bioph_infill.RDS': complete infilled dataset including 11-years/county (2008-2018) of corn yields as predicted by the biophysical RF ensemble.

'ensemble_bioph_preds.RDS': predictions from test set (25% data held-out from training RF ensemble) as predicted by the biophysical RF ensemble, including error.

'ensemble_farm_preds.RDS': predictions from test set (25% data held-out from training RF ensemble) as predicted by the farm(er) RF ensemble, including error.

'ensemble_farmer_infill.RDS': complete infilled dataset including 11-years/county (2008-2018) of corn yields as predicted by the farm(er) RF ensemble.

'ensemble_infill_diff.RDS': the difference in county-year yield predictions between the biophysical and farm(er) RF ensembles.

### .RDS/.html files in corn-yield-infill

‘COA-variable-range.html’: Box and whisker plots across all years for each Census of Agriculture variable of interest.

‘cornyield-manuscript-analysis.Rmd’: Builds test and training datasets. Builds *n* = 100 RF ensembles using biophysical and farm(er) characteristics to predict corn yields. Builds infilled corn yield datasets using these ensembles. Compares differences in predictions.

‘cornyield-manuscript-visualizations.Rmd’: Builds all visualizations in manuscript using relative pathways for reproducibility.

‘cornyield-SI-visualizations.Rmd’: Builds all visualizations in SI using relative pathways for reproducibility.

‘linear-interpolation.Rmd/.html’: Builds interpolated Census of Agriculture data utilizing linear interpolation from the {zoo} package and na.approx() function.

‘mean-interpolation.Rmd/.html’: Builds interpolated Census of Agriculture data utilizing the mean of bounding years to produce NA-year estimates.

‘tune-tanger-models.Rmd’: Tunes {ranger} models using a hyperparameter grid search for both the biophysical and farm(er) RFs.

'variable-selection.Rmd/.html': Selects variables based on the following rules of elimination: 1) Drop any climate variable that measure a range, retain the min and max values; 2) Drop any climate variable that is a monthly measurement and retain quarterly measurement; 3) Drop any climate variable that is an annual summary; 4) Keep crop-specific variables when collinear with biovars; 5) Keep only soil variables important to crop production; and 6) Choose the variable with the higher availability for other variable pairs in CoA variables.

### Contents of corn-yield-infill/{randomforest}

This folder contains all of the results from the RF implementation from the {randomForest} package. {ranger} provides a much faster RF implementation, without any loss in performance, and is thus used in all manuscript analyses.

### Results in corn-yield-infill/results

'ranger-imp': importance metrics from all {ranger} RF models.

'ranger-infill': infilled product for corn yield in non-reporting county years.

'ranger-pdp': partial dependence measures for {ranger} models on important variables.

'ranger-preds': all predictions from test-set RFs.

### Visualizations in corn-yield-infill/viz

Includes all manuscript and SI visualizations in .png format, as produced in cornyield-manuscript(/SI)-visualizations.Rmd's.