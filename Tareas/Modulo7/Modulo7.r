# PROGRAMADOR: Fabián Ríos Gil.
# FECHA: 12 de abril de 2022.
# OBJETIVO: Tarea de Manejo de NA's - Módulo 7 del curso de Introducción a R. 

# ====================   EJERCICIOS   ====================
  #1) Importa los datos del archivo HousingData.csv
  
  #2) Cuenta el numero de NAs por columna
  
  #3) Sustituye los NAs de la columna AGE por la media de la columna

# ====================   RESPUESTAS   ==================== 

# ***************  EJERCICIO 1  ***************
library(readr)
HousingData <- read.csv("./HousingData.csv")
View(HousingData)

# ***************  EJERCICIO 2  ***************
apply(HousingData, MARGIN = 2, function(x) sum(is.na(x)))

# ***************  EJERCICIO 3  ***************
HousingData[is.na(HousingData$AGE), "AGE"] <- mean(HousingData$AGE, na.rm = TRUE)
