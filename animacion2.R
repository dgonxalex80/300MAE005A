# Librerías necesarias
# install.packages("magick")
library(magick)

# Definir parámetros y datos
n = 1000
m = 1000

par(mfrow = c(1, 1))
# Generar datos
x = rexp(n * m, 1/20)
m = matrix(x, nrow = m)

# Calcular las matrices y promedios
M1 = m[, 1]
M5 = m[, 1:5]

M10 = m[, 1:10]
M20 = m[, 1:20]
M30 = m[, 1:30]

M50 = m[, 1:50]
M100 = m[, 1:100]
M200 = m[, 1:200]
M500 = m[, 1:500]
M1000 = m[, 1:1000]


MX5 = apply(M5, 1, mean)

MX10 = apply(M10, 1, mean)
MX20 = apply(M20, 1, mean)
MX30 = apply(M30, 1, mean)

MX50 = apply(M50, 1, mean)
MX100 = apply(M100, 1, mean)
MX200 = apply(M200, 1, mean)
MX500 = apply(M500, 1, mean)
MX1000 = apply(M1000, 1, mean)

# Listar las variables que vamos a graficar
matrices = list(M1, MX5, MX10, MX20, MX30, MX50, MX100,MX200, MX500, MX1000)
labels = c("n=1", "n=5", "n=10", "n=20", "n =30", "n=50", "n=100", "n=200","n=500", "n=1000")

# Ajustar parámetros gráficos para reducir los márgenes
# Define una matriz de gráficos de 2x3 con márgenes ajustados

# Crear histogramas con ajustes específicos para eliminar etiquetas del eje x
hist(M1, col = "skyblue", border = "white", main = "Histograma de medias con n=1", xlab = " ", ylab = "frecuencia", ylim = c(0, 150))
hist(MX5, col = "skyblue", border = "white", main = "Histograma de medias con n=5", xlab = " ",ylab = " ", ylim = c(0, 150))

hist(MX10, col = "skyblue", border = "white", main = "Histograma de medias con n=10", xlab = " ",ylab = " ", ylim = c(0, 150))
hist(MX20, col = "skyblue", border = "white", main = "Histograma de medias con n=20", xlab = " ",ylab = " ", ylim = c(0, 150))
hist(MX30, col = "skyblue", border = "white", main = "Histograma de medias con n=30", xlab = " ",ylab = " ", ylim = c(0, 150))

hist(MX50, col = "skyblue", border = "white", main = "Histograma de medias con n=50", xlab = "",ylab = " ", ylim = c(0, 150))
hist(MX100, col = "skyblue", border = "white", main = "Histograma de medias con n=100", xlab = " ",ylab = "frecuencia", ylim = c(0, 150))
hist(MX200, col = "skyblue", border = "white", main = "Histograma de medias con n=200", xlab = " ",ylab = " ", ylim = c(0, 150))


hist(MX500, col = "skyblue", border = "white", main = "Histograma de medias con n=500", xlab = " ",ylab = " ", ylim = c(0, 150))
hist(MX1000, col = "skyblue", border = "white", main = "Histograma de medias con n=1000", xlab = " ",ylab = " ", ylim = c(0, 150))


# Generar gráficos individuales y guardarlos como imágenes
for (i in 1:length(matrices)) {
  # Crear el histograma
  hist(matrices[[i]], main = paste("exp(1/20) - medias con", labels[i]), xlab = " ", ylab="frecuencia", col = "skyblue", border = "white")
  
  # Guardar cada gráfico como una imagen PNG
  filename <- paste0("hist_", labels[i], ".png")
  dev.copy(png, filename = filename)
  dev.off()
}

# Leer las imágenes generadas
image_list <- list()
for (i in labels) {
  image_list[[i]] <- image_read(paste0("hist_", i, ".png"))
}

# Crear el GIF combinando las imágenes
animation <- image_animate(image_join(image_list), fps = 1)  # fps = cuadros por segundo
image_write(animation, "/home/deg/Documentos/JAVERIANA/300MAE005D/repository/300MAE005D/img/animation2_hist.gif")

# El GIF se guarda en el directorio de trabajo
animation


#---------------------------------------------------------------------------------
# Librerías necesarias
# install.packages("magick")
library(magick)

# Definir parámetros y datos
n = 1000
m = 1000

# Generar datos
x = runif(n * m, 10, 50)
m = matrix(x, nrow = m)

# Calcular las matrices y promedios para los tamaños de muestra requeridos
M1 = m[, 1]
M5 = m[, 1:5]
M10 = m[, 1:10]
M20 = m[, 1:20]
M30 = m[, 1:30]
M50 = m[, 1:50]
M100 = m[, 1:100]
M200 = m[, 1:200]
M500 = m[, 1:500]
M1000 = m[, 1:1000]

# Calcular las medias de cada fila de la matriz para los tamaños especificados
MX1 = M1  # No es promedio
MX5 = apply(M5, 1, mean)
MX10 = apply(M10, 1, mean)
MX20 = apply(M20, 1, mean)
MX30 = apply(M30, 1, mean)
MX50 = apply(M50, 1, mean)
MX100 = apply(M100, 1, mean)
MX200 = apply(M200, 1, mean)
MX500 = apply(M500, 1, mean)
MX1000 = apply(M1000, 1, mean)

# Listar las variables que vamos a graficar
matrices = list(MX1, MX5, MX10, MX20, MX30, MX50, MX100, MX200, MX500, MX1000)
labels = c("n=1", "n=5", "n=10", "n=20", "n=30", "n=50", "n=100", "n=200", "n=500", "n=1000")

# Generar gráficos Q-Q y guardarlos como imágenes
for (i in 1:length(matrices)) {
  # Crear el gráfico Q-Q
  png(filename = paste0("qqplot_", labels[i], ".png"))  # Guardar el gráfico como PNG
  qqnorm(matrices[[i]], main = paste("Q-Q Plot para tamaño de muestra =", labels[i]), col = "blue", pch = 16)
  qqline(matrices[[i]], col = "red", lwd = 2)  # Agregar línea de referencia
  dev.off()
}

# Leer las imágenes generadas
image_list <- list()
for (i in labels) {
  image_list[[i]] <- image_read(paste0("qqplot_", i, ".png"))
}

# Crear el GIF combinando las imágenes
animation <- image_animate(image_join(image_list), fps = 1)  # fps = cuadros por segundo
image_write(animation, "/home/deg/Documentos/JAVERIANA/300MAE005D/repository/300MAE005D/img/animation2_qqnorm.gif")

# Mostrar la ubicación del GIF generado
cat("El GIF se ha guardado como 'animation_qqplot.gif'\n")

# Mostrar la animación en la consola de R
animation

