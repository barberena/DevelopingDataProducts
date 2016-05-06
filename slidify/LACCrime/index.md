---
title       : Los Angeles County
subtitle    : Crime Map Markers 2011 to 2015
author      : Steven Barberena
job         : Integration Software Engineer
logo        : Patch_of_the_Los_Angeles_County_Sheriff's_Department.png
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Los Angeles County Crime 2011 to 2015

Crime effects people and communities.  The [Los Angeles County Crime](https://barberena.shinyapps.io/LACCrimes/) Shiny Applicaiton
marks the locaiton of crimes that occur within the juristiction of Los Angeles
County.  It allows the user to explore the county and discover crimes at a given
location. 

<img class=center src=assets/img/LACCrime.png height=450>

--- .class #id 

## The Application Parameters

<img class=center src=assets/img/LACCrimeParameters.png height=200>

There are two parameters that a user can change.

1. Year - When loading the data, the application determines all years avaliable and
dynamically builds the selectable items.  The user can then select from the years.

2. Crime Type - This selection field also is dynamically created during the loading of
the data to determine what crime types are avaliable across all years.

Changing any of these parameters results in the map being automatically updated.

---

## The Application Map

<img class=center src=assets/img/LACCrimeMap.png height=350>

The map allows the user to perform many actions including panning around, zooming in
and out, as well as selecting markers to read details about a given incident.

Notice that just above the map are the parameters that the user selected and are being used
by the map as well as the number of incident types found for the given parameters selected.

---

## The Data

The data used for the Shiny Application was found at the [Public Safety Open Data Portal](http://publicsafetydataportal.org/all-data/).
The data can be downloaded from the [Los Angles County Open Data](https://data.lacounty.gov/Criminal/LA-SHERIFF-CRIMES-FROM-2004-TO-2015/3dxh-c6jw)
web site.  The data is retrieved by using the "export" tool and saved as a CSV file.


```r
sourceUrl <- "https://data.lacounty.gov/api/views/3dxh-c6jw/rows.csv?accessType=DOWNLOAD"
targetFile <- "LA_SHERIFF_CRIMES_FROM_2004_TO_2015.csv"

# if we haven't already downloaded the file, download it
if (!file.exists(targetFile))
    download.file(sourceUrl, destfile = targetFile)
```

The amount of data that was provided by Los Angles County goes back 12 year.
Using all that data causes Shiny to run very slowly.  To speed up the Shiny App,
the data used was filtered to the last 5 years.

The source for the Shiny App and the Slidify Presentation is located at
[GitHub](https://github.com/barberena/DevelopingDataProducts). In that project,
a research folder contains the R scripts used to download, explore, tidy,
subset and save the data.
