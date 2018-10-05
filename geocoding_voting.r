#The main source for this code was extracted from the blog post below
#http://www.storybench.org/geocode-csv-addresses-r/

rm(list = ls())
library(ggmap)
library(data.table)
library(dplyr)

local <- fread('~/Dropbox/Working papers/2015 policia/data/locais_voto_2016.csv',encoding = 'UTF-8')

local[,c('NR_LOCVOT','CD_PROCESSO_ELEITORAL','CD_PLEITO','NR_SECAO'):=NULL] #this removes multiple locais de votacao that are in the same address

local <- unique(local)

local_short <- copy(local)

register_google('') # insert your API key here

local_short[,address:=paste0(DS_ENDERECO,", ",NM_LOCALIDADE,", ",SG_UF,sep="")]

#https://stackoverflow.com/questions/30770328/how-to-handle-error-from-geocode-ggmap-r

remaining <- local_short[1:nrow(local_short)]

for(i in 1:nrow(remaining)){
  # Print("Working...")
  possibleWarning <- tryCatch(
    geocode(remaining$address[i], output = "latlona", source = "google",override_limit = TRUE), #not sure about this override limit = TRUE condition, but it worked.g
    warning=function(w) print("warning") #when geocode cannot find the address it breaks the loop. this goes around it
  )
  
  if(!inherits(possibleWarning, "warning")){
  remaining$lat[i] <- as.numeric(possibleWarning[1])
  remaining$lon[i] <- as.numeric(possibleWarning[2])
  remaining$geoAddress[i] <- as.character(possibleWarning[3])
  Sys.sleep(time = .0105) #google limits queries per second. This prevents query limit
  }
}

geo_voting = remaining[!is.na(geoAddress)]

write.table(geo_voting,'~/geo_voting.txt')


