#Elections 2017 
# Data from CNE 
# Dataset for all women candidates 
library(dplyr)

#women candidates for ID and alliances 

# good pagge for tricks and filtering https://sebastiansauer.github.io/dplyr_filter/

# filter all ID alliances from organizaciones politicas 
library(stringr)
#make sure it is as character
organizaciones_polticas_2017$OP_LISTA<- as.character(organizaciones_polticas_2017$OP_LISTA)
IDtemp<-organizaciones_polticas_2017%>%
  filter(str_detect(OP_LISTA, "12"))
#added extra variable to have all alliances 
IDtemp$IDonly<- "allID"
# good for subsetting tips https://www.r-bloggers.com/5-ways-to-subset-a-data-frame-in-r/
IDmerge<- IDtemp [, c(1,18)]

# merge for ID 
CAND2017<- merge(CANDIDATOS_2017_cedulas, IDmerge, by = "OP_CODIGO")

#this creates dataset for all ID candidates: in total 141 
WID<- CAND2017%>%
  filter(CANDIDATO_SEXO == "2")
WIDL<- CAND2017%>%
  filter(CANDIDATO_SEXO == "2", DIGNIDAD_CODIGO  %in% c(7, 9))
WMIDL<-  CAND2017%>%
  filter( DIGNIDAD_CODIGO  %in% c(7, 9))  
