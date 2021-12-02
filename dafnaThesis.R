install.packages('hrbrthemes')
install.packages('viridis')
install.packages('reshape')
library(hrbrthemes)
library(viridis)
library(tidyverse)
library(reshape)
library(cowplot)
Data <- read.csv('dafnaData.csv')
Data <- read.csv('dafnaData2.csv')
attach(Molten)
active <- subset(Molten, CellType == c("LVL1Active", "LVL2Active", "LVL3Active", 
                                      "LVL1preApop", "LVL2preApop", "LVL3preApop"))
supercells <- subset(Molten, CellType == c("LVL3Active", 
                                            "LVL3preApop"))
Molten <- melt(Data, id.vars = "Ticks")
View(Molten)
Molten$CellType <- Molten$variable
ggplot(supercells, aes(x = Ticks, y = value, colour = CellType)) + geom_line() + ylab("Number of Cells") +
labs(title = 'Senescence vs. Apoptosis \n Level 3 Environment')+ 
  theme(legend.key.size = 3, 
        legend.title = element_text(size=10), legend.text = element_text(size=8)) +
  theme_cowplot(12)
