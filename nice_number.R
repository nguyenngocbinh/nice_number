rm(list = ls())
library(tidyverse)
library(magrittr)
options(scipen=10)
sub_bay <- function(num){num %>% format(digit = 10) %>% str_sub(start = 2L, end = 8L)}
sub_sau <- function(num){num %>% format(digit = 10) %>% str_sub(start = 2L, end = 7L)}
sub_nam <- function(num){num %>% format(digit = 10) %>% str_sub(start = 2L, end = 6L)}
sub_bon <- function(num){num %>% format(digit = 10) %>% str_sub(start = 2L, end = 5L)}
sub_ba <- function(num){num %>% format(digit = 10) %>% str_sub(start = 2L, end = 4L)}

#=============================================================================
# CONG THUC SO DEP ------ V7 -------
#=============================================================================
# aaaaaaa
v71 <- 1e7 + 1111111 * 0:9

# a(a+1)...(a+6)
v72 <- 1e7 + 0123456 + 1111111 * 0:3

# aaaaa(a+1)(a+2)
v73 <- 1e7 + 0000012 + 1111111 * 0:7

# aaaa(a+1)(a+2)(a+3)
v74 <- 1e7 + 0000123 + 1111111 * 0:6

# a(a+1)(a+2)a(a+1)(a+2)(a+3)
v75 <- 1e7 + 0121234 + 1111111 * 0:5

# aaaaaab
v7a <- list(x = 1e7 + 1111110 * 0:9,
            y = 1 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# aaaaabb
v7b <- list(x = 1e7 + 1111100 * 0:9,
            y = 11 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# aaaabbb
v7c <- list(x = 1e7 + 1111000 * 0:9,
            y = 111 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# aaabbbb
v7d <- list(x = 1e7 + 1110000 * 0:9,
            y = 1111 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# aabbbbb
v7e <- list(x = 1e7 + 1100000 * 0:9,
            y = 11111 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

#------ aaabcbc
library(gtools)
v7f <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X1, X1, X2, X3, X2, X3)) %>% 
  pull(x4)

#------ ababccc
v7g <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X2, X1, X2, X3, X3, X3)) %>% 
  pull(x4)

# ------ aaabbcc
v7ga <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X1, X1, X2, X2, X3, X3)) %>% 
  pull(x4)

# ------ aabbccc
v7gb <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X1, X2, X2, X3, X3, X3)) %>% 
  pull(x4)

# ------ aabbbaa 
v7h <- list(a = 1e7 + 1100011 * 0:9,
            b = 11100 * 0:9) %>%
  cross() %>%
  map_dbl(lift(sum))

# ------ aababaa 
v7i <- list(a = 1e7 + 1101011 * 0:9,
            b = 10100 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ------ abababa 
v7k <- list(a = 1e7 + 1010101*0:9,
            b = 101010 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ----- aababaa 
v7l <- list(a = 1e7 + 1101011*0:9,
            b = 10100 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# # ----- abcccab
# v7m <- list(a = 1e7 + 1000010*0:9,
#             b = 100001 * 0:9,
#             c = 11100 * 0:9) %>%
#   cross() %>%
#   map_dbl(lift(sum))

# ----- aaabaaa
v7n <- list(a = 1e7 + 1110111*0:9,
            b = 1000 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

v7 <- c(v71, v72, v73, v74, v75, v7a, v7b, v7c, v7d, v7e,
        v7f, v7g, v7ga, v7gb, v7h, v7i, v7k, v7l, v7n) 

df_v7 <- data.frame(so_dep = v7) %>% 
  mutate(tag = case_when(so_dep %in% v71 ~ "aaaaaaa",
                         so_dep %in% v72 ~ "a(a+1)...(a+6)",
                         so_dep %in% v73 ~ "aaaaa(a+1)(a+2)",
                         so_dep %in% v74 ~ "aaaa(a+1)(a+2)(a+3)",
                         so_dep %in% v75 ~ "a(a+1)(a+2)a(a+1)(a+2)(a+3)",
                         so_dep %in% v7a ~ "aaaaaab",
                         so_dep %in% v7b ~ "aaaaabb",
                         so_dep %in% v7c ~ "aaaabbb",
                         so_dep %in% v7d ~ "aaabbbb",
                         so_dep %in% v7e ~ "aabbbbb",
                         so_dep %in% v7f ~ "aaabcbc",
                         so_dep %in% v7ga ~ "aaabbcc",
                         so_dep %in% v7gb ~ "aabbccc",
                         so_dep %in% v7h ~ "aabbbaa",
                         so_dep %in% v7i ~ "aababaa",
                         so_dep %in% v7k ~ "abababa",
                         so_dep %in% v7l ~ "aababaa",
                         so_dep %in% v7n ~ "aaabaaa"
                         )) %>% 
  mutate(so_dep = sub_bay(so_dep),
         loai = "V7") %>%
  distinct()


#=============================================================================
# CONG THUC SO DEP ------ V6 -------
#=============================================================================

# aaaaaa
v61 <- 1e6 + 111111 * 0:9

# a(a+1)..(a+5)
v62 <- 1e6 + 012345 + 111111 * 0:4
# aabbcc
v63 <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X1, X2, X2, X3, X3)) %>% 
  pull(x4)

# aaabbb
v64 <- list(x = 1e6 + 111000 * 0:9,
            y = 111 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ababab
v65 <- list(x = 1e6 + 0:99*1e4,
            y = 0:99*1e2,
            z = 0:99) %>%
  pmap_dbl(sum)

# abcabc
v66 <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X2, X3, X1, X2, X3)) %>% 
  pull(x4)

# aaaabb
v67 <- list(x = 1e6 + 111100 * 0:9,
            y = 11 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# aabbbb
v68 <- list(x = 1e6 + 110000 * 0:9,
            y = 1111 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ---- abccba
v69 <- list(a = 1e6 + 100001 * 0:9,
            b = 10010 * 0:9,
            c = 1100 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

v6 <- c(v61, v62, v63, v64, v65, v66, v67, v68, v69) 

df_v6 <- data.frame(so_dep = v6) %>% 
  mutate(tag = case_when(so_dep %in% v61 ~ "aaaaaa",
                         so_dep %in% v62 ~ "a(a+1)..(a+5)",
                         so_dep %in% v63 ~ "aabbcc",
                         so_dep %in% v64 ~ "aaabbb",
                         so_dep %in% v65 ~ "ababab",
                         so_dep %in% v66 ~ "abcabc",
                         so_dep %in% v67 ~ "aaaabb",
                         so_dep %in% v68 ~ "aabbbb",
                         so_dep %in% v69 ~ "abccba"
                         ))%>% 
  mutate(so_dep = sub_sau(so_dep),
         loai = "V6") %>%
  distinct()


#=============================================================================
# CONG THUC SO DEP ------ V5 -------
#=============================================================================
# aaaaa
v51 <- 1e5 + 11111 * 0:9
# a(a+1)..(a+4)
v52 <- 1e5 + 01234 + 11111 * 0:5
# aaabb
v53 <- list(x = 1e5 + 11100 * 0:9,
            y = 11 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))
# aabbb
v54 <- list(x = 1e5 + 11000 * 0:9,
            y = 111 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))
# abcab 
v55 <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X2, X3, X1, X2)) %>% 
  pull(x4)

# abcba
v56 <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X2, X3, X2, X1)) %>% 
  pull(x4)

v5 <- c(v51, v52, v53, v54, v55, v56) 

df_v5 <- data.frame(so_dep = v5) %>% 
  mutate(tag = case_when(so_dep %in% v51 ~ "aaaaa",
                         so_dep %in% v52 ~ "a(a+1)..(a+4)",
                         so_dep %in% v53 ~ "aaabb",
                         so_dep %in% v54 ~ "aabbb",
                         so_dep %in% v55 ~ "abcab",
                         so_dep %in% v56 ~ "abcba"

  ))%>% 
  mutate(so_dep = sub_nam(so_dep),
         loai = "V5") %>%
  distinct()

#=============================================================================
# CONG THUC SO DEP ------ V4 -------
#=============================================================================
v41 <- 1e4 + 1111 * 0:9
v42 <- 1e4 + 0123 + 1111 * 0:6
# aabb
v43 <- list(x = 1e4 + 1100 * 0:9,
            y = 11 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))
# abab
v44 <- list(x = 1e4 + 0:99 * 1e2,
            y = 0:99) %>%
  pmap_dbl(sum)
# abba
v45 <- list(x = 1e4 + 1001 * 0:9,
            y = 110 * 0:9) %>%
  cross() %>%
  map_dbl(lift(sum))
v46 <- 13979

v4 <- c(v41, v42, v43, v44, v45, v46) 

df_v4 <- data.frame(so_dep = v4) %>% 
  mutate(tag = case_when(so_dep %in% v41 ~ "aaaa",
                         so_dep %in% v42 ~ "a(a+1)..(a+3)",
                         so_dep %in% v43 ~ "aabb",
                         so_dep %in% v44 ~ "abab",
                         so_dep %in% v45 ~ "abba",
                         so_dep %in% v46 ~ "3979"
                         
  ))%>% 
  mutate(so_dep = sub_bon(so_dep),
         loai = "V4") %>%
  distinct()

#=============================================================================
# CONG THUC SO DEP ------ V3 -------
#=============================================================================
v31 <- 1e3 + 111 * 0:9
v32 <- 1e3 + 012 + 111 * 0:7
# aba
v33 <- list(x = 1e3 + 101 * 0:9,
            y = 10 * 0:9) %>%
  cross() %>%
  map_dbl(lift(sum))

# aab

v34 <- list(x = 1e3 + 110 * 0:9,
            y = 1 * 0:9) %>%
  cross() %>%
  map_dbl(lift(sum))

# abb
v35 <- list(x = 1e3 + 100 * 0:9,
            y = 11 * 0:9) %>%
  cross() %>%
  map_dbl(lift(sum))

v3 <- c(v31, v32, v33, v34, v35)  

df_v3 <- data.frame(so_dep = v3) %>% 
  mutate(tag = case_when(so_dep %in% v31 ~ "aaa",
                         so_dep %in% v32 ~ "a(a+1)(a+2)",
                         so_dep %in% v33 ~ "aba",
                         so_dep %in% v34 ~ "aab",
                         so_dep %in% v35 ~ "abb"
                         
  ))%>% 
  mutate(so_dep = sub_ba(so_dep),
         loai = "V3") %>%
  distinct()

#=============================================================================
# CONG THUC SO DEP
#=============================================================================
day_so <- data.frame(so = 1e7 + 0:9999999)

df_so_dep <- rbind(df_v7, df_v6, df_v5, df_v4, df_v3)

kq_v7 <- day_so %>% 
  mutate(so_dep = substr(so, 2, 8)) %>% 
  inner_join(df_v7)

kq_v6 <- day_so %>% 
  mutate(so_dep = substr(so, 3, 8)) %>% 
  inner_join(df_v6)

kq_v5 <- day_so %>% 
  mutate(so_dep = substr(so, 4, 8)) %>% 
  inner_join(df_v5)

kq_v4 <- day_so %>% 
  mutate(so_dep = substr(so, 5, 8)) %>% 
  inner_join(df_v4)

kq_v3 <- day_so %>% 
  mutate(so_dep = substr(so, 6, 8)) %>% 
  inner_join(df_v3)

kq <- rbind(kq_v7, kq_v6, kq_v5, kq_v4, kq_v3) %>% 
  mutate(so_dep = substr(so, 2, 8))

kq <- kq %>% 
  distinct(so_dep, .keep_all = TRUE)

kq$so <- NULL

save(kq, file = "kq.RData")


# Xuat ra excel

kq_4567 <- kq %>% filter(loai %in% c("V4", "V5", "V6", "V7"))
kq_3 <- kq %>% filter(loai == "V3")
kq_3a <- kq_3 %>% slice(1:9e5)
kq_3b <- kq_3 %>% slice(900001:18e5)
kq_3c <- kq_3 %>% slice(1800001:3e6)

list(kq_4567 = kq_4567,
     kq_3a = kq_3a,
     kq_3b = kq_3b,
     kq_3c = kq_3c) %>% 
  writexl::write_xlsx("kq.xlsx")

data.table::fwrite(kq, "kq.csv")
#=============================================================================
# Kiem tra lai ket qua
kq$loai %>% table()
kq %>% filter(loai == "V4") %>%  pull(so)->x
xx <- x %>% sub_bon()

setdiff(v4, xx)
