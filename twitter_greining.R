
# Package to get tweets
library(rtweet)

# Package for data analysis

library(tidyverse)
library(lubridate)

# Package for text analysis
# library(RColorBrewer)
# library(wordcloud)
# library(tm)
# library(tidytext)

# -------------------------------------------------------------------------

a_tweet <- search_tweets(q = "a",
                    lang = "is",
                    n = 18000,
                    include_rts = FALSE,
                    retryonratelimit = TRUE)


dags <- today() - 1

aa_tweet <- a_tweet %>%
    mutate(date = as.Date(created_at)) %>%
    filter(date == dags)

old_tweet <- read_csv("twitter.csv")
new_tweet <- bind_rows(old_tweet, aa_tweet)

saveRDS(new_tweet, "twitter.rds")


# rt_vikan <- rt %>%
#     mutate(date = ymd(as.Date(created_at))) %>%
#     filter(date >= "2019-08-30" & date <= "2019-09-06")
#
# rt_vikan %>%
#     ts_plot("1 hour") +
#     ggplot2::theme_minimal()





# # Hreinsun ----------------------------------------------------------------
#
# removeURL <- function(x) gsub("http[^[:space:]]*", "", x)
# remove_url <- "http[^[:space:]]*"
#
#
#
# rt_vikan <- rt_vikan %>%
#     mutate(hreinn_texti = gsub(remove_url, "", text))
#
# rt_vikan$hreinn_texti <- gsub("\\.", "", rt_vikan$hreinn_texti)
# rt_vikan$hreinn_texti <- tolower(rt_vikan$hreinn_texti)
#
# rt_vikan <- rt_vikan %>%
#     select(hreinn_texti) %>%
#     unnest_tokens(word, hreinn_texti)
#
#
# # Smáorð skv. wikipedia
# smaord <- readxl::read_excel("smaord.xlsx") %>% janitor::clean_names()
# smaord <- unique(smaord$ordin)
#
# rt_vikan <- rt_vikan %>%
#     filter(!(word %in% smaord),
#            !(nchar(word) <= 2))
#
#
# rt_vikan %>%
#     count(word, sort = TRUE) %>%
#     top_n(20) %>%
#     mutate(word = reorder(word, n)) %>%
#     ggplot(aes(x = word,
#                y = n)) +
#     geom_col() +
#     coord_flip()



