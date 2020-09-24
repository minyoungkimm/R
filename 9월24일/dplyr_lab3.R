# 문제1
mpg <- as.data.frame(ggplot::mpg)
str(mpg)

# 1_1
mpg %>% mutate(sum = cty+hwy) -> mpg

# 1_2
mpg %>% mutate(mean = sum/2) -> mpg

# 1_3
mpg %>% arrange(desc(mean)) %>% head(3)

# 1_4
library(ggplot2)
mpg <- as.data.frame(mpg)
str(mpg)
mpg %>% 
  mutate(sum = cty + hwy, mean = sum / 2) %>%
  arrange(desc(mean)) %>% 
  head(3)



# 문제2
mpg <- as.data.frame(mpg)
# 2_1
mpg %>%
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

# 2_2
mpg %>%
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

# 2_3
mpg %>%
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

# 2_4
mpg %>%
  group_by(manufacturer) %>% 
  filter(class == "compact") %>%
  summarise(n = n()) %>% 
  arrange(desc(n))



# 문제3
mpg <- as.data.frame(mpg)
# 3_1
