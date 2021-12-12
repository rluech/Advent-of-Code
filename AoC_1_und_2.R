x <- unlist(read.table('AoC_input1.txt'), use.names = FALSE)
table(diff(x) > 0)

y <- sapply(seq_along(x), function(q) sum(x[q:(q+2)]))
table(diff(y) > 0)

d <- read.table('AoC_input2.txt')
d <- split(d$V2, d$V1)
d <- sapply(d, sum)
(d['down'] - d['up']) * d['forward'] 

d <- read.table('AoC_input2.txt')
d$aim <- 0
d$depth <- 0
for(i in 1:nrow(d)){
  if (d$V1[i] == 'down') {
    d$aim[i] <- d$aim[i] + d$V2[i]
  } else if (d$V1[i] == 'up'){
    d$aim[i] <- d$aim[i] - d$V2[i]
  } else{
    d$depth[i] <- d$aim[i] * d$V2[i]
  }
}

d <- read.table('AoC_input2.txt')
dir <- d$V1
x <- d$V2
aim <- 0
dep <- 0
dis <- 0
x <- ifelse(dir == 'up', -x, x)
for(i in seq_along(x)){
  if(dir[i] == 'forward'){
    dis <- dis + x[i]
    dep <- dep + aim * x[i]
  } else {
    aim <- aim + x[i]
  }
}
dis * dep
