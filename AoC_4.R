
N <- as.integer(unlist(strsplit(readLines('AoC_input4_n.txt'), ',')))
# any(duplicated(N))

B <- lapply(split(read.table('AoC_input4_b.txt'), rep(1:100, each = 5)), as.matrix)
D <- lapply(lapply(B, `==`, 1e4), `*`, 1)

for(n in N){ # n <- 25; i <- 1
  for(i in seq_along(B)){
    D[[i]] <- D[[i]] + ( B[[i]] == n )
    win <- any(c(rowSums(D[[i]]) == 5, colSums(D[[i]]) == 5))
    if(win) {
      print(paste0('winnner is ', i))
      print(winner <- c(B[i], D[i]))
      unmarked <- sum((!D[[i]]) * B[[i]])
      print(paste('result is ', res <- n * unmarked))
      break
    }
  }
  if(win) break
}

# part 2

N <- as.integer(unlist(strsplit(readLines('AoC_input4_n.txt'), ',')))
B0 <- B <- lapply(split(read.table('AoC_input4_b.txt'), rep(1:100, each = 5)), as.matrix)
D0 <- D <- lapply(lapply(B, `==`, 1e4), `*`, 1)
W <- data.frame(n = N, win = rep(NA, length(N)), size = rep(NA, length(N)))
  
for(n in N){
  for(i in seq_along(B)) D[[i]] <- D[[i]] + ( B[[i]] == n )
  test <- lapply(D, function(x) any(c(rowSums(x) == 5, colSums(x) == 5)))
  wins <- which(unlist(test))
  W[W$n==n, 2] <- paste(names(wins), collapse=',')
  W[W$n==n, 3] <- length(B)
  if(any(wins) & (length(B)>1)) { D[wins] <- B[wins] <- NULL }
  #if(any(wins) & length(B)==1) break
}

