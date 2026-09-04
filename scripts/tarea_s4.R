# Autor: Paulina Longos Ulloa
# Fecha: 2026-09-08
# Qué hacer: Desarrollo actividad A2, tarea 4, semana 4, con objetivo: Aplicar inspección, filtrado y estadísticas descriptivas a un dataset económico**real** (CASEN reducido), documentando cada paso.

# 1. **Cargar** los datos con ruta **relativa**:

casen <- read.csv("data/raw/casen_reducido.csv")

# Se utiliza la ruta relativa para que el script funcione en cualquier computador.

# 2. **Explorar la estructura ANTES de analizar:** `str()`, `head()`, `dim()`,`summary()`. Responde en un comentario: ¿qué tipo tiene cada columna? ¿hay `NA`?

str(casen) 
head(casen)
dim(casen)
summary(casen)

# Los tipos de cada columna son: region (chr), sector (chr), educ (int), edad (int), ingreso (int), genero (chr).
# Con str(casen) y summary(casen) se puede observar que en ingreso existen 5 "NA", en las demás no existen "NA".
# Identificando los "NA" podemos prevenir el manejo incorrecto de los datos para posteriores calculos.

# 3. **Crear un subset** con una **condición compuesta** (usa `&` o `|`).

sub_casen <- casen[casen$edad > 25 & casen$educ > 10, ]
dim(sub_casen)
sub_casen

# Se crea la condición casen$edad > 25 & casen$educ > 10 para filtrar personas mayores de 25 años que tengan más de 10 años de educación para después comparar con el total de la muestra.
 
# 4. **Calcular** sobre el subset y comparar con el total:

nrow(sub_casen)                          # Tiene 39 observaciones
nrow(casen)                              # Tiene 60 observaciones
mean(sub_casen$edad)                     # El promedio de edad es de 47.82051
mean(casen$edad)                         # El promedio de edad es de 44.51667
mean(sub_casen$ingreso, na.rm = TRUE)    # El promedio de ingreso es de 737114.3
mean(casen$ingreso, na.rm = TRUE)        # El promedio de ingreso es de 655290.9

# ¿el grupo gana más que el promedio general? Comenta el porqué.
# El subet de personas mayores de 25 años y con más de 10 años de educación tiene un ingreso promedio más alto que el total (737114.3 y 655290.9 respectivamente), esto se puede deber ya que a mayor edad se suele tener más experiencia laboral lo que hace tener mejores puestos con los años y así tener un mejor ingreso, además mientras más años de educación tenga la persona se puede equivaler a un mejor acceso a puestos de trabajo con mejores sueldos.

# 5. **Una pregunta propia:** formula y responde con código una pregunta sobre los datos (ej: brecha de ingreso por sector o por género).
# Pregunta: ¿Existe una brecha de ingreso entre genero masculino y femenino?

ingreso_femenino   <- casen$ingreso[casen$genero == "F"]
ingreso_masculino  <- casen$ingreso[casen$genero == "M"]

mean(ingreso_femenino, na.rm = TRUE)   # Ingreso promedio femenino: 636296.3
mean(ingreso_masculino, na.rm = TRUE)  # Ingreso promedio masculino: 673607.1

# Sí existe una brecha de ingresos de 37310.8 entre el genero masculino y femenino, siendo el promedio masculino mayor.
