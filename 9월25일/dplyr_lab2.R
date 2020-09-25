# 문제1
library(ggplot2)
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)

# 1-1
str(mpg)
# 1-2
dim(mpg)
# 1-3
mpg %>% head(10)
# 1-4
mpg %>% tail(10)
# 1-5
print(mpg)
# 1-6
summary(mpg)
# 1-7
mpg %>% 
  group_by(manufacturer) %>% 
  count
# 1-8
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mf_n=n())

mpg2 %>% 
  group_by(model) %>% 
  summarise(model_n=n())


# 문제2
# 2-1
mpg %>% rename(city=cty,highway=hwy)
# 2-2
mpg[1:6,]


# 문제3
# 3-1
midwest <- as.data.frame(ggplot2::midwest)
str(midwest)
dim(midwest)
summary(midwest)
# 3-2
midwest %>% rename(total=poptotal,asian=popasian) -> midwest
# 3-3
midwest %>% mutate(prob_asian = asian/total*100) -> midwest
# 3-4
midwest %>% 
  mutate(mean_asian=mean(prob_asian),
         size_asian=ifelse(prob_asian > mean_asian,"large","small"))


# 문제4
# 4-1
mpg %>% 
  mutate(displ_class=ifelse(displ <= 4,"down4",ifelse(displ >= 5,"up5","4to5"))) %>% 
  group_by(displ_class) %>% 
  summarise(hwy_mean=mean(hwy))

# 4-2
mpg %>% 
  filter(manufacturer=="audi"|manufacturer=="toyota") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_city=mean(cty))

# 4-3
mpg %>% 
  filter(manufacturer %in% c("chevrolet","ford","honda")) %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy=mean(hwy))


# 문제5
# 5-1
mpg %>% 
  select(class,cty) -> mpg_sub
head(mpg_sub)

# 5-2
mpg %>% 
  filter(class %in% c("suv","compact")) %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty))


# 문제6
mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)
