library(quantmod)
library(tidyquant)
library(reshape2)
library(PerformanceAnalytics)
library(ggplot2)



metalco <- (c("RYI", "RS", "ZEUS", "TSE", "ZEUS", "WOR", "TYHOF", "ALR", "WOR", "STTX", "RUSMF") %>%
tq_get(get = c("financials", "key.ratios")))



ratios <- metalco%>%unnest(key.ratios)%>%unnest(data)

#function for filter and graph
# filt <- function(ratio){
#   ratio.filter <- ratios%>%
#     filter(category == ratio)
#   ggplot(data=ratio.filter, aes(x=date, y=value, group = symbol, colour = symbol)) +
#     geom_line()+facet_wrap(~symbol) + ggtitle(ratio.filter$category) + scale_y_continuous()
# }


?tq_exchange
