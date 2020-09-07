# Author: Nguyen Ngoc Binh
# Date update: 07/09/2020
# Them so dep V4: aaab, V5: aaaab, V6: aaaaab

rm(list = ls())
library(tidyverse)
library(magrittr)
library(data.table)
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

# ----- aaababa
v7o <- list(a = 1e7 + 1110101*0:9,
            b = 1010 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ----- ababaaa
v7p <- list(a = 1e7 + 1010111*0:9,
            b = 101000 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ----- aabbaaa
v7q <- list(a = 1e7 + 1100111*0:9,
            b = 11000 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ----- ababbbb
v7r <- list(a = 1e7 + 1010000*0:9,
            b = 101111 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ----- aaaabab
v7t <- list(a = 1e7 + 1111010*0:9,
            b = 101 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ----- aaabbaa
v7x <- list(a = 1e7 + 1110011*0:9,
            b = 1100 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))



v7 <- c(v71, v72, v73, v74, v75, v7a, v7b, v7c, v7d, v7e,
        v7f, v7g, v7ga, v7gb, v7h, v7i, v7k, v7l, v7n, 
        v7o, v7p, v7q, v7r, v7t, v7x) 

df_v7 <- data.table(so_dep = v7)
df_v7[, tag := case_when(so_dep %in% v71 ~ "aaaaaaa",
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
                         so_dep %in% v7g ~ "ababccc",
                         so_dep %in% v7ga ~ "aaabbcc",
                         so_dep %in% v7gb ~ "aabbccc",
                         so_dep %in% v7h ~ "aabbbaa",
                         so_dep %in% v7i ~ "aababaa",
                         so_dep %in% v7k ~ "abababa",
                         so_dep %in% v7l ~ "aababaa",
                         so_dep %in% v7n ~ "aaabaaa",
                         so_dep %in% v7o ~ "aaababa",
                         so_dep %in% v7p ~ "ababaaa",
                         so_dep %in% v7q ~ "aabbaaa",
                         so_dep %in% v7r ~ "ababbbb",
                         so_dep %in% v7t ~ "aaaabab",
                         so_dep %in% v7x ~ "aaabbaa")
    ][, `:=` (so_dep= sub_bay(so_dep),
      loai = "V7") ] %>% 
  unique()


#=============================================================================
# CONG THUC SO DEP ------ V6 -------
#=============================================================================

# aaaaaa
v601 <- 1e6 + 111111 * 0:9

# a(a+1)..(a+5)
v602 <- 1e6 + 012345 + 111111 * 0:4
# aabbcc
v603 <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X1, X2, X2, X3, X3)) %>% 
  pull(x4)

# aaabbb
v604 <- list(x = 1e6 + 111000 * 0:9,
            y = 111 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ababab
v605 <- list(x = 1e6 + 0:99*1e4,
            y = 0:99*1e2,
            z = 0:99) %>%
  pmap_dbl(sum)

# abcabc
v606 <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X2, X3, X1, X2, X3)) %>% 
  pull(x4)

# aaaabb
v607 <- list(x = 1e6 + 111100 * 0:9,
            y = 11 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# aabbbb
v608 <- list(x = 1e6 + 110000 * 0:9,
            y = 1111 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ---- abccba
v609 <- list(a = 1e6 + 100001 * 0:9,
            b = 10010 * 0:9,
            c = 1100 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ---- aabbaa
v610 <- list(a = 1e6 + 110011 * 0:9,
             b = 1100 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))


# ---- abaaba
v611 <- list(a = 1e6 + 101101 * 0:9,
             b = 10010 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ---- abbabb
v612 <- list(a = 1e6 + 100100 * 0:9,
             b = 11011 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ---- abbbba
v613 <- list(a = 1e6 + 100001 * 0:9,
             b = 11110 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ---- aabaab
v614 <- list(a = 1e6 + 110110 * 0:9,
             b = 1001 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ---- aaaaab
v615 <- list(a = 1e6 + 111110 * 0:9,
             b = 1 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))


v6 <- c(v601, v602, v603, v604, v605, v606, v607, v608, v609, v610, v611, v612, v613, v614, v615) 

df_v6 <- data.table(so_dep = v6)
df_v6[, tag := case_when(so_dep %in% v601 ~ "aaaaaa",
                         so_dep %in% v602 ~ "a(a+1)...(a+5)",
                         so_dep %in% v603 ~ "aabbcc",
                         so_dep %in% v604 ~ "aaabbb",
                         so_dep %in% v605 ~ "ababab",
                         so_dep %in% v606 ~ "abcabc",
                         so_dep %in% v607 ~ "aaaabb",
                         so_dep %in% v608 ~ "aabbbb",
                         so_dep %in% v609 ~ "abccba",
                         so_dep %in% v610 ~ "aabbaa",
                         so_dep %in% v611 ~ "abaaba",
                         so_dep %in% v612 ~ "abbabb",
                         so_dep %in% v613 ~ "abbbba",
                         so_dep %in% v614 ~ "aabaab",
                         so_dep %in% v615 ~ "aaaaab"
                         )
      ][,`:=` (so_dep = sub_sau(so_dep),
              loai = "V6") 
      ] %>% unique()

#=============================================================================
# CONG THUC SO DEP ------ V5 -------
#=============================================================================
# aaaaa
v501 <- 1e5 + 11111 * 0:9
# a(a+1)..(a+4)
v502 <- 1e5 + 01234 + 11111 * 0:5
# aaabb
v503 <- list(x = 1e5 + 11100 * 0:9,
            y = 11 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))
# aabbb
v504 <- list(x = 1e5 + 11000 * 0:9,
            y = 111 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))
# abcab 
v505 <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X2, X3, X1, X2)) %>% 
  pull(x4)

# abcba
v506 <- data.frame(permutations(10, 3, 0:9)) %>% 
  mutate(x4 = paste0("1", X1, X2, X3, X2, X1)) %>% 
  pull(x4)

# abaab
v507 <- list(x = 1e5 + 10110 * 0:9,
             y = 1001 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# ababa
v508 <- list(x = 1e5 + 10101 * 0:9,
             y = 1010 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# abbab
v509 <- list(x = 1e5 + 10010 * 0:9,
             y = 1101 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# abbba
v510 <- list(x = 1e5 + 10001 * 0:9,
             y = 1110 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# aabaa
v511 <- list(x = 1e5 + 11011 * 0:9,
             y = 100 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

# aaaab
v512 <- list(x = 1e5 + 11110 * 0:9,
             y = 1 * 0:9) %>% 
  cross() %>%
  map_dbl(lift(sum))

v5 <- c(v501, v502, v503, v504, v505, v506, v507, v508, v509, v510, v511, v512) 

df_v5 <- data.table(so_dep = v5)

df_v5[,tag := case_when(so_dep %in% v501 ~ "aaaaa",
                        so_dep %in% v502 ~ "a(a+1)...(a+4)",
                        so_dep %in% v503 ~ "aaabb",
                        so_dep %in% v504 ~ "aabbb",
                        so_dep %in% v505 ~ "abcab",
                        so_dep %in% v506 ~ "abcba",
                        so_dep %in% v507 ~ "abaab",
                        so_dep %in% v508 ~ "ababa",
                        so_dep %in% v509 ~ "abbab",
                        so_dep %in% v510 ~ "abbba",
                        so_dep %in% v511 ~ "aabaa",
                        so_dep %in% v512 ~ "aaaab"

  )][,`:=` (so_dep = sub_nam(so_dep),
          loai = "V5")] %>%
  unique()

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

v47 <- list(x = 1e4 + 1110 * 0:9,
            y = 1 * 0:9) %>%
  cross() %>%
  map_dbl(lift(sum))

v4 <- c(v41, v42, v43, v44, v45, v46, v47) 

df_v4 <- data.table(so_dep = v4)

df_v4[, tag := case_when(so_dep %in% v41 ~ "aaaa",
                         so_dep %in% v42 ~ "a(a+1)...(a+3)",
                         so_dep %in% v43 ~ "aabb",
                         so_dep %in% v44 ~ "abab",
                         so_dep %in% v45 ~ "abba",
                         so_dep %in% v46 ~ "3979",
                         so_dep %in% v47 ~ "aaab"
                         
  )][,`:=`(so_dep = sub_bon(so_dep),
         loai = "V4")] %>% 
  unique()

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

df_v3 <- data.table(so_dep = v3)
df_v3[, tag := case_when(so_dep %in% v31 ~ "aaa",
                         so_dep %in% v32 ~ "a(a+1)(a+2)",
                         so_dep %in% v33 ~ "aba",
                         so_dep %in% v34 ~ "aab",
                         so_dep %in% v35 ~ "abb"
                         
  )][,`:=`(so_dep = sub_ba(so_dep),
         loai = "V3")] %>%
  unique()

#=============================================================================
# CONG THUC SO DEP
#=============================================================================
day_so <- data.table(so = 1e7 + 0:9999999)

# df_so_dep <- rbind(df_v7, df_v6, df_v5, df_v4, df_v3)

setkey(df_v7, so_dep)
setkey(df_v6, so_dep)
setkey(df_v5, so_dep)
setkey(df_v4, so_dep)
setkey(df_v3, so_dep)


ghep <- function(dt2, ct){
  m <- day_so %>% 
    mutate(so_dep = substr(so, ct, 8)) %>% 
    inner_join(dt2)
}
  
kq_v7 <- ghep(df_v7, 2)
kq_v6 <- ghep(df_v6, 3)
kq_v5 <- ghep(df_v5, 4)
kq_v4 <- ghep(df_v4, 5)
kq_v3 <- ghep(df_v3, 6)


kq <- rbind(kq_v7, kq_v6, kq_v5, kq_v4, kq_v3) %>% 
  mutate(so_dep = substr(so, 2, 8))

kq <- kq %>% 
  distinct(so_dep, .keep_all = TRUE)

kq$so <- NULL

# Save tam ket qua
save(kq, file = "kq_20200907.RData")

#=============================================================================

final_kq <- as.data.table(kq)

# final_kq[, xx := case_when(
#   stringr::str_detect(so_dep, "6") &
#     stringr::str_detect(so_dep, "8") ~ "A",
#   stringr::str_detect(so_dep, "6") &
#     stringr::str_detect(so_dep, "9") ~ "A",
#   stringr::str_detect(so_dep, "8") &
#     stringr::str_detect(so_dep, "9") ~ "A",
#   TRUE ~ 'B'
# )][, type := case_when(
#   loai == 'V7' & xx == 'A' ~ 'V7_A',
#   loai == 'V7' & tag == 'aaaaaaa' ~ 'V7_A',
#   loai == 'V7' & tag == 'a(a+1)...(a+6)' ~ 'V7_A',
#   loai == 'V7' & xx == 'B' ~ 'V7_B',
#   loai == 'V6' & xx == 'A' ~ 'V6_A',
#   loai == 'V6' & tag == 'aaaaaa' ~ 'V6_A',
#   loai == 'V6' & tag == 'a(a+1)...(a+5)' ~ 'V6_A',
#   loai == 'V6' & xx == 'B' ~ 'V6_B',
#   TRUE ~ loai
# )]
# 
# final_kq[,c("loai", "xx") := NULL]
#=============================================================================
cut_bay <- function(num){num %>% format(digit = 10) %>% str_sub(start = 1L, end = 7L)}
cut_sau <- function(num){num %>% format(digit = 10) %>% str_sub(start = 2L, end = 7L)}
cut_nam <- function(num){num %>% format(digit = 10) %>% str_sub(start = 3L, end = 7L)}
cut_bon <- function(num){num %>% format(digit = 10) %>% str_sub(start = 4L, end = 7L)}
cut_ba <- function(num){num %>% format(digit = 10) %>% str_sub(start = 5L, end = 7L)}

# Ngay 16/4/2020 bo sung them so trung, tien, loc phat
final_kq[, sub_num := case_when(loai == 'V3' ~ cut_ba(so_dep),
                                loai == 'V4' ~ cut_bon(so_dep),
                                loai == 'V5' ~ cut_nam(so_dep),
                                loai == 'V6' ~ cut_sau(so_dep),
                                loai == 'V7' ~ cut_bay(so_dep)
                                )  
         ][, xx := case_when(
           stringr::str_detect(sub_num, "1") |
             stringr::str_detect(sub_num, "2") |
             stringr::str_detect(sub_num, "3") |
             stringr::str_detect(sub_num, "4") |
             stringr::str_detect(sub_num, "5") |
             stringr::str_detect(sub_num, "7") |
             stringr::str_detect(sub_num, "9") |
             stringr::str_detect(sub_num, "0") ~ "KHAC",
           TRUE ~ 'CHUA 6 HOAC 8')
           ][, new_type := case_when(
             tag %in% c('aaaaaaa', 'aaaaaa', 'aaaaa', 'aaaa', 'aaa') ~ 'SO TRUNG',
             tag %in% c('a(a+1)(a+2)', 'a(a+1)...(a+3)', 'a(a+1)...(a+4)', 
                        'a(a+1)...(a+5)', 'a(a+1)...(a+6)') ~ 'SO TIEN',
             TRUE ~ xx
)]

# final_kq[, c("xx", "sub_num") := NULL]
final_kq[, xx := NULL]

#=============================================================================
# Xuat ra excel
tab <- table(final_kq$new_type, final_kq$loai) %>% as.data.frame() %>% arrange(Var1, Var2) 
kq_4567 <- final_kq %>% filter(loai %in% c("V4", "V5", "V6", "V7"))
kq_3 <- final_kq %>% filter(loai == "V3")
kq_3a <- kq_3 %>% slice(1:9e5)
kq_3b <- kq_3 %>% slice(900001:18e5)
kq_3c <- kq_3 %>% slice(1800001:3e6)

list(tab= tab,
     kq_4567 = kq_4567,
     kq_3a = kq_3a,
     kq_3b = kq_3b,
     kq_3c = kq_3c) %>%
  writexl::write_xlsx("final_kq_20200907.xlsx")

data.table::fwrite(final_kq, "final_kq_20200907.csv")




#=============================================================================
# Kiem tra lai ket qua
final_kq$loai %>% table()

final_kq %>% filter(loai == "V4") %>%  pull(so_dep) ->x
xx <- x %>% cut_bon()

setdiff(df_v4$so_dep, xx)

ghep <- function(dt2, ct){
  dt <- day_so[, so_dep := substr(so, ct, 8)]
  m <- dt[dt2, on = .(so_dep = so_dep), roll = -Inf, nomatch = 0]
}
