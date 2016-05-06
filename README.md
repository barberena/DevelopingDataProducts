## Los Angeles County Crime

by [Steven Barberena](https://www.linkedin.com/in/sbarberena)

The source for this Shiny App and the Slidify Presentation is located at
[GitHub](https://github.com/barberena/DevelopingDataProducts)

The Slidify presentation is located at [RPubs](http://rpubs.com/barberena/LACCrime)

This project was developed for the Coursera Project [Developing Data Products](https://www.coursera.org/specializations/jhu-data-science)

## Data

The data used for this assignment was found at the [Public Safety Open Data Portal](http://publicsafetydataportal.org/all-data/).
The data can be downloaded from the [Los Angeles County Open Data](https://data.lacounty.gov/Criminal/LA-SHERIFF-CRIMES-FROM-2004-TO-2015/3dxh-c6jw)
web site.  The data is retrieved by using the "export" tool and saved as a CSV file.

The amount of data that was provided by Los Angeles County goes back 12 year.
Using all that data causes Shiny to run very slowly.  To speed up the Shiny App,
the data used was filtered to the last 5 years.

## How to Use

> 1. Click on the Map tab.
> 2. Select the available Year from the drop-down list to change the Year of the data shown.
> 3. Select the type of crime from the drop-down list to change the types of crime shown on the map.  
	 Note that the number of incidents for that crime is calculated and displayed above the map.
> 4. You can drag the map to move around.
> 5. You can press the minus or plus buttons to zoom in and out of the map.  A mouse scroll will also zoom in and out.
> 6. Click on one of the markers to see the incident number, date, street address, and city for that crime.




