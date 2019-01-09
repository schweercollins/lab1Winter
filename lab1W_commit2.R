
* You’ll want to count the number of times a screen name appears and select only the top 25. + Consider arranging in descending order, then using dplyr::slice 
* Make the screen name a factor, ordered according to the number of times it appears. + Consider forcats::fct_reorder * coord_flip will be your friend here

install.packages(c('here', 'forcats'))
library(rio)
library(here)
library(tidyverse)
library(forcats)

```{r commit2}
supd <- import(here("data", "rstats_tweets.rds"))

supd %>% 
  count(screen_name) %>% 
  arrange(desc(n)) %>% 
dplyr::slice(1:25)

supd <- supd %>% 
  count(screen_name) %>% 
  arrange(desc(n)) %>% 
  dplyr::slice(1:25)

supd <- supd %>% 
mutate(screen_name = fct_reorder(screen_name, n))

View(supd$screen_name)

p1 <- supd %>% 
  ggplot(aes(x = screen_name, y = n)) +
  geom_col() +
  coord_flip()
p1
```