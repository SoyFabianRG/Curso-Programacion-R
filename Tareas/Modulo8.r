# PROGRAMADOR: Fabián Ríos Gil.
# FECHA: 12 de abril de 2022.
# OBJETIVO: Tarea de Dplyr y Magrittr - Módulo 8 del curso de Introducción a R. 

# ====================   EJERCICIOS   ====================

  #1) Ordena el dataset de mayor a menor por la columna hp
  
  #2) Calcula las millas por galon (columna mpg) promedio agrupado por cilindros (cyl)
  
  #3) Agrega una columna extra al dataframe que se llame categoria_cyl que 
  # tenga como valor "potente" si el auto tiene 8 cilindros, "normal" si tiene
  # 6 cilindros y "economico" si tiene 4 cilindros. (Usa mutate e ifelse())
  
  #4) Realiza lo mismo que en el punto anterior, pero en lugar de agregar nueva columna
  # transforma la columna cyl (Usa transform y case_when)
  
  #5) Cambia el nombre de la columna "Model" para que ahora se llame "Vehiculo"
  
  #6) Aplica un filtro de tal forma que obtengas los autos con hp mayor al promedio
  # de la columna 
  
  #7) Selecciona las columnas que estan en la posicion 2 y 5 (Usa select)

# ====================   RESPUESTAS   ==================== 

library(ggplot2)
library(dplyr)
library(magrittr)
library(tidyverse)

data("mtcars")

new_mtcars <- mtcars %>% rownames_to_column(var = "Model")

# Usa este dataframe para resolver los ejercicios
new_mtcars

# ***************  EJERCICIO 1  ***************

new_mtcars %>%
  group_by(hp) %>%
  arrange(desc(hp))

# ***************  EJERCICIO 2  ***************

new_mtcars %>%
  group_by(cyl) %>%
  summarise(promedio = mean(mpg))

# ***************  EJERCICIO 3  ***************

new_mtcars %>% 
  mutate(categoria_cyl = ifelse(cyl == 8, "potente", ifelse(cyl == 6, "normal" ,"economico")))

# ***************  EJERCICIO 4  ***************

new_mtcars %>% 
  transform(cyl = case_when(cyl == 8 ~ "potente", cyl == 6 ~ "normal", cyl == 4 ~ "economico"))

# ***************  EJERCICIO 5  ***************

new_mtcars %>% rename("Vehículo" = "Model")

# ***************  EJERCICIO 6  ***************

a <- mean(new_mtcars$hp)
new_mtcars %>% filter(hp > a)

# ***************  EJERCICIO 7  ***************

new_mtcars %>% select(2,5)