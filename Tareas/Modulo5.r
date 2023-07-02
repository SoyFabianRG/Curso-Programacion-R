# PROGRAMADOR: Fabián Ríos Gil.
# FECHA: 7 de abril de 2022.
# OBJETIVO: Tarea de Condicionales y Loops - Módulo 5 del curso de Introducción a R. 

# ====================   EJERCICIOS   ====================

  #1) if {} else {}
  ### Crear un if else que evalue si un numero es mayor a 100, si es asi, entonces
  ### que imprima en consola "Numero muy grande, el numero es: (Aqui poner el numero)"
  ### y si el numero es menor o igual a 100, entonces que imprima "Numero adecuado"
  
  
  #2) ifelse()
  ### Hacer lo mismo que en el punto anterior, pero ahora con la funcion ifelse()
  
  #3) Switch
  ### Hacer una funcion a la que le pases como argumento el nombre de una operacion (inventada)
  ### y que realice el proceso. Ejemplo mis_operaciones(operacion = "gallina", x = 6, y = 4) 
  ### y de como resultado: (6*4) - 6 = 18 (Es solo un ejemplo)
  ### Hint. Revisar el video de Switch
  
  #4) for loop
  ### Crear un for loop que sume del numero 500 al 1000
  
  
  #5) While
  ### Crear un while que se ejecute mientras x > 200, tomando como valor inicial x <- 1000
  ### y que disminuya en una unidad en cada iteracion hasta que llegue al 200 y se rompa
  ### el while

# ====================   RESPUESTAS   ==================== 

# ***************  EJERCICIO 1  ***************
a <- 101

if (a > 100){
  paste("Número muy grande, el número es:",a)
}else{
   print("Número adecuado") 
  }

# ***************  EJERCICIO 2  ***************
ifelse( a > 100, paste("Número muy grande, el número es:",a), "Número adecuado")


# ***************  EJERCICIO 3  ***************
ejercicio3 <- function(sumanotable, n){
  switch(sumanotable,
    "sumagauss" = paste("El resultado es:", (n*(n+1))/2 ),
    "sumapares" = paste("El resultado es:", n*(n+1) ),
    "sumaimpares" = paste("El resultado es:", n^2 ),
    "sumacuadrados" = paste("El resultado es:", (n*(n+1)*(2*n+1))/6 ),
    "sumacubos" = paste("El resultado es:", ((n*(n+1))/2)^2 ),
    "Esta operación no está definida."
  )
}

ejercicio3("sumagauss", n = 100)
ejercicio3("sumapares", n = 100)
ejercicio3("sumaimpares", n = 100)
ejercicio3("sumacuadrados", n = 100)
ejercicio3("sumacubos", n = 100)

# ***************  EJERCICIO 4  ***************
x <- 0
for (i in 500:1000){
  x <- x+i
  print(x)
}

# ***************  EJERCICIO 5  ***************
y <- 1000
while(y > 200){
  y <- y-1
  print(y)
}