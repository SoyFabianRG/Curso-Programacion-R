# PROGRAMADOR: Fabian Rios Gil.
# FECHA: 29 de abril de 2022.
# OBJETIVO: Proyecto final del curso de Introduccion a R. 

# ====================   EJERCICIOS   ==================== 
    
    # EJERCICIO 1 
    # Descarga el csv de los datos del COVID 
    # http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip,
    # importa los datos en R
    # RECOMENDACION: usar read_csv
    
    # EJERCICIO 2 
    # Extrae una muestra aleatoria de 100k registros y asignala en una nueva variable.
    # A partir de ahora trabaja con este dataset
    # HINT: usar funcion sample_n de dplyr
    
    # EJERCICIO 3
    # Haz un resumen estadistico del dataset y tambien muestra los tipos de datos por columna
    
    # EJERCICIO 4
    # Filtra los renglones que dieron positivo para SARS-COVID y calcula el numero de registros
    # Los casos positivos son aquellos que en la columna CLASIFICACION_FINAL tienen 1, 2 o 3
    
    # EJERCICIO 5
    # Cuenta el numero de registros nulos por columna (HINT: Usar sapply o map, e is.na)
    
    # EJERCICIO 6
    # a)Calcular la media de edades de los contagiados de covid
    # b)Realiza un Histograma de las edades de los contagiados 
    # c)Realiza una grafica de densidad de edades de los contagiados
    
    # EJERCICIO 7
    # Agregar una columna nueva al dataframe que tenga valor 1 cuando la fecha de 
    # defuncion no es valor nulo y 0 cuando es nulo 
    # La columna que contiene la fecha de defuncion se llama FECHA_DEF 
    # HINT: Usa mutate, ifelse e is.na
    
    # EJERCICIO 8
    # Hacer un boxplot de edades de los muertos por covid vs lo que no 
    # murieron para ver si detectamos diferencias y escribe tus conclusiones
    
    # EJERCICIO 9
    # Transforma la columna CLASIFICACION_FINAL, que tenga valor de 1 
    # si tiene 1, 2 o 3 como valor y que tenga 0 en cualquier otro caso
    # HINT: Usar transform o mutate
    
    # EJERCICIO 10
    # Cuenta el numero de casos positivos agrupado por estado y 
    # realiza una grafica de barras de los 10 estados con mas casos
    # HINT: Usar groupby, summarize, n(), y ggplot2
    
    # EJERCICIO 11
    # Renombra la columna llamada CLASIFICACION FINAL para que ahora su nombre sea: "CONTAGIADO"
    
    # EJERCICIO 12
    # Realiza una funcion que al aplicarla nos diga el procentaje del total 
    # de registros que estan contagiados por Covid
    # Ejemplo: al correr la funcion porcentaje_contagios(mi_dataframe) el resultado sea: 20.5%
    
    # porcentaje_contagiados <- function(mi_dataframe) {
    # }
    
    # EJERCICIO 13
    # Realiza una matriz de corrrelacion entre las variables numericas y concluye
    # HINT:
    # https://stackoverflow.com/questions/5863097/selecting-only-numeric-columns-from-a-data-frame
    
    # EJERCICIO 14
    # Realiza algun analisis, conteo por grupo y/o grafica que te parezca relevante para 
    # complementar el estudio y concluye

# ====================   DECLARACIÓN DE BIBLIOTECAS   ==================== 
    library(readr)
    library(ggplot2)
    library(dplyr)
    library(magrittr)
    library(tidyverse)
    
    theme_set(theme_bw())

# ====================   RESPUESTAS   ====================================

# ***************  EJERCICIO 1  ***************
    Covid_Dataset <- read.csv("./covid_dataset.csv")        # Importar archivo csv
    View(Covid_Dataset)                                     # Ver archivo csv 

# ***************  EJERCICIO 2  ***************
    Covid_Dataset <- sample_n(Covid_Dataset, 100000)        # Muestra aleatoria de 100,000 registros

# ***************  EJERCICIO 3  ***************
    Covid_Dataset %>% summary()                             # Resumen estadístico
    glimpse(Covid_Dataset)                                  # Tipo de dato por columna

# ***************  EJERCICIO 4  ***************

    # Filtro de casos positivos
    CasosPositivos <- Covid_Dataset %>%
        filter( CLASIFICACION_FINAL == 1 | 
                CLASIFICACION_FINAL == 2 | 
                CLASIFICACION_FINAL == 3)
    
    # Total de registros positivos
    CasosPositivos %>%
        select(CLASIFICACION_FINAL) %>%
        summarise(TOTAL = n())

# ***************  EJERCICIO 5  ***************
    Covid_Dataset %>% sapply(function(x) sum(is.na(x)))     # Cantidad de NA's por columna

# ***************  EJERCICIO 6  ***************
    mean(Covid_Dataset$EDAD)                                # Media de edades
    
    # Usaremos el dataset CasosPositivos definido en el ejercicio anterior
    # para solo tomar en cuenta los casos positivos
    
    # Definicion de grafica
    GraficaContagiadosEdades <- ggplot(CasosPositivos,
                                       aes(x = EDAD))
    
    # Ver histograma
    GraficaContagiadosEdades + geom_histogram()

    # Ver grafica de densidad
    GraficaContagiadosEdades + geom_density()

# ***************  EJERCICIO 7  ***************

    # Nueva columna llamada defunciones
    Covid_Dataset <- Covid_Dataset %>%
        mutate(DEFUNCIONES = ifelse(is.na(FECHA_DEF) == TRUE, 0, 1))

# ***************  EJERCICIO 8  ***************

    # Cambio de 0 a "Vivo" y 1 a "Muerto" en la columna DEFUNCIONES para realizar este ejercicio
    Covid_Dataset <- Covid_Dataset %>%
        transform(DEFUNCIONES = case_when(
            DEFUNCIONES == 0 ~ "Vivo",
            DEFUNCIONES == 1 ~ "Muerto"
        ))
    
    # Definición de la grafica comparando edades con defunciones
    GraficaEdadDefuncion <- ggplot(data = Covid_Dataset, 
                                   aes(x = DEFUNCIONES,
                                       y = EDAD,
                                       fill = DEFUNCIONES)) +
        labs(x = "Mortalidad", y = "Edad")
    
    # Boxplot
    GraficaEdadDefuncion + geom_boxplot()

# ---------- CONCLUSIONES ----------

    # En la grafica se aprecia lo siguiente:
    # 1. Las personas entre aproximadamente 55 y 75 años tienen mayor indice de mortalidad.
    #    En los casos atipicos vemos que hay pocos casos de personas menores a 25 años que fallecieron.
    # 2. Las personas entre 25 y 50 años son menos propensas a fallecer.
    #    En los casos atipicos vemos que hay pocos casos de personas mayores a 80 años que vivieron.

# ***************  EJERCICIO 9  ***************

    # Cambio en la columna CLASIFICACION_FINAL por 1 en casos positivos y 0 en casos negativos  
    Covid_Dataset <- Covid_Dataset %>%
        transform(CLASIFICACION_FINAL = case_when(
        CLASIFICACION_FINAL == 1 ~ 1,
        CLASIFICACION_FINAL == 2 ~ 1,
        CLASIFICACION_FINAL == 3 ~ 1,
        TRUE ~ 0
        ))

# ***************  EJERCICIO 10  **************

    # Filtro y total de casos positivos agrupados estado ordenados de mayor a menor
    PositivosEstado <- Covid_Dataset %>%
        filter(CLASIFICACION_FINAL == 1) %>%
        group_by(ENTIDAD_RES) %>%
        summarise(CASOS_POSITIVOS = n()) %>%
        arrange(desc(CASOS_POSITIVOS))
    
    # Seleccionar 10 con mas contagios
    PositivosEstado <- PositivosEstado[1:10,]
    
    # Cambio del  numero al nombre del estado (lo saqué del diccionario de datos)
    PositivosEstado <- PositivosEstado %>%
        transform(ENTIDAD_RES = case_when(
            ENTIDAD_RES == 5 ~ "COAH",
            ENTIDAD_RES == 9 ~ "CDMX",
            ENTIDAD_RES == 11 ~ "GTO",
            ENTIDAD_RES == 14 ~ "JAL",
            ENTIDAD_RES == 15 ~ "MEX",
            ENTIDAD_RES == 19 ~ "N.L.",
            ENTIDAD_RES == 21 ~ "PUE",
            ENTIDAD_RES == 26 ~ "SON",
            ENTIDAD_RES == 27 ~ "TAB",
            ENTIDAD_RES == 30 ~ "VER"
        ))
    
    # Definición de gráfica
    GraficaPositivosEstado <- ggplot(data = PositivosEstado, 
                                     aes(x = ENTIDAD_RES,
                                         y = CASOS_POSITIVOS,
                                         fill = CASOS_POSITIVOS)) +
        labs(x = "ESTADO", y = "CASOS POSITIVOS")
    
    # Ver grafica de barras
    GraficaPositivosEstado + geom_col()
    
# ***************  EJERCICIO 11  **************

    # Cambio de nombre en la columna CLASIFICACION_FINAL por "CONTAGIADO"
    Covid_Dataset <- Covid_Dataset %>%
        rename("CONTAGIADO" = "CLASIFICACION_FINAL")

# ***************  EJERCICIO 12  **************

    # Definición de función para calcular el porcentaje del total de contagiados
    porcentaje_contagiados <- function(mi_dataframe)
    {
        ContagiadosPositivos <- Covid_Dataset %>%
            select(CONTAGIADO) %>%
            filter(CONTAGIADO == 1) %>%
            summarise(n())
        
        porcentaje <<- (ContagiadosPositivos * 100) / 100000
        paste("El porcentaje es:", porcentaje, "%")
    }

    # PRUEBA
    porcentaje_contagiados(mi_dataframe = Covid_Dataset)

# ***************  EJERCICIO 13  **************

    # Matriz de correlacion entre las variables numericas
    Matriz <- Covid_Dataset %>%
        dplyr::select(where(is.numeric))

# ***************  EJERCICIO 14  **************

    # Filtrar datos desconocidos del sexo (los que tienen el numero 99) y su total
    Covid_Dataset %>%
        select(SEXO) %>%
        filter(SEXO == 99) %>%
        summarise(TOTAL = n())

    # Como no hay datos desconocidos, usaremos Covid_Dataset sin modificar
    
    # Cambio en la columna SEXO por "Mujer" cuando es 1 y "HOMBRE"
    # cuando es 2 (segun el diccionario de datos)
    Covid_Dataset <- Covid_Dataset %>%
        transform(SEXO = case_when(
            SEXO == 1 ~ "MUJER",
            SEXO == 2 ~ "HOMBRE"
        ))
    
    # Filtro de contagiados positivos agrupado por sexo
    SexoPositivos <- Covid_Dataset %>%
        filter(CONTAGIADO == 1) %>%
        group_by(SEXO) %>%
        summarise(CONTAGIADO = n())
    
    # Definición de gráfica 
    GraficaSexoPositivos <- ggplot(data = SexoPositivos,
                                   aes(x = SEXO,
                                       y = CONTAGIADO,
                                       fill = CONTAGIADO)) +
        labs(x = "SEXO", y = "CASOS POSITIVOS")
    
    # Ver grafica de barras
    GraficaSexoPositivos + geom_col()
    
# ---------- CONCLUSIONES ----------
    
    # En la grafica podemos ver que hay una mayor cantidad de contagios en hombres, pero la diferencia
    # es mínima con respecto a los cantagios en las mujeres.