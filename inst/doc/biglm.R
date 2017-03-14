## ----echo = FALSE, message = FALSE, fig.cap="Simple linear regression"----
ex = -1:10
ey = 2*ex + 3
set.seed(1)
#setnicepar();mypalette(1)
par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
                      cex.axis=0.9, las=1)
plot(ex,ey, type = "l", xlab = "", ylab = "", ylim = range(0,max(ey)),
     xlim = range(-1,max(ex)), axes = FALSE)
abline(v = 0); abline(h = 0)
trix = ex[7:10]
triy = ey[7:10]
lines(trix,rep(triy[1],length(trix)), lty = 2, col = 1)
lines(rep(trix[length(trix)],length(triy)), triy, lty = 2, col = 1)
text(0.4,2,labels = expression(beta[0]), col = 1)
text(ex[10]+0.5,ey[7]+1, labels = expression(beta[1]), col = 1)
points(1:10, ey[-1:-2] + rnorm(10, sd=1.5), pch=21, bg="steelblue")

