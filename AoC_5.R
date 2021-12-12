
d <- sub(' -> ', ',', readLines('AoC_input5.txt'))
d <- do.call(rbind, lapply(sapply(d, strsplit, ','), as.integer))
dimnames(d) <- list(NULL, c('x1','y1','x2','y2'))
d <- as.data.frame(d)

x <- d[d$x1 == d$x2, ]
y <- d[d$y1 == d$y2, ]

xx <- apply(x, 1, function(v) data.frame(x = v[1L], y = seq.int(v[2L],v[4L]), row.names = NULL))
yy <- apply(y, 1, function(v) data.frame(x = seq.int(v[1L],v[3L]), y = v[2L], row.names = NULL))

b <- rbind(do.call(rbind, xx), do.call(rbind, yy))
b1 <- b[duplicated(b),]
nrow(unique(b1))

# part2

z <- d[d$y1 != d$y2 & d$x1 != d$x2, ]
zz <- apply(z, 1, function(v) data.frame(x = seq.int(v[1L],v[3L]), y = seq.int(v[2L],v[4L]), row.names = NULL))
a <- rbind(do.call(rbind, xx), do.call(rbind, yy), do.call(rbind, zz))
a1 <- a[duplicated(a),]
nrow(unique(a1))