

# arrange - sort a df
# mutate - make new/replace cols
# select - subset cols
# rename - rename cols
# filter - subset rows
# group_by - set an attribute of a group - doesn't change data
# summarise/summarize - collapse data (usually after group_by)
# ?select_helpers


rm(list = ls())
library(dplyr)
df = data.frame(x = rnorm(1000),
                y = rnorm(1000),
                z = sample(letters[1:5], 
                           size = 1000, 
                           replace = TRUE),
                stringsAsFactors = FALSE)

select(df, x,y )
select(df, -z)
select(df, y, z, everything()) %>% as.tbl

rename(df, NEWX = x)

df[ order(-df$x), ]
df[ order(-df[, c("x")]), ]

arrange(df, x)
arrange(df, desc(x))
arrange(df, x, desc(y))

df = df %>% 
  mutate(q = ifelse(y < -2.5, "bad", NA),
         q = ifelse(y < 2.5 & is.na(q), "good", q),
         q = ifelse(y >= 2.5 & is.na(q), "large", q)
  )

means = df %>% 
  group_by(z) %>% 
  summarize(mean_x = mean(x),
            sd_x = sd(x))

summarize(group_by(df, z),
          mean_x = mean(x),
          sd_x = sd(x))

means %>% 
  filter(
    z %in% c("b", "c"),
    mean_x >0
    )

filter(means, 
       z == "b")


means2 = df %>% 
  group_by(z) %>% 
  mutate(mean_x = mean(x))

# grab first record by sorting
df %>% 
  arrange(z, x) %>% 
  group_by(z) %>% 
  slice(1)

# grab first record by sorting
df %>% 
  arrange(patient, date) %>% 
  group_by(patient) %>% 
  slice(1)





