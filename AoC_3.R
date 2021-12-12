
# x <- 10011010010 # 1234
# bin2dec <- function(x) 
#   sum(2^(which(rev(unlist(strsplit(as.character(x), "")) == 1))-1))
# bin2dec(x)
# strtoi(x, 2)

library(data.table)
d <- fread('AoC_input3.txt', colClasses = 'character')
d <- d[, lapply(tstrsplit(V1, ''), as.integer)]
x <- colMeans(d) > 0.5
gamma <- strtoi(paste0(x*1L, collapse = ''), 2)
epsilon <- strtoi(paste0((!x)*1L, collapse = ''), 2)
gamma * epsilon

# part 2
d <- read.table('AoC_input3.txt', colClasses = 'character')
d <- lapply(d$V1, strsplit, '')
d <- matrix(as.integer(unlist(d)), nrow = length(d), byrow = TRUE)

m <- d
for(i in 1:ncol(m)){
  x <- (mean(m[, i]) >= 0.5) *1L
  m <- m[m[, i] == x, , drop = FALSE]
  if(nrow(m) < 2) break()
}
o3 <- strtoi(paste0(m[1,], collapse = ''), 2)

m <- d
for(i in 1:ncol(m)){
  x <- (mean(m[, i]) < 0.5) *1L
  m <- m[m[, i] == x, , drop = FALSE]
  if(nrow(m) < 2) break()
}
co2 <- strtoi(paste0(m[1,], collapse = ''), 2)
o3 * co2
