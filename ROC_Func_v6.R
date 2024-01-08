# Gia Smith
# ROC Function v6
# 06-29-23


plot.roc <- function(m.0 = 2, m.1 = 3, sd.0=1, sd.1 = 1, prob=0.3) {
  
  a=(m.0-m.1)/sd.0
  b=sd.0/sd.1
  
  #x_bound <- c(-5,12)
  #y_bound <- c(-5,12)
  
  par(mfrow=c(2,2), pty='s')
  
  # ROC 
  fpf <- seq(0, 1, 0.001)
  tpr <- 1-pnorm(a + b * qnorm(1-fpf))
  
  ## Plot ROC Curve
  plot(fpf,tpr, type = "l", lwd = 2, main = "ROC Curve", 
       xlab="FPF (1-Specificity)", ylab = "TPR (Sensitivity)")
  abline(0, 1)
  points(prob, 1- pnorm(a + b*qnorm(1-prob)), pch = 19, col = "purple")
  abline(v=prob, lty = "dashed", col = "purple")
  
  ### Draw the distribution
  z <- seq(-5, 12, 0.01)
  y1 <- dnorm(z, mean = m.0, sd = sd.0)
  y2 <- dnorm(z, mean = m.1, sd = sd.1)
  
  ### Z-Score Transformation
  y1.z <- (z-m.0)/sd.0
  1-pnorm(a + b * qnorm(1-y1.z))
  a=(m.0-m.1)/sd.0
  b=sd.0/sd.1
  
  #y1.C <- pnorm(y1, mean = m.0, sd = sd.0)
  #y2.C <- pnorm(y2, mean = m.1, sd = sd.1)
  #normal <- y1.C - y2.C
  
  #y2.z <- (z-m.1)sd.1
  #z.pc <- pnorm(z_score, mean = 0, sd = 1)
  
  
  # Plot Densities w/ same cutoff
  plot(z, y1, type = "n",col = "red", lwd = 2, xlab = "Score", 
       ylab = "Density", main = "Density Plot", xlim = c(-5, 12), ylim = c(0, 0.6))
  
  
  ## Add vertical line for cutoff
  c <- qnorm(prob, mean = m.0, sd = sd.0)
  
  ### Fill area on the right-hand side for y1
  x1 <- z[z >= c]
  y1_density <- y1[z >= c]
  polygon(x = c(x1, max(x1), min(x1)), 
          y = c(y1_density,0, 0), 
          col = "lightpink", border = NA)
  
  ### Fill area on the right-hand side for y2
  x2 <- z[z > c]
  y2_density <- y2[z > c]
  polygon(x = c(x2, max(x2), min(x2)), 
          y = c(y2_density,0, 0), 
          col = "lightblue", border = NA)
  
  # Distribution curves
  lines(z, y1, type = "l", col = "red", lwd = 2)
  lines(z, y2, type = "l", col = "blue", lwd = 2)
  
  abline(v = c, lty = "dashed", col = "purple", lwd=2)
  
  #### Add legend
  legend("topright", legend = c("D-", "D+", "Cutoff"),
         col = c("red", "blue", "purple"), lty = c(1,1,2), lwd = 2, 
         bg = "white", cex = 0.45, bty="n")
  
  # Q-Q
  z <- seq(-5, 12, 0.01)
  #q1 <- z
  #q2 <- a+b*q1
  q0 <- qnorm(fpf)
  q1 <- qnorm(tpr)
  
  ## Plot Q-Q
  plot(q0, q1, xlab = "Quantile(Group 0)", ylab = "Quantile(Group 1)", type="n",
       xlim=c(-3,1.9),
       ylim=c(-5,12),
       main = "Q-Q Plot")
  
  lines(q0,q1, type = "l", lwd = 2, col="black")
  abline(0, 1, lty=2, lwd=0.5)
  
  q0.p <- qnorm(prob, mean = m.0, sd = sd.0)
  q1.p <- qnorm(prob, mean = m.1, sd = sd.1)
  points(q0.p, q1.p, pch=16, col="purple")
  abline(0,1, lty=2)
  
  # Plot Densities w/different cutoffs
  plot(z, y1, type = "l", col = "red", lwd = 2, xlab = "Score", 
       ylab = "Density", main = "Density Plot", xlim = c(-5, 12), ylim = c(0, 0.6))
  #lines(z, y2, type = "l", col = "blue", lwd = 2)
  
  ## Fill area on the left-hand side for y1
  x.q1 <- z[z >= q0.p]
  q1_density <- y1[z >= q0.p]
  polygon(x = c(x.q1, max(x.q1), min(x.q1)), 
          y = c(q1_density,0, 0), 
          col = "lightpink", border = NA)  
  
  
  ## Fill area on the left-hand side for y1
  x.q2 <- z[z >= q1.p]
  q2_density <- y2[z >= q1.p]
  polygon(x = c(x.q2, max(x.q2), min(x.q2)), 
          y = c(q2_density,0, 0), 
          col = "lightblue", border = NA)
  lines(z, y1, type = "l", col = "red", lwd = 2)
  lines(z, y2, type = "l", col = "blue", lwd = 2)
  
  ### Add cutoff lines for y1
  abline(v = q0.p, lty = "dashed", col = "red", lwd=2)
  ### Add cutoff lines for y2
  abline(v = q1.p, lty = "dashed", col = "blue", lwd=2) 
  
  #### Add legend
  legend("topright", legend = c("D-", "D+", "D- Cutoff", "D+ Cutoff"),
         col = c("red", "blue", "red", "blue"), lty = c(1,1,2,2), lwd = 2, 
         bg = "white", cex = 0.35, bty="n")
  
}

plot.roc()
