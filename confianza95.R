# set.seed(123)  # Para reproducibilidad

m <- 100  # número de experimentos
n <- 300  # tamaño de muestra
mux <- 30  # media poblacional 
sdx <- sqrt(50)  # desviación estándar poblacional
a <- 0.05

# Generar muestras
x <- rnorm(n * m, mux, sdx)
muestras <- matrix(x, nrow = m)

# Función para intervalo de confianza
icm <- function(xx) {
  mxx <- mean(xx)
  sdxx <- sd(xx)
  p <- 1 - a/2
  z <- qnorm(p)
  lsxx <- mxx + z * sdxx / sqrt(n)
  lixx <- mxx - z * sdxx / sqrt(n)
  return(c(lixx, lsxx))
}

# Calcular intervalos
ICa <- apply(muestras, 1, icm)

# Gráfico
plot(1:m, type = "n",
     xlim = range(ICa),
     ylab = "Muestreos", 
     xlab = "Intervalos de confianza",
     las = 1)

abline(v = mux, col = "red", lty = 2, lwd = 2)  # media poblacional

# Dibujar los intervalos
for (i in 1:m) {
  color <- ifelse(ICa[1,i] <= mux & ICa[2,i] >= mux, "black", "red")
  segments(ICa[1,i], i, ICa[2,i], i, col = color, lwd = 2)
}
