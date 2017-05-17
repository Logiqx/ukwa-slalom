# UK Slalom Results

## Introduction

This project is used a central repository for the [UKWA](http://ukwindsurfing.com) slalom results. The folder structure should be pretty obvious as it is broken down into years and events.

This document aims to describe all of the steps required to generate and publish the UKWA slalom the slalom results but it is by no means an actual tutorial. Familiarity with the scoring software is essential and some basic technical expertise is also required as the process involves hand-editing of [HTML](https://en.wikipedia.org/wiki/HTML) files and uploading them to the UKWA [Results](http://ukwindsurfing.com/results) page.

The scoring software is [SailWave](http://www.sailwave.com/) with the addition of a few custom scoring codes for "attendance points" and "average points". Season discards cannot be pre-determined due to our use of attendance points and average points so they must be determined as the season progresses.

### Attendance Points

After a UKWA slalom event where there is no official racing (e.g. lack of wind) the people in attendance get a score of 0.0 and the people who are absent get a score of 2.0. These points are non-discardable and will therefore count towards the overall rankings.

This addition to the standard [RRS](https://en.wikipedia.org/wiki/Racing_Rules_of_Sailing) is administrated through two custom scoring codes; "ATT 0.0" and "ABS 2.0".

### Average Points

Competitors who miss a UKWA event to attend an international event (e.g. [IFCA](http://ifca.internationalwindsurfing.com) or [PWA](https://www.pwaworldtour.com/index.php?id=920)) can request average points for one event during a season. The request / notification must be submitted to the UKWA at least a week prior to the UKWA event.

Average points are calculated using the arithmetic mean of the events when racing actually took place. All events which were scored using ATT 0.0 or ABS 2.0 are excluded from this calculation.

e.g. After 6 events where a competitor scored 3.0, (DNC 51.0), AVG N.N, 4.0, ATT 0.0, 2.0 the calculation for the AVG result would give 15.0 points. The result for the AVG event would be calculated as (3.0 + 51.0 + 4.0 + 2.0) / 4 = 15.0. The competitor failed to attend the second event (hence DNC 51.0) and requested average points for the third event. The fifth event did not have any official racing due to lack of wind.

It should be noted that DNC results (i.e. non-attendance at events when racing took place) count heavily towards the average points. Attendance points are entered using a custom code "AVG N.N" and must be manually re-calculated as the season progresses.

### Season Discards

Season discards must be determined as the season progresses and are calculated as follows:

* No discards when there have been less than 4 events with official racing
* One discard when there have been 4 or 5 events with official racing
* Two discards when there have been 6 or 7 events with official racing

It should be noted that attendance points (ATT 0.0) and absence points (ABS 2.0) are non-discardable.


## Events

### Summary

Event results are uploaded to the UKWA [Results](http://ukwindsurfing.com/results) page with minimal changes.

The process is as follows:

* Generating Results
    * Renaming Sailwave files to match project standards and storing in the appropriate folder
    * Generating results for each fleet
    * Performing sanity checks for each fleet
* Publishing Results
    * Combining the fleets into a single file
    * Performing sanity checks on the combined results
    * Uploading combined results to the UKWA server
    * Publishing combined results on the UKWA website
* Preparing attendance points
    * This step is only required if the event did not involve any official racing


### Generating Results

#### Renaming Sailwave Files

The Sailwave filenames should conform to project standards; e.g. slalom1-weymouth-am.blw

#### Generating Fleet Results

* Select "Publish" -> "Results..."
* Select the appropriate fleet and click "Final" before pressing "Next"
* Select the "Default plus" style and destination of "A file on my computer/network"
* Use the "Browse..." button to specify the HTML filename

The HTML filenames should conform to project standards; e.g. slalom1-weymouth-am.html

#### Performing Sanity Checks

Check that the HTML files look correct in your favorite browser.


### Publishing Results

#### Combining Fleet Results

Combine the fleets into a single HTML file using your favorite text editor - e.g. slalom1-hayling.html

Tips:

* Each fleet has a "summarytitle" which names the fleet
* Each fleet has a "summarycaption" which shows the number of races sailed, discards, counting, etc.
* Each fleet has a "summarytable" which is the actual results

#### Performing Sanity Checks

Check that the combined HTML file looks correct in your favorite browser.

#### Uploading to the Server

Results are uploaded to the UKWA server via [FTP](https://en.wikipedia.org/wiki/File_Transfer_Protocol) - [FileZilla](https://filezilla-project.org/) is a good FTP client.

Place the results in www_results/year - e.g. www_results/2017

#### Publishing on the Website

Log in to the UK Windsufing [Admin](https://ukwindsurfing.com/admin/) portal.

* Click on "Links" then "Add Link"
* Set "Results listing" = "Results", "Homepage title" = "Slalom 1 - Results"
* Set "Url" = "http://results.ukwindsurfing.com/2017/slalom1-weymouth.html"
* "Event" needs to be selected from a dropdown... search from the bottom upwards
* Set "Content type" = "results", "Discipline" = "Slalom"


### Preparing Attendance Points

If the UKWA slalom event did not involve any actual racing then the series attendance points must be prepared for the overall rankings:

* Export the Sailwave results to the clipboard, including only the "Fleet" and "HelmName" columns
* Paste the clipboard results into a text editor and convert the tab characters to commas
* Append two additional columns to all records in the file; "RaceNo" and "Code"
    * "RaceNo" should be set to the event number; typically 1 to 7 
    * "Code" should be set to "ATT" for all competitors in attendance

The end result should be a [CSV](https://en.wikipedia.org/wiki/Comma-separated_values) file with 4 columns; "Fleet", "HelmName", "RaceNo" and "Code".

The CSV filename should correspond to the original results; e.g. slalom1-weymouth-am.csv


## Rankings

### Summary

The overall rankings require a bit more preparation than event results.

The process is as follows:

* Creating Rankings
    * This step is only required at the start of the season
    * There is one Sailwave file for each fleet
* Updating Rankings
    * Merging event results into the series rankings, whether they be actual results or attendance points
    * Updating the historical non-attendance for new competitors; i.e. ABS 2.0
    * Updating the average points of existing competitors; i.e. AVG N.N
    * Generating rankings for each fleet
    * Performing sanity checks for each fleet
* Publishing Rankings
    * Combining the fleets into a single file
    * Performing sanity checks on the combined rankings
    * Uploading combined rankings to the UKWA server
    * Publishing combined rankings on the UKWA website


### Creating Rankings

Each fleet needs to have a Sailwave series created at the start of the season.

One easy approach is to use an existing series, deleting all of the existing competitors and races.

Setup -> Series properties...

* Event name = UKWA Slalom 2017
* Event website = www.ukwindsurfing.com
* Venue name = Series
* Venue website = github.com/Logiqx/ukwa-slalom

Setup -> Scoring System... -> Scoring codes

* Add ATT = Fixed points of 0 - non-discardable
* Add ABS = Fixed points of 2 - non-discardable
* Add AVG = Set points by hand

### Updating Rankings

#### Merging Event Results

Actual results are imported as follows:

* File -> Merge in another Sailwave series...
* Select the appropriate Sailwave file

Attendance codes are imported as follows:

* File -> Import results from CSV file...
* Select the appropriate CSV file and press "Next"
* Map the fields where necessary and complete the CSV import
* Once the CSV has been imported, ensure the race is non-discardable
* Once the CSV has been imported, change the code for all absent attendees to ABS

Once the results have been imported, rename the race to the name of the venue.

#### Updating Attendance Points

After merging / importing the latest results the series may contain some new competitors.

Ensure the new competitors are marked as ABS for any previous events which were scored on attendance.

#### Updating Average Points

After adding the new race / event you may need to re-calculate the AVG points for some competitors. 

#### Generating Fleet Rankings

* Select "Publish" -> "Results..."
* Select the appropriate fleet and click "Provisional" before pressing "Next"
* Select the "Default plus" style and destination of "A file on my computer/network"
* Use the "Browse..." button to specify the HTML filename

The HTML filenames should conform to project standards; e.g. slalom-rankings-am.html

#### Performing Sanity Checks

The following checks need to be performed after you have updated the rankings:

* Look for people who are duplicated due to their name being mis-spelt
    * If duplicates are spotted then transfer the results to the correct competitor and delete the duplicate
* Check the series discards are correct
    * If the series discards are incorrect then specify them in Setup -> Scoring system... -> Series Scoring -> Discard profile
* Check that all of the events have a proper name and not R1, R2, etc.
    * If an event needs naming then use Edit -> Edit race...
* Check that ATT / ABS codes are not being discarded
    * If ATT / ABS codes are being discarded then use Edit -> Edit race... to make it non-discardable
* Check that AVG points are calculated correctly
    * If AVG points are incorrect then fix them by double-clicking the incorrect cell

### Publishing Rankings

#### Combining Fleet Rankings

Combine the fleets into a single HTML file using your favorite text editor - e.g. slalom-rankings.html

Tips:

* Each fleet has a "summarytitle" which names the fleet
* Each fleet has a "summarycaption" which shows the number of races sailed, discards, counting, etc.
* Each fleet has a "summarytable" which is the actual results

#### Performing Sanity Checks

Check that the combined HTML file looks correct in your favorite browser.

#### Uploading to the Server

Results are uploaded to the UKWA server via [FTP](https://en.wikipedia.org/wiki/File_Transfer_Protocol) - [FileZilla](https://filezilla-project.org/) is a good FTP client.

Place the results in www_results/year - e.g. www_results/2017

#### Publishing on the Website

No publishing is required for the rankings as with individual events results.

The UKWA website will automatically show the rankings if the HTML file is named correctly.

