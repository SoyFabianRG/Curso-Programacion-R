# PROGRAMADOR: Fabián Ríos Gil.
# FECHA: 31 de marzo de 2022.
# OBJETIVO: Tarea de Funciones - Módulo 4 del curso de Introducción a R. 

# ====================   EJERCICIOS   ==================== 

  #1)
  ###Crear una funcion que al aplicarla sobre un dataframe te de de la columna 1 a 
  #la columna x 
  
  #Por ejemplo, esto deberia de dar de la columna 1 hasta la 5 de mtcars
  #obtener_columnas(tabla = mtcars, hasta = 5) 
  
  #obtener_columnas <- function(variables) { }
  
  #2) 
  #Crear una funcion que nos de el punto medio entre dos numeros que se pasen a
  #los argumentos de la funcion y que la funcion imprima en pantalla: El punto medio de valor1 y 
  #valor2 es z. 
  
  #Por ejemplo, punto_medio(x = 6, y = 8) deberia de regresar como resultado:
  # El punto medio entre 6 y 8 es 7.
  
  
  #punto_medio <- function(variables) {}
  
  
  #3)
  #Crear una funcion nueva o utilizar una funcion existente que cuente del numero 
  #1 al numero x. Por ejemplo, mi_suma(x = 1, y = 100) debe de regresar como resultado 5050
  
  
  #mi_suma <- function(variables) {}
  
  
  #4)
  #Utiliza apply para sumar los renglones de dataframe mtcars
  
  #apply(array, margin, ...)
  
  
  #5) 
  #Utiliza tapply para contar los vehiculos agrupado por cilindros 
  #(En el video de ese tema viene algo muy parecido)
  
  #tapply(vector, index, function)


# ====================   RESPUESTAS   ==================== 

# ***************  EJERCICIO 1  ***************
ejercicio1 <- function(tabla, columna)
{
  print(tabla[,1:columna])
}

# Prueba
mtcars
ejercicio1(tabla=mtcars, columna = 7)

# ***************  EJERCICIO 2  ***************
ejercicio2 <- function(a, b)
{
  puntomedio <<- (a+b)/2
  paste("El punto medio entre", a, "y", b, "es:", puntomedio)
}

# Prueba
ejercicio2(a=1, b=3)

# ***************  EJERCICIO 3  ***************
ejercicio3 <- function(c)
{
  sumadegauss <<- (c*(c+1))/2
  paste("La suma de 1 hasta", c, "es:", sumadegauss)
}

# Prueba
ejercicio3(c=100)

# ***************  EJERCICIO 4  ***************
apply(mtcars, MARGIN = 1, sum)

# ***************  EJERCICIO 5  ***************
tapply(mtcars$cyl == 4|6|8, mtcars$cyl, sum)