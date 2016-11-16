#Procesamiento del lenguaje natural

###Introducción

El Procesamiento del Lenguaje Natural (PLN) es la disciplina encargada de producir sistemas informáticos que posibiliten dicha comunicación, por medio de la voz o del texto. Se trata de una disciplina tan antigua como el uso de las computadoras (años 50), de gran profundidad, y con aplicaciones tan importantes como la traducción automática, la búsqueda de información en Internet, la extracción de la información o el reconocimiento del habla.

En los últimos años, las organizaciones han visto crecer de forma exponencial los datos disponibles de sus clientes, proveedores e incluso de su propia organización. Estos datos se obtienen principalmente a través de sistemas multicanal de atención al cliente (Sistemas ERP), así como de la actividad en las redes sociales. Por el modo de obtención son datos fundamentalmente desestructurados en texto o en voz que deben ser tratados de manera que pueda extraerse de ellos la información subyacente.

El tratamiento de información no estructurada y, en particular, el procesamiento del lenguaje natural, es una las líneas de especialización que las organizaciones están desarrollando de forma muy activa, para ofrecer a sus clientes una completa gama de soluciones que permiten ganar eficiencia y mejorar la calidad de los servicios ofrecidos.

El principal objetivo de la práctica, es desarrollar habilidades con tecnologías que permitan dar solución a problemas reales de manera eficaz e innovadora.

##Instrucciones

La práctica se desarrollará de forma individual. Los conjuntos de datos (corpus lingüístico) deben de obtenerse de fuentes abiertas, foros, documentación técnica, o redes sociales de la temática seleccionada. Asegure, que los datos (textos) que elige le permitan realizar las actividades propuestas en los próximos tópicos. El análisis puede apoyarse en el lenguaje R, el IDE RStudio y los más de 9000 paquetes con los que cuenta.

##Desarrollo

Con la ayuda de las tecnologías del procesamiento del lenguaje natural, presentadas en la práctica tutorizada, desarrolle las siguientes actividades.

1. Elija un corpus lingüístico (con al menos 5 documentos) de uno de los siguientes ámbitos (Big Data, Minería de textos, modelos de negocios, NOSQL, CRM). Los documentos/materiales pueden estar en idioma inglés, español u otro del que posea conocimientos y/o existan herramientas para su procesamiento.
2. Transforme los datos a formatos compatibles con los métodos de paquetes para el PLN (formato ASCII).
3. Realice transformaciones con el corpus similar a las desarrolladas en la actividad tutorizada (minúscula, espacios en blanco, eliminar signos de puntuación, eliminar números, eliminación de palabras vacías).
4. Obtenga la matriz de Términos-Documentos. ¿Qué indica esta matriz?
5. En el lenguaje natural: las palabras del mismo campo semántico suelen aparecer juntas o en similares contextos. Con el empleo del paquete LSA y la
documentación consultada realice un análisis de la semántica latente.[lsa]
6. Muestre el espacio semántico latente donde las filas son los términos y las columnas son documentos. [as.textmatrix].
7. Obtenga un resumen de las principales estadísticas de la matriz de textos. [summary].
8. Realice un nuevo análisis LSA de un documento (del dominio seleccionado).
9. Compare la similitud o pertenencia entre el corpus inicial (más de cinco documentos) y este inicial que solo contiene uno. Determine su similitud con la métrica similitud del coseno [cosine]. ¿Pertenece al corpus inicial? ¿Qué grado de similitud tienen?
10. Repita el análisis que realizó en el tópico anterior con el método "spearman". ¿Difieren los resultados?
