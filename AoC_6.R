
# d <- c(3,4,6,2)
# d <- eval(parse(text = paste0('c(', readLines('AoC_input6.txt'), ')')))

d <- scan('AoC_input6.txt', integer(), sep = ",")

for(i in 1:80){
  d <- c(d -1L, rep(8L, sum(d == 0L)))
  d[d == -1L] <- 6L
}
length(d)

# part2
for(i in 1:256){
  d <- c(d -1L, rep(8L, sum(d == 0L)))
  d[d == -1L] <- 6L
}
length(d)
memory.limit()
memory.limit(size=9999999)
