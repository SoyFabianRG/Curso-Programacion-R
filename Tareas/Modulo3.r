# PROGRAMADOR: Fabián Ríos Gil.
# FECHA: 31 de marzo de 2022.
# OBJETIVO: Tarea de Estructura de Datos - Módulo 3 del curso de Introducción a R. 

# ====================   EJERCICIOS   ==================== 

  #1) Declara un vector que contenga 6 valores con tipo de dato logical
  
  #2) Declara un vector que sea una secuencia que inicie en 100 y termine en 130
  # que vaya incrementando de 0.1 en 0.1.
  
  #3) Declara un dataframe que contenga las columnas "Edad" (tipo de dato numerico)
  # Genero (Tipo de dato factor) y correo electronico (tipo de dato character) y asignale 
  # 3 rengolnes con valores
  
  #4) filtra los rengoles del dataframe mtcars que cumplan la condicion que en la columna
  # wt sea mayor a 2 y ademas que cyl sea igual a 8
  
  #5) Crea una lista vacia de longitud (lenght) 6. 
  #Hint. En el video de listas viene como hacerlo
  
  #6) Declara dos matrices con valores numericos y realiza multiplicacion matricial
  #entre ellas.

# ====================   RESPUESTAS   ==================== 

# ***************  EJERCICIO 1  ***************
ejercicio1 <- vector(mode = "logical", length = 6)
ejercicio1
class(ejercicio1)

# ***************  EJERCICIO 2  ***************
ejercicio2 <- c(seq(100, 130, by = 0.1))
ejercicio2
class(ejercicio2)

# ***************  EJERCICIO 3  ***************
a <- c(19, 25, 30)
b <- c(factor("Hombre"), factor("Mujer"), factor("No binario"))
c <- c("fabian@ciencias.unam.mx", "larissa@ciencias.unam.mx", "saul@ciencias.unam.mx")

length(a)
length(b)
length(c)

ejercicio3 <- data.frame(a, b, c)
ejercicio3 <- data.frame(Edad = a, Genero = b, Correo = c)

class(ejercicio3)
  
# ***************  EJERCICIO 4  ***************
mtcars
colnames(mtcars)

mtcars[mtcars$wt > 2 & mtcars$cyl == 8,]

# ***************  EJERCICIO 5  ***************
ejercicio5 <- vector(mode = "list", length = 6)

# ***************  EJERCICIO 6  ***************
x <- matrix(1:10, nrow = 5)
y <- matrix(21:30, nrow = 5)

x * y