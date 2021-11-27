# bibliometrixExtra

# `bibliometrixExtra`: R for synonyms 

JW
> Build a customed package `bibliometrixExtra`  (Extended functions for bibliometrix) to put the functions in, that will make the synonyms replacing processing  easier.

[TOC]


## ★ Usage

```r=
devtools::install_github('tsai-jiewen/bibliometrixExtra')
library(bibliometrixExtra) # syn_export(), syn_replace()
library(bibliometrix)
library(tidyverse)
```

### 1. Using `syn_export()` to export csv from `bibliometrix`.
(from the customed package `bibliometrxEtra` )

```r=
data(scientometrics, package = "bibliometrixData")

# make a tab-freq table, than export as a csv file
syn_export(
    file = 'test1124.csv'   # export file name
    data = scientometrics,  # the biblio data
    tag = 'ID',             # the field tag  
)
```

the export file looks like that:
![](https://i.imgur.com/UmKGKsQ.png)

- fill in the terms you want to replace by in col C (replace), one by one.
- delete the terms no need to change in col B (pattern).

like this, (for example)
change 'CITATIONS' and 'CITATION ANALYSIS' to 'APPLE'.
![](https://i.imgur.com/XGQ1sWP.png)


### 2. Using `syn_import()` to read the edited csv file into R env.
```r=
DTF <- syn_import(file = 'test1124.csv')
```
check
```
> DTF
            pattern  replace
1         CITATIONS    APPLE
2 CITATION ANALYSIS    APPLE
```

### 3. Using `syn_replace()` to replace the original synonyms terms. 
(from the customed package `bibliometrxEtra` )

take 'ID' for example.
you can change to 'DE', etc, but remember keep the `$ID` and `tag='ID'` as the same.
```r=
scientometrics$ID <- syn_replace(
  df = DTF,               # the edited file you import
  data = scientometrics,  # the original biblio data
  tag = 'ID'              # the field tag  
)
```


### Remark
the term-replacing takes place at the bibliometrix data.frame, so it can continue to be used in the next analysis.
