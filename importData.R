#### set path ####
setwd(Sys.getenv("hvs"))

#### load data ####
# data 1
x <- fread("Data/CSV/Testergebnisse 2. HVS-Sichtung Jg. 2003 05-2016.csv", check.names=TRUE, header=TRUE)
cols <- c(
  'Bezirk',
  'Name',
  'Vorname',
  'X20m.mB',
  'X20m.oB',
  'X8ter',
  'Hbw',
  'J.R',
  'Kader')
x <- x[,..cols]
x <- na.omit(x)

# data 2
x2 <- fread("Data/CSV/Testergebnisse 2003w HVS-Sichtung 11-2015.csv", check.names=TRUE, header=TRUE)
cols <- c(
  'Bezirk',
  'Name',
  'Vorname',
  'X8x3m',
  'Standweit',
  'Seil',
  'Handling',
  'Test.TH',
  'Kader')
x2 <- x2[,..cols]
x2 <- na.omit(x2, cols = 'Kader')

# merge data1 and data2
x <- merge(x, x2, by = c('Bezirk','Name','Vorname','Kader'))
x$Kader <- as.factor(x$Kader)

