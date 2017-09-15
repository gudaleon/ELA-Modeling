Observed=read.csv("Observed_IntegratedEpi.csv")
attach(Observed)
head(Observed)
dim(Observed)

Output=read.csv("Output_IntegratedEpi.csv")
attach(Output)
head(Output)
dim(Output)

chla=data.frame(Year, Month, Obs_chla, Out_chla)
TDP=data.frame(Year, Month, Obs_TDP, Out_TDP)
TP=data.frame(Year, Month, Obs_TP, Out_TP)

chlareg=lm(Out_chla ~ Obs_chla)
summary(chlareg)
# Call:
# lm(formula = Out_chla ~ Obs_chla)

# Residuals:
    # Min      1Q  Median      3Q     Max 
# -28.940  -7.828  -1.454   5.182  36.964 

# Coefficients:
            # Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  8.41194    0.43969  19.132  < 2e-16 ***
# Obs_chla     0.10144    0.01321   7.681 4.32e-14 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 8.809 on 857 degrees of freedom
  # (30 observations deleted due to missingness)
# Multiple R-squared:  0.0644,	Adjusted R-squared:  0.06331 
# F-statistic: 58.99 on 1 and 857 DF,  p-value: 4.32e-14

chlareg69to74=lm(Out_chla[1:145] ~ Obs_chla[1:145])
summary(chlareg69to74)
# Call:
# lm(formula = Out_chla[1:145] ~ Obs_chla[1:145])

# Residuals:
     # Min       1Q   Median       3Q      Max 
# -13.9075  -6.9150  -0.9485   5.8082  20.6512 

# Coefficients:
                # Estimate Std. Error t value Pr(>|t|)    
# (Intercept)      6.66560    0.86630   7.694 2.67e-12 ***
# Obs_chla[1:145]  0.11904    0.02134   5.579 1.28e-07 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 7.489 on 135 degrees of freedom
  # (8 observations deleted due to missingness)
# Multiple R-squared:  0.1873,	Adjusted R-squared:  0.1813 
# F-statistic: 31.12 on 1 and 135 DF,  p-value: 1.275e-07

chlareg75to89=lm(Out_chla[146:583] ~ Obs_chla[146:583])
summary(chlareg75to89)
# Call:
# lm(formula = Out_chla[146:583] ~ Obs_chla[146:583])

# Residuals:
    # Min      1Q  Median      3Q     Max 
# -21.095  -8.490  -1.390   4.814  33.767 

# Coefficients:
                  # Estimate Std. Error t value Pr(>|t|)    
# (Intercept)        9.27491    0.65221   14.22  < 2e-16 ***
# Obs_chla[146:583]  0.05854    0.01971    2.97  0.00315 ** 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 9.199 on 428 degrees of freedom
  # (8 observations deleted due to missingness)
# Multiple R-squared:  0.02019,	Adjusted R-squared:  0.0179 
# F-statistic: 8.821 on 1 and 428 DF,  p-value: 0.003145

chlareg90to09=lm(Out_chla[584:889] ~ Obs_chla[584:889])
summary(chlareg90to09)
# Call:
# lm(formula = Out_chla[584:889] ~ Obs_chla[584:889])

# Residuals:
    # Min      1Q  Median      3Q     Max 
# -15.911  -6.900  -1.556   5.358  37.395 

# Coefficients:
                  # Estimate Std. Error t value Pr(>|t|)    
# (Intercept)        7.45970    0.79146   9.425  < 2e-16 ***
# Obs_chla[584:889]  0.18028    0.02676   6.737 8.67e-11 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 8.55 on 290 degrees of freedom
  # (14 observations deleted due to missingness)
# Multiple R-squared:  0.1353,	Adjusted R-squared:  0.1324 
# F-statistic: 45.39 on 1 and 290 DF,  p-value: 8.672e-11

RColorBrewer::display.brewer.all()
library(ggplot2)

a=ggplot(chla, aes(x=Obs_chla, y=Out_chla, color=Month)) 
a + geom_point() + geom_abline(slope=1, intercept=0) + theme_bw() + scale_color_distiller(palette="YlGnBu") + scale_x_continuous(limits=c(0,100)) + scale_y_continuous(limits=c(0,100))

b=ggplot(chla, aes(x=Obs_chla, y=Out_chla, color=Year)) 
b + geom_point() + geom_abline(slope=1, intercept=0) + theme_bw() + scale_color_distiller(palette="YlGnBu") + scale_x_continuous(limits=c(0,100)) + scale_y_continuous(limits=c(0,100)) + geom_abline(slope= 0.11904, intercept= 6.66560, color="#253494") + geom_abline(slope= 0.05854, intercept= 9.27491, color="#1d91c0") + geom_abline(slope= 0.18028, intercept=7.45970, color="#7fcdbb")

