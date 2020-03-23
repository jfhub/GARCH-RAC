library(tidyverse)
library(FinTS)
library(rugarch)
library(writexl)

graphics.off()

my_d <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(my_d)

source('fcts/garch_fcts.R')

# get price data
df_ibov <- read_rds('data/RAC-GARCH-Data.rds')

my_garch <- fGarch::garchFit(formula = ~arma(0,0)+garch(1,1),
                 data = df_ibov$ret)

my_garch

texreg::htmlreg(my_garch, file = 'tabs/garch_tab.html', custom.model.names = 'Ibovespa')


