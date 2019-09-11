# Daily Coding Problem: Problem #14

# This problem was asked by Google.

# The area of a circle is defined as ??r^2. Estimate ?? to 3 decimal places using a Monte Carlo method.

# Hint: The basic equation of a circle is x^2 + y^2 = r^2.

# Taking r=1

# Area of a square of side 2r ==> 2r*2r = 4r^2

# Area of circle ??r^2 

# Ratio of area of circle to area of square is  ??r^2/4r^2 =  ??/4 ==> Pi_estimate = 4*Ratio of area of circle to area of square

Estimate_Pi_MonteCarlo <- function (nsim){
  library(ggplot2)
  
  circle<-0
  square<-0
  x<-rep(0,nsim)
  y<-rep(0,nsim)
  mod<-rep(0,nsim)
  type<-rep(" ",nsim)
  
  for (i in 1:nsim){
    x_y<- runif(2,min=-1, max=1)
    x[i]<-x_y[1]
    y[i]<-x_y[2]
    mod[i]<-x_y[1]^2+x_y[2]^2
    
    if (mod[i]<=1){
      circle=circle+1
      type[i]="circle"
    }
    else
    {type[i]="square"}
    
    df<-data.frame(x,y,mod,type)
    square=square+1
    pi_est<-round(4*circle/square, digits=3)
    
    print(ggplot(df,aes(x=x,y=y,color=type)) + geom_point() + theme_classic() + xlim(-1,1) + ylim(-1,1))
  }
  return(pi_est)
}

pi_est <- Estimate_Pi_MonteCarlo(10)
  
  
      