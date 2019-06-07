#this code is designed to show the relationship between inequality and globalization, with FDI as a proxy
#source: https://data.worldbank.org/ 

#import GINI dataset
gini<-read.csv(file="gini.csv",header=TRUE,sep=",")

#reshape GINI dataset from wide to long
gini<-reshape(gini,varying=c("X1979",	"X1980",	"X1981",	"X1982",	"X1983",	"X1984",	"X1985",	"X1986",	"X1987",	"X1988",	"X1989",	"X1990",	"X1991",	"X1992",	"X1993",	"X1994",	"X1995",	"X1996",	"X1997",	"X1998",	"X1999",	"X2000",	"X2001",	"X2002",	"X2003",	"X2004",	"X2005",	"X2006",	"X2007",	"X2008",	"X2009",	"X2010",	"X2011",	"X2012",	"X2013",	"X2014",	"X2015",	"X2016",	"X2017",	"X2018"
),direction="long",idvar="Country.Name",sep="")

#rename GINI variable
gini$gini<-gini$X

#create unique ID concatenated from country name and year
gini$id<-paste(gini$Country.Name,gini$time)

#import FDI dataset
fdi<-read.csv(file="fdi.csv",header=TRUE,sep=",")

#reshape FDI dataset from wide to long
fdi<-reshape(fdi,varying=c("X1979",	"X1980",	"X1981",	"X1982",	"X1983",	"X1984",	"X1985",	"X1986",	"X1987",	"X1988",	"X1989",	"X1990",	"X1991",	"X1992",	"X1993",	"X1994",	"X1995",	"X1996",	"X1997",	"X1998",	"X1999",	"X2000",	"X2001",	"X2002",	"X2003",	"X2004",	"X2005",	"X2006",	"X2007",	"X2008",	"X2009",	"X2010",	"X2011",	"X2012",	"X2013",	"X2014",	"X2015",	"X2016",	"X2017",	"X2018"
),direction="long",idvar="Country.Name",sep="")

#rename FDI variable
fdi$fdi<-fdi$X

#create unique ID concatenated from country name and year
fdi$id<-paste(fdi$Country.Name,fdi$time)

#merge FDI and GINI datasets
inequality<-merge(gini,fdi,by="id")

#specify variables to keep
myvars<-c("id","Country.Name.x","time.x","gini","fdi")

#drop irrelevant variables
inequality<-inequality[myvars]

