#### Preamble ####
# Purpose: Replicate Figure 1 from the original paper
# Author: Yiyi Feng
# Date: 13 February 2024
# Contact: yiyi.feng@mail.utoronto.ca
# License: MIT
# Pre-requisites: [s1_us_2018.rds, s2_dk_2019.rds, s3_us_2019.rds, s4_us_2021.rds]
# Any other information needed? nope


#### Workspace setup ####
# import and load packages
if (!require("pacman")) install.packages("pacman")
pacman::p_load("stargazer", "here", "gridExtra", "weights", "tidyverse",
               "jtools", "clubSandwich", "lm.beta")
# load data
df.us <- readRDS(here("main_folder/data/raw_data", "s1_us_2018.rds"))      
df.dk <- readRDS(here("main_folder/data/raw_data", "s2_dk_2019.rds"))    
df.us2 <- readRDS(here("main_folder/data/raw_data", "s3_us_2019.rds"))
df.us3.part <- readRDS(here("main_folder/data/raw_data", "s4_us_2021.rds"))  %>% 
  filter(part_online > 0 & part_offline > 0)  

# US 
# make neat long df with only tone ratings
p1.us <- df.us %>%  
  select(tone_offline_neg, tone_online_neg) %>% 
  gather(environment, value, 1:2) %>% 
  mutate(environment = fct_recode(environment, 
                                  Offline = "tone_offline_neg",
                                  Online = "tone_online_neg"), 
         environment = fct_rev(environment)) %>% 
  # create actual plot 
  ggplot(., aes(x = value, fill = environment)) + 
  geom_density(alpha = 0.6) + 
  xlab("") + 
  ylab("Density") + 
  scale_fill_grey(guide = FALSE) + 
  ggtitle("A. USA") +
  theme_bw()

# DK
# make neat long df with only tone ratings
p1.dk <- df.dk %>%  
  select(tone_offline_neg, tone_online_neg) %>% 
  gather(environment, value, 1:2) %>% 
  mutate(environment = fct_recode(environment, 
                                  Offline = "tone_offline_neg",
                                  Online = "tone_online_neg"), 
         environment = fct_rev(environment)) %>% 
  # create actual plot 
  ggplot(., aes(x = value, fill = environment)) + 
  geom_density(alpha = 0.6) + 
  xlab("") + 
  ylab("") + 
  scale_fill_grey(name = NULL) + 
  ggtitle("B. Denmark") +
  theme_bw()

# combine the two panels 
p1 <- arrangeGrob(p1.us, p1.dk, ncol = 2, widths = c(0.45, 0.55))


