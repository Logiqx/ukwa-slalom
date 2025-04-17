## UKWA - One Hour Classic

### Overview

- The race uses a "figure of eight" course, with two buoys approximately 1 km apart.
- The race begins with a rabbit start, where a gate gradually opens between the buoy and the boat.
- The race finishes after an hour, but competitors get to complete their current lap.
- The aim is to complete as many laps as possible, and beat your rivals over the finish line!

![templaye](img/template-50pc.png)



### Results

Results are based on the total number of laps completed and the time taken. Here is an example...

![torbole-2024](img/torbole-2024.png)

### Use of GPS / GNSS Technology

In principle the UKWA event could be run using the Motion GPS devices that belong to Weymouth Speed Week. Extracting data from the Motion GPS devices is straightforward, but some bespoke software would be required to generate the race results.

It should be assumed that the buoys will drift over time, and that the distance between the two buoys may change throughout the race. Several different approaches / algorithms have been considered as possibilities, each varying in overall complexity.

The most comprehensive (but complex) approach was conceived of first with automatic gybe detection and precise finishing times. The subsequent approaches are far less onerous in terms of overall complexity and development + testing effort.



#### Approach 1

The first approach requires a Motion GPS on both buoys, thus recording their position during every second of the race. The general idea is that gybes can be detected for riders passing though zones A, B, C, D. Precise lap / finish times can also be established as the rider enters the appropriate zone(s) marking the finish line.

![approach-1-50pc](img/approach-1-50pc.png)

This is the most complex approach that one might choose to implement, but the most comprehensive. The everchanging orientation of the course, and application of adaptive geofencing should work well, but requires a significant amount of software development + testing.

Additionally, there is also the requirement for a Motion GPS to be mounted on top of both buoys, pointing upwards for a clear sky view. If either Motion GPS were to malfunction then it may be impossible to generate any results.



#### Approach 2

The second approach also requires a Motion GPS on both buoys, recording their position during every second of the race. Unlike the first approach, this one simply uses proximity checks to determine when the rider is in the proximity of each buoy (e.g. 50 or 100 meters), not comprehensive gybe detection. The boat crews would therefore need to keep an eye out for any cheating, and record the actual finishing positions.

![approach-2-50pc](img/approach-2-50pc.png)

This approach is a lot simpler than the first one, but also has the requirement for a Motion GPS on top of both buoys, pointing upwards for a clear sky view. If either device were to malfunction then it may be impossible to generate any results. It will also be reliant on the boat crews keeping an eye out for cheating at the gybe marks and to record the exact finishing positions.



#### Approach 3

The third approach dispenses with the idea of a Motion GPS on the far buoy. It relies upon one Motion GPS on the boat, and another on the start / finish buoy. The idea is to detect completed laps as people enter the green box, through the use of adaptive geofencing. In simple terms, automatically adjusting the green box according to the actual locations of the boat and the buoy. This is not nearly so complex as the first approach with comprehensive gybe detection, but still a lot more complex than the proximity tests used by the second approach.

![approach-3-50pc](img/approach-3-50pc.png)

Approach 3 would provide accurate finishing times and would be quicker to develop + test than approach 1, but more onerous than approach 2. It also requires a Motion GPS to be mounted on top of the first buoy, which may not be straightforward. The boat crews will need to keep an eye out for cheating at the gybe marks.



#### Approach 4

The final approach attempts to address some of the risks and complexities of the first three approaches. The start / finish boat can have a Motion GPS mounted so that it is secure, and has a clear view of the sky. A second Motion GPS on the start / finish boat could also serve as backup, mitigating any risk(s) of data loss. It would be very unlikely that there would be any issue(s) recording the location of the start / finish boat.

Beyond a certain distance from the start / finish boat would be regarded as Zone A and would include the gybe mark. The boat at this buoy will need to keep an eye out for any cheating. When the rider re-enters Zone C they will be deemed to have completed a lap and they need to head back to Zone A. The proximity check will be sufficient for most of the rankings, but the boat crew should still record the precise order of all the finishers.

![approach-4-50pc](img/approach-4-50pc.png)



The radius of Zone C should be slightly larger than the maximum distance between the start / finish boat and the buoy. Provisional rankings can be produced based on the times that riders enter Zone C on their final lap and where necessary, manually adjusted to match the order recorded by the boat crew. The start / finish boat should be relatively close to the buoy throughout the race, so that Zone C has a radius of 100 meters or less.

There are two big advantages to this particular approach. Firstly, it is far more practical because a Motion GPS does not need to be attached to the top of either buoy. Recording the position of the start / finish boat is far more practical and the likelihood of any technical issues are negligible. Secondly, software development + testing effort is significantly lower than any of the other ideas.

In essence, throughout the race each rider need only have the distance between their current location and the start / finish boat calculated. Determination of their lap times will be based on entering Zone C, and they have to enter Zone A before another lap can be completed. Overall, it's a relatively simple algorithm to implement and does not require nearly so much development + testing effort.



### Summary

The most practical way to use Motion GPS devices for the UKWA one hour classic would be as follows:

1. Secure two Motion GPS devices to the start / finish boat, recording its position every second.
2. Use existing software from Weymouth Speed Week to download data from all of the Motion GPS devices.
3. Implement Approach 4, provisionally ranking riders based on the laps completed and approximate finish times.
4. Adjust the provisional rankings (where necessary) based on the finishing positions recorded by the boat crew.
5. Rankings should also include the total distances for each rider, thus providing a quick and easy sanity check.

It's still not an insignificant task to develop + test the required software, but it is probably the most pragmatic approach.
