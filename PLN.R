library(tm)
library(ggplot2)
library(wordcloud)

txt <- readLines("/Users/Losnen/Desktop/TIO/PLN-R/txt/MT1.txt",encoding="UTF-8")
txt2 <- readLines("/Users/Losnen/Desktop/TIO/PLN-R/txt/MT2.txt",encoding="UTF-8")
txt3 <- readLines("/Users/Losnen/Desktop/TIO/PLN-R/txt/MT3.txt",encoding="UTF-8")
txt4 <- readLines("/Users/Losnen/Desktop/TIO/PLN-R/txt/MT4.txt",encoding="UTF-8")
txt5 <- readLines("/Users/Losnen/Desktop/TIO/PLN-R/txt/MT5.txt",encoding="UTF-8")
txt <- append(txt,txt2)
txt <- append(txt,txt3)
txt <- append(txt,txt4)
txt <- append(txt,txt5)


txt = iconv(txt,to="ASCII//TRANSLIT")

corpus <- Corpus(VectorSource(txt))

d <- tm_map(corpus,content_transformer(tolower))
d <- tm_map(corpus,stripWhitespace)
d <- tm_map(d,removePunctuation)
d <- tm_map(d,removeNumbers)


d <- tm_map(d,removeWords,stopwords("spanish"))

sw <- readLines("/Users/Losnen/Desktop/TIO/R/Ejemplo_R/Datos/stopwords.es",encoding="UTF-8")
sw = iconv(sw,to="ASCII//TRANSLIT")
d <- tm_map(d,removeWords,sw)

tdm <- TermDocumentMatrix(d)
m = as.matrix(tdm)

wf <- sort(rowSums(m),decreasing = TRUE)

dm <- data.frame(word = names(wf), freq = wf)

findFreqTerms(tdm,lowfreq = 20)
wordcloud(dm$word,dm$freq,random.order = FALSE,color = brewer.pal(8,"Pastel1"))

#dm[1:10, ] %>%
 # ggplot(aes(word, freq)) +
  #geom_bar(stat = "identity", color = "black", fill = "#87CEFA") +
  #geom_text(aes(hjust = 1.3, label = freq)) + 
  #coord_flip() + 
  #labs(title = "Diez palabras más frecuentes en la Constitución Española",  x = "Palabras", y = "Número de usos")
