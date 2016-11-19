library(tm)
library(lsa)

directorio <- file.path("~", "Desktop", "TIO", "PLN-R", "txt")

dir(directorio)

#Creamos el corpus

corpus <- Corpus(DirSource(directorio))

#Removemos los numeros, signos de puntuacion,stopwords...
corpus <- tm_map(corpus,removePunctuation)
corpus <- tm_map(corpus,removeNumbers)
corpus <- tm_map(corpus,tolower)
corpus <- tm_map(corpus,removeWords,stopwords("spanish"))
corpus <- tm_map(corpus,stripWhitespace)
corpus <- tm_map(corpus,PlainTextDocument)

#Matriz de términos documentos
tdm <- TermDocumentMatrix(corpus)

#Con la siguiente línea me quedo
s <- removeSparseTerms(tdm,0.1)

#Espacio semántico latente
spaceLSA = lsa(s,dims=dimcalc_raw())

#Creo el espacio como matriz.
matrixLSA <- round(as.textmatrix(spaceLSA),2)

#Mostramos las estadisticas del LSA
summary(matrixLSA)

#Coseno del LSA
cos <- cosine(matrixLSA)

#-------------------------------------------------------------------------------------------------------
# Haciendolo con 6 documentos
txt <- file.path("~", "Desktop", "TIO", "PLN-R", "paso8")

dir(txt)

#Creamos el corpus con 6 documentos

corpus2 <- Corpus(DirSource(txt))

#Removemos los numeros, signos de puntuacion,stopwords... con 6 documentos
corpus2 <- tm_map(corpus2,removePunctuation)
corpus2 <- tm_map(corpus2,removeNumbers)
corpus2 <- tm_map(corpus2,tolower)
corpus2 <- tm_map(corpus2,removeWords,stopwords("spanish"))
corpus2 <- tm_map(corpus2,stripWhitespace)
corpus2 <- tm_map(corpus2,PlainTextDocument)

#Matriz de términos documentos con 6 documentos
tdm2 <- TermDocumentMatrix(corpus2)

#Con la siguiente línea me quedo con los terminos más importantes con 6 documentos
s2 <- removeSparseTerms(tdm2,0.1)

#Espacio semántico latente con 6 documentos
spaceLSA2 = lsa(s2,dims=dimcalc_raw())

#Creo el espacio como matriz con 6 documentos
matrixLSA2 <- round(as.textmatrix(spaceLSA2),2)

#Mostramos las estadisticas del LSA con 6 documentos
summary(matrixLSA2)

#Coseno del LSA con 6 documentos
cos2 <- cosine(matrixLSA2)

#Haciendo el análisis Spearman
associate(matrixLSA2, "datos")
