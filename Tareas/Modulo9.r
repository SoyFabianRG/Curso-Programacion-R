# PROGRAMADOR: Fabián Ríos Gil.
# FECHA: 21 de abril de 2022.
# OBJETIVO: Tarea de Gráficas con GGPLOT2 - Módulo 9 del curso de Introducción a R. 

# ====================   EJERCICIOS   ====================

  # Realizar 5 gráficas distintas con ggplot 2 con
  # datos de los datafames mtcars y/o airquality y dar 
  # una pequeña interpretación o conclusión por gráfica

# ====================   RESPUESTAS   ==================== 

library(ggplot2)
library(gganimate)
library(av)
library(gifski)
library(gapminder)
library(dplyr)

mtcars
airquality

theme_set(theme_bw())

# ***************  GRAFICA 1  ***************
  p <- ggplot(data = mtcars, 
              aes(x = mpg, y = cyl, size = cyl, colour = mpg)) +
    geom_point(show.legend = FALSE, alpha = 0.7) +
    labs(x = "Millas por galón", y = "Cilindros")

  # DESCRIPCIÓN:
  # Eje x son las millas por galón
  # Eje y es el número de cilindros
  
  p + transition_time(wt) +
    labs(title = "Peso: {frame_time}")
  
  # La animación de la gráfica va según el peso

# ***************  GRAFICA 2  ***************
  q <- ggplot(data = mtcars, 
              aes(x = hp, y = wt, size = wt, colour = hp)) +
    geom_point(show.legend = FALSE, alpha = 0.7) +
    labs(x = "Caballos de fuerza", y = "Peso")  
  
  # DESCRIPCIÓN:
  # Eje x son los caballos de fuerza
  # Eje y es el peso
  
  q + transition_time(cyl) +
    labs(title = "Cilindros: {frame_time}") +
    shadow_wake(wake_length = 0.1, alpha = FALSE)
  
  # La animación va según el número de cilindros, la animación tiene rastro

# ***************  GRAFICA 3  ***************
  r <- ggplot(data = airquality,
              aes(x = Month, y = Ozone, group = Day, color = factor(Month))) +
    geom_line() +
    labs(x = "Mes", y = "Ozono") +
    theme(legend.position = "top")
  
  # DESCRIPCIÓN:
  # Eje x es el mes
  # Eje y es el ozono
  # Se agrupa por día
  
  r + transition_reveal(Day) + 
    labs(title = "Dia: {frame_along}")
  
  # La animación de la gráfica va según el día

# ***************  GRAFICA 4  ***************
  s <- ggplot(data = airquality,
              aes(x = Day, y = Wind, fill = Wind)) +
    geom_col()
  
  # DESCRIPCIÓN:
  # Eje x es el día
  # Eje y es el viento
  
  s + transition_states(Month, wrap = FALSE) + 
    shadow_mark() +
    labs(title = "Mes: {closest_state}")
  
  # La animación va según el mes

# ***************  GRAFICA 5  ***************
  t <- ggplot(data = airquality,
              aes(x = Ozone, y = Wind, fill = Day)) +
    geom_point()
  
  # DESCRIPCIÓN:
  # Eje x es el ozono
  # Eje y es el viento
  
  t + transition_states(Month, wrap = FALSE) + 
    shadow_mark() +
    labs(title = "Mes: {closest_state}")

  # La animación va según el mes  