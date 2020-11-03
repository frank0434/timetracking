library(jsonlite)
library(ggplot2)
library(magrittr)
library(forcats)


data <- fromJSON(txt = "Data/projects.json")
data$name <- fct_reorder(data$name, data$actual_hours)
cols <- colorRampPalette(c("red", "blue"))(8)
names(cols) <- unique(data$name)

data %>%
  ggplot(aes(name, actual_hours, fill = name))+
  geom_col()+
  geom_text(aes(label = actual_hours),vjust="inward",hjust="inward") +
  coord_flip() +
  guides(fill = guide_legend(reverse = TRUE, title = "Project Name"))+
  theme_bw() +
  scale_y_continuous(expand = c(0,0)) +
  labs(x = "", y = "Actual hours recorded")


