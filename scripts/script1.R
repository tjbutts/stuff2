rm(list=ls());                         # clear Environment Window
library(package=ggplot2);              # include all GGPlot2 functions
#### comment comment
weatherData = read.csv(file="data/weatherData.csv");

#### Labels for the facets of the plot
windLabels = c(Low = "Light Winds",
               Medium = "Medium Winds",
               High = "High Winds");

#### Boxplots of Change in Temperature vs. Wind Direction 
#           at different wind speeds
thePlot = ggplot(data=weatherData) +
  geom_boxplot(mapping=aes(x=windDir, y=changeMaxTemp), 
               na.rm=TRUE,
               color=c("blue", rep("black", 3),
                       "green", rep("black", 3),
                       "orange", rep("black", 3)),
               fill=c(rep(NA, 8), rep("red", 3), NA)) +
  facet_grid(rows=.~factor(windSpeedLevel,
                             levels=c("Low", "Medium", "High")),
             labeller=as_labeller(windLabels)) +
  scale_x_discrete(limits=c("North", "East", "South", "West")) +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, MI: 2016",
       x = "Wind Direction",
       y = "Degrees (Fahrenheit)");
plot(thePlot);
