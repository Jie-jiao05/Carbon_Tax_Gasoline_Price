library(readr)
library(dplyr)
library(lubridate)
library(here)
# 1) 直接读取 StatCan 在线 CSV（无需下载 ZIP）


cpi_raw <- read_csv("18100004.csv)

# 2) 过滤 Gasoline + 时间范围
gasoline_cpi <- cpi_raw %>%
  filter(`Products and product groups` == "Gasoline") %>%
  mutate(ym = ym(REF_DATE)) %>%
  filter(ym >= ym("2017-01"),
         ym <= ym("2025-09")) %>%
  arrange(GEO, ym)

# 查看结果
head(gasoline_cpi)
