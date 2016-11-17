library(tm)
library(textreg)
library(wordcloud)
library(dplyr)
library(lsa)

#Leemos los ficheros
txt <- readLines("/Users/Losnen/Desktop/TIO/PLN-R/txt/MT1.txt",encoding="UTF-8")
txt2 <- readLines("/Users/Losnen/Desktop/TIO/PLN-R/txt/MT2.txt",encoding="UTF-8")
txt3 <- readLines("/Users/Losnen/Desktop/TIO/PLN-R/txt/MT3.txt",encoding="UTF-8")
txt4 <- readLines("/Users/Losnen/Desktop/TIO/PLN-R/txt/MT4.txt",encoding="UTF-8")
txt5 <- readLines("/Users/Losnen/Desktop/TIO/PLN-R/txt/MT5.txt",encoding="UTF-8")
txt = iconv(txt,to="ASCII//TRANSLIT")
txt2 = iconv(txt2,to="ASCII//TRANSLIT")
txt3 = iconv(txt3,to="ASCII//TRANSLIT")
txt4 = iconv(txt4,to="ASCII//TRANSLIT")
txt5 = iconv(txt5,to="ASCII//TRANSLIT")
sw <- readLines("/Users/Losnen/Desktop/TIO/PLN-R/stopwords.es",encoding="UTF-8")
sw = iconv(sw,to="ASCII//TRANSLIT")

#Creamos los corpus
corpus <- Corpus(VectorSource(txt))
corpus2 <- Corpus(VectorSource(txt2))
corpus3 <- Corpus(VectorSource(txt3))
corpus4 <- Corpus(VectorSource(txt4))
corpus5 <- Corpus(VectorSource(txt5))

#Para cada fichero le elimino los espacios en blanco, convierto a minuscula, elimino los signos de puntuacion
#Elimino los numeros, y las stopwords
d <- tm_map(corpus,content_transformer(tolower))
d <- tm_map(corpus,stripWhitespace)
d <- tm_map(d,removePunctuation)
d <- tm_map(d,removeNumbers)
d <- tm_map(d,removeWords,stopwords("spanish"))
d <- tm_map(d,removeWords,sw)

d2 <- tm_map(corpus2,content_transformer(tolower))
d2 <- tm_map(corpus2,stripWhitespace)
d2 <- tm_map(d2,removePunctuation)
d2 <- tm_map(d2,removeNumbers)
d2 <- tm_map(d2,removeWords,stopwords("spanish"))
d2 <- tm_map(d2,removeWords,sw)

d3 <- tm_map(corpus3,content_transformer(tolower))
d3 <- tm_map(corpus3,stripWhitespace)
d3 <- tm_map(d3,removePunctuation)
d3 <- tm_map(d3,removeNumbers)
d3 <- tm_map(d3,removeWords,stopwords("spanish"))
d3 <- tm_map(d3,removeWords,sw)

d4 <- tm_map(corpus4,content_transformer(tolower))
d4 <- tm_map(corpus4,stripWhitespace)
d4 <- tm_map(d4,removePunctuation)
d4 <- tm_map(d4,removeNumbers)
d4 <- tm_map(d4,removeWords,stopwords("spanish"))
d4 <- tm_map(d4,removeWords,sw)

d5 <- tm_map(corpus5,content_transformer(tolower))
d5 <- tm_map(corpus5,stripWhitespace)
d5 <- tm_map(d5,removePunctuation)
d5 <- tm_map(d5,removeNumbers)
d5 <- tm_map(d5,removeWords,stopwords("spanish"))
d5 <- tm_map(d5,removeWords,sw)

#Creo los vectores de caracteres
v <- convert.tm.to.character(d)
v2 <- convert.tm.to.character(d2)
v3 <- convert.tm.to.character(d3)
v4 <- convert.tm.to.character(d4)
v5 <- convert.tm.to.character(d5)

rm(d,d2,d3,d4,d5)

#Creo 5 ficheros temporales con los ficheros limpios.
td = tempfile()
dir.create(td)
write(v, file=paste(td, "D1", sep="/"))
write(v2, file=paste(td, "D2", sep="/"))
write(v3, file=paste(td, "D3", sep="/"))
write(v4, file=paste(td, "D4", sep="/"))
write(v5, file=paste(td, "D5", sep="/"))

#Calculo la matriz de términos documentos
termDocMat = textmatrix(td, minWordLength = 1)

#Creo el espcio semántico latente
spaceLSA = lsa(termDocMat, dims = dimcalc_raw())

#Mouestro el espacio semántico latente como matriz.
as.textmatrix(spaceLSA)

