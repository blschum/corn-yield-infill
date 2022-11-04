load("results/cv_results_11032022_3.Rdata")
source("scripts/formula_prep.R")
library(tidyverse)

# Preliminary plots
# My function forgot to take the square root of the MSE so I do it in 
# the plot. 
p1 <- tdf |> filter(formula != 1) |>
  ggplot(aes(x = factor(formula, levels = c(5, 2, 3, 4, 6:15)), 
             y = sqrt(rmse))) + 
  geom_hline(yintercept = sqrt(median(tdf$rmse[tdf$formula == 1])), 
             lwd = 1, lty = 2) + 
  geom_boxplot() + 
  #scale_x_discrete(labels = formula_labels[c(5, 2, 3, 4, 6:15)]) + 
  scale_y_continuous(limits = c(16.4, 20.6), breaks = seq(16.5, 20.5, 1)) + 
  coord_flip() +
  xlab("") + 
  ylab("RMSE") + 
  theme_bw() + 
  theme(text = element_text(size = 16))

p2 <- tdf |> filter(formula != 1) |>
  ggplot(aes(x = factor(formula, levels = c(5, 2, 3, 4, 6:15)), 
             y = mae)) + 
  geom_hline(yintercept = median(tdf$mae[tdf$formula == 1]), 
             lwd = 1, lty = 2) + 
  geom_boxplot() + 
  scale_x_discrete(labels = formula_labels[c(5, 2, 3, 4, 6:15)]) + 
  scale_y_continuous(limits = c(9.5, 12.5), breaks = seq(9.5, 12.5, 1)) + 
  coord_flip() +
  xlab("") + 
  ylab("MAE") + 
  theme_bw() + 
  theme(text = element_text(size = 16),
        axis.text.y = element_blank(), 
        axis.ticks.y = element_blank())

p3 <- tdf |> filter(formula != 1) |>
  ggplot(aes(x = factor(formula, levels = c(5, 2, 3, 4, 6:15)), 
             y = smape*100)) + 
  geom_hline(yintercept = median(tdf$smape[tdf$formula == 1]*100), 
             lwd = 1, lty = 2) + 
  geom_boxplot() + 
  scale_x_discrete(labels = formula_labels[c(5, 2, 3, 4, 6:15)]) + 
  scale_y_continuous(limits = c(5, 6.5), breaks = seq(5, 6.5, .5)) + 
  coord_flip() +
  xlab("") + 
  ylab("SMAPE") + 
  theme_bw() + 
  theme(text = element_text(size = 16),
        axis.text.y = element_blank(), 
        axis.ticks.y = element_blank())

#pdf(file = "results/test_importance.pdf", width = 10, height = 6)
jpeg(file = "results/test_importance_new.jpg", width = 10, height = 6,
     units = "in", res = 600)
gridExtra::grid.arrange(p1, p2, p3, widths = c(7, 4, 4), nrow = 1)
dev.off()
