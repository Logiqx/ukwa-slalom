# UK Slalom Results

## Introduction

This project is used a central repository for the [UKWA](http://ukwindsurfing.com) slalom results. The folder structure should be pretty obvious as it is broken down into years and events.

This document aims to describe all of the steps required to generate and publish the UKWA slalom the slalom results but it is by no means an actual tutorial. Familiarity with the scoring software is essential and some basic technical expertise is also required as the process involves hand-editing of [HTML](https://en.wikipedia.org/wiki/HTML) files and uploading them to the UKWA [Results](http://ukwindsurfing.com/results) page.

The scoring software is [SailWave](http://TODO) with the addition of a few custom scoring codes for "attendance points" and "average points". Season discards cannot be pre-determined due to our use of attendance points and average points so they must be determined as the season progresses.

### Attendance Points

After a UKWA slalom event where there is no official racing (e.g. lack of wind) the people in attendance get a score of 0.0 and the people who are absent get a score of 2.0. These points are non-discardable and will therefore count towards the overall rankings.

This addition to the standard [RRS](https://en.wikipedia.org/wiki/Racing_Rules_of_Sailing) is administrated through two custom scoring codes; "ATT 0.0" and "ABS 2.0".

### Average Points

Competitors who miss a UKWA event to attend an international event (e.g. [IFCA](http://ifca.internationalwindsurfing.com) or [PWA](https://www.pwaworldtour.com/index.php?id=920)) can request average points for one event during a season. The request / notification must be submitted to the UKWA at least a week prior to the UKWA event.

Average points are calculated using the arithmetic mean of the events when racing actually took place. All events which were scored using ATT 0.0 or ABS 2.0 are excluded from this calculation.

e.g. During a season where a competitor scored 3.0, (DNC 51.0), 4.0, ATT 0.0, 2.0 then average points for the 7th event would be 15 points, calculated using (3.0 + 51.0 + 4.0 + 2.0) / 4 = 15.0.

It should be noted that DNC results (i.e. non-attendance at events when racing took place) count heavily towards the average points. Attendance points are entered using a custom code "AVG N.N" and must be manually re-calculated as the season progresses.

### Season Discards

Season discards are applied as follows:

* No discards when there have been less than 4 events with official racing
* One discard when there have been 4 or 5 events with official racing
* Two discards when there have been 6 or 7 events with official racing

It should be noted that attendance points (ATT 0.0) and absence points (ABS 2.0) are non-discardable.


## Events

### Summary

Event results are uploaded to the UKWA [Results](http://ukwindsurfing.com/results) page with minimal changes.

The process is as follows:

* Generating Results
    * Renaming Sailwave files so they conform to project standards and are stored in the appropriate folder
    * Generating results for each fleet
    * Performing sanity checks for each fleet
* Publishing Results
    * Combining the fleets into a single file
    * Performing sanity checks on the combined results
    * Uploading results to the UKWA server
    * Publishing results on the UKWA website
* Preparing attendance points
    * This step is only required if the event did not involve any actual racing


### Generating Results

#### Renaming Sailwave Files

TODO

* The Sailwave filenames should conform to project standards; e.g. slalom1-weymouth-am.blw

#### Generating Fleet Results

TODO

* Results are marked as "final" when published to the local HTML file
* The results are published using the "default plus" style / template
* The HTML filenames should conform to project standards; e.g. slalom1-weymouth-am.html

#### Performing Sanity Checks

TODO


### Publishing Results

#### Combining Fleet Results

TODO

#### Performing Sanity Checks

TODO

#### Uploading to the Server

TODO - Results are uploaded to the UKWA server via [SFTP](https://en.wikipedia.org/wiki/Secure_file_transfer_program).

#### Publishing on the Website

TODO - Adding to results page


### Preparing Attendance Points

If the UKWA slalom event did not involve any actual racing then the series attendance points must be prepared for the overall rankings:

* Export the Sailwave results to the clipboard, including only the "Fleet" and "HelmName" columns
* Paste the clipboard results into a text editor and convert the tab characters to commas
* Append two additional columns to all records in the file; "RaceNo" and "Code"
    * "RaceNo" should be set to the event number; typically 1 to 7 
    * "Code" should be set to ATT for all competitors in attendance

The end result should be a [CVS](https://en.wikipedia.org/wiki/Comma-separated_values) file with 4 columns; Fleet, HelmName, RaceNo and Code.

The CSV should be named to match the original results; e.g. slalom1-weymouth-am.csv


## Rankings

### Summary

The series results require a bit more preparation than event results.

The process is as follows:

* Creating Rankings
    * This step is only required at the start of the season
* Updating Rankings
    * Merging event results into the series rankings, whether they be for racing or attendance
    * Updating the historical non-attendance for new competitors; i.e. ABS 2.0
    * Updating the average points of existing competitors; i.e. AVG N.N
    * Generating rankings for each fleet
    * Performing sanity checks for each fleet
* Publishing Rankings
    * Combining the fleets into a single file
    * Performing sanity checks on the combined rankings
    * Uploading rankings to the UKWA server
    * Publishing rankings on the UKWA website


### Creating Rankings

TODO


### Updating Rankings

#### Merging Event Results

TODO - include naming of the event

#### Updating Attendance Points

TODO

#### Updating Average Points

TODO

#### Generating Fleet Rankings

TODO

* Results are marked as "final" when published prior to upload
* The results are published to a HTML file using the "default plus" style

#### Performing Sanity Checks

TODO



### Publishing Rankings

#### Combining Fleet Rankings

TODO

#### Performing Sanity Checks

TODO

#### Uploading to the Server

TODO - Results are uploaded to the UKWA server via [SFTP](https://en.wikipedia.org/wiki/Secure_file_transfer_program).

#### Publishing on the Website

TODO - N/A

