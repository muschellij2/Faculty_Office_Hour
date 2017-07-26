library(ggplot2)
df = data.frame(x = rnorm(1000),
                y = rnorm(1000),
                group = sample(letters[1:5], 
                               size = 1000, 
                               replace = TRUE),
                stringsAsFactors = FALSE)

gbase = ggplot(data = df,
           aes(x = x, y = y))
g = gbase + geom_point(aes(colour = group))
g2 = g + geom_smooth(se = FALSE)
# g + geom_smooth(se = FALSE) + 
#   facet_wrap(~group)
# 
g + geom_smooth(aes(colour = group),
                se = FALSE) +
  facet_wrap(~group, ncol = 1)

df$outcome = df$y > 0
p = ggplot(data = df,
       aes(x = x))
p + geom_density(aes(fill = group), 
                 alpha = 0.5)

p + geom_density(aes(colour = group))
p + geom_line(aes(colour = group), 
              stat = "density")

pnew = p + geom_line(aes(colour = outcome),
              stat= "density") +
  facet_wrap(~ group, ncol = 1)
# pnew %+% df

