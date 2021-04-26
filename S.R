kernel("modified.daniell", c(10,10))          # for a list
plot(kernel("modified.daniell", c(10,10)))    # for a graph

par(mfrow=c(2,1))
k = kernel("modified.daniell", c(10,10))
soi.smo = mvspec(soi, k, log="no")                     # using astsa package
# soi.smo = spec.pgram(soi, k, taper=0, log="no")      # using stats package
  abline(v=1, lty="dotted")    
  abline(v=1/4, lty="dotted")
rec.smo = mvspec(rec, k, log="no")  
# rec.smo = spec.pgram(rec, k, taper=0, log="no")
  abline(v=1, lty="dotted")    
  abline(v=1/4, lty="dotted")

df = soi.smo$df           # df = 20
Lh = 1/sum(k[-k$m:k$m]^2) # Lh = 10
Bw = Lh/480               # Bw = 0.01923419 units = month
soi.smo$bandwidth         # Bw = 0.2308103, units = year (value returned by mvspec)         
soi.smo$bandwidth/12      # Bw = 0.01923419 units = month (value returned by mvspec)  

# An easier way to obtain soi.smo:
soi.smo = mvspec(soi, spans=c(7,7), log="no")                  # using astsa package
# soi.smo = spectrum(soi, spans=c(7,7), taper=0, log="no")     # using stats package
