formula_list <- vector("list", 5)

formula_list[[1]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
  SDI_CDL_AG + 
  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP + 
  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC + 
  perc_corn + chem + fert + labor_expense + machinery + 
  insur_acres + gvt_prog + 
  exp + occup + tenant + acres_per_op 

formula_list[[2]] <- YIELD ~ 
  # YEAR + lon + lat + FRR + 
  SDI_CDL_AG + 
  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP + 
  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC + 
  perc_corn + chem + fert + labor_expense + machinery + 
  insur_acres + gvt_prog + 
  exp + occup + tenant + acres_per_op 

formula_list[[3]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
  # SDI_CDL_AG + 
  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP + 
  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC + 
  perc_corn + chem + fert + labor_expense + machinery + 
  insur_acres + gvt_prog + 
  exp + occup + tenant + acres_per_op 

formula_list[[4]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
  SDI_CDL_AG + 
  # SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP + 
  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC + 
  perc_corn + chem + fert + labor_expense + machinery + 
  insur_acres + gvt_prog + 
  exp + occup + tenant + acres_per_op 

formula_list[[5]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
  SDI_CDL_AG + 
  SLOPE + ELEVATION + 
  # PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP + 
  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC + 
  perc_corn + chem + fert + labor_expense + machinery + 
  insur_acres + gvt_prog + 
  exp + occup + tenant + acres_per_op 

formula_list[[6]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
  SDI_CDL_AG + 
  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP + 
  # S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC + 
  perc_corn + chem + fert + labor_expense + machinery + 
  insur_acres + gvt_prog + 
  exp + occup + tenant + acres_per_op 

formula_list[[7]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
  SDI_CDL_AG + 
  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP + 
  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC + 
  # perc_corn + chem + fert + labor_expense + machinery + 
  insur_acres + gvt_prog + 
  exp + occup + tenant + acres_per_op 

formula_list[[8]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
  SDI_CDL_AG + 
  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP + 
  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC + 
  perc_corn + chem + fert + labor_expense + machinery + 
  # insur_acres + gvt_prog + 
  exp + occup + tenant + acres_per_op 

formula_list[[9]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
  SDI_CDL_AG + 
  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP + 
  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC + 
  perc_corn + chem + fert + labor_expense + machinery + 
  insur_acres + gvt_prog # + 
# exp + occup + tenant + acres_per_op 

formula_list[[10]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
  SDI_CDL_AG + 
  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP + 
  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC #+ 
#  perc_corn + chem + fert + labor_expense + machinery + 
#  insur_acres + gvt_prog # + 
# exp + occup + tenant + acres_per_op 

formula_list[[11]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
  SDI_CDL_AG + 
  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP #+ 
#  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC #+ 
#  perc_corn + chem + fert + labor_expense + machinery + 
#  insur_acres + gvt_prog # + 
# exp + occup + tenant + acres_per_op 

formula_list[[12]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
  SDI_CDL_AG + 
#  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP #+ 
#  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC #+ 
#  perc_corn + chem + fert + labor_expense + machinery + 
#  insur_acres + gvt_prog # + 
# exp + occup + tenant + acres_per_op 

formula_list[[13]] <- YIELD ~ 
  YEAR + lon + lat + FRR + 
#   SDI_CDL_AG + 
#  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP #+ 
#  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC #+ 
#  perc_corn + chem + fert + labor_expense + machinery + 
#  insur_acres + gvt_prog # + 
# exp + occup + tenant + acres_per_op 

formula_list[[14]] <- YIELD ~ 
  YEAR + lon + lat + # FRR + 
#   SDI_CDL_AG + 
#  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP #+ 
#  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC #+ 
#  perc_corn + chem + fert + labor_expense + machinery + 
#  insur_acres + gvt_prog # + 
# exp + occup + tenant + acres_per_op 

formula_list[[15]] <- YIELD ~ 
  YEAR + FRR + # lon + lat + # FRR + 
  #   SDI_CDL_AG + 
  #  SLOPE + ELEVATION + 
  PERC_IRR + GDD + BV2 + BV4 + BV8 + BV9 + BV15 + BV18 + BV19 + TP #+ 
#  S_PH_H2O + T_CEC_SOIL + T_REF_BULK_DENSITY + T_OC #+ 
#  perc_corn + chem + fert + labor_expense + machinery + 
#  insur_acres + gvt_prog # + 
# exp + occup + tenant + acres_per_op 

formula_labels <- c(
  "full",
  "spatiotemporal", 
  "diversity",
  "topography",
  "climate", 
  "soil",
  "farm inputs", 
  "farm assistance", 
  "farm management", 
  "all farm",
  "farm + soil", 
  "farm + soil + topography",
  "farm + soil + topography +\ndiversity",
  "farm + soil + topography +\ndiversity + FRR",
  "farm + soil + topography +\ndiversity + lon/lat"
)


