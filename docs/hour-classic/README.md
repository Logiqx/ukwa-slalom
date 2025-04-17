## UKWA - One Hour Classic

### Overview

The idea behind a one hour classic is quite straightforward.

- The race uses a "figure of eight" course, with two buoys approximately 1 km apart.
- The race begins with a rabbit start, where a gate gradually opens between the buoy and the boat.
- The race finishes after an hour, but competitors get to complete their current lap.
- The aim is to complete as many laps as possible, and beat your rivals over the finish line!

![templaye](img/template-50pc.png)



### Results

Results are based on the total number of laps completed and the total time taken. Here is an example...

![torbole-2024](img/torbole-2024.png)

### Use of GPS / GNSS Technology

In principle the UKWA event could be run using the Motion GPS devices that belong to Weymouth Speed Week. Extracting data from the Motion GPS devices is straightforward, but bespoke software would need to be developed + tested to generate the race results.

It should be assumed that the buoys will drift over time, and that the distance between the two buoys may change throughout the race. Several different approaches / algorithms have been considered as possibilities, each varying in overall complexity.

The most comprehensive (but complex) approach was conceived of first with automatic gybe detection and precise finishing times. The subsequent approaches are far simpler and much less onerous in terms of overall complexity, development and testing.



#### Approach 1

The first approach requires a Motion GPS on both buoys, thus recording their position during every second of the race. The general idea is that gybes can be detected as riders pass though zones A, B, C, D. Precise lap / finish times can also be established as the rider enters the appropriate zone(s) marking the finish line.

![approach-1-50pc](img/approach-1-50pc.png)

This is the most complex approach that one might choose to implement, but the most comprehensive. The ever changing orientation of the course, and application of adaptive geofencing should work well, but requires a significant amount of software development + testing.

Additionally, there is also the requirement for a Motion GPS to be mounted on top of both buoys, pointing upwards for a clear sky view. This may not be easy without pockets on top of the buoys. If either Motion GPS were to malfunction then it may be impossible to generate any results.



#### Approach 2

The second approach also requires a Motion GPS on both buoys, recording their position during every second of the race. Unlike the first approach, this one simply uses proximity checks to determine when the rider is in the proximity of either buoy (e.g. within 50 or 100 meters). The boat crews would need to keep an eye out for any cheating, and record the actual finishing positions.

![approach-2-50pc](img/approach-2-50pc.png)

This approach is a lot simpler than the first one, but also has the requirement for a Motion GPS on top of both buoys, pointing upwards for a clear sky view. If either device were to malfunction then it may be impossible to generate any results. It will also be reliant on the boat crews keeping an eye out for cheating at the gybe marks and to record the exact finishing positions.



#### Approach 3

The third approach dispenses with the idea of a Motion GPS on the far buoy. It relies upon one Motion GPS on the boat, and another on the start / finish buoy. The idea is to detect completed laps as people enter the green box, through the use of adaptive geofencing. In simple terms, automatically adjusting the (virtual) green box, according to the actual locations of the boat and the buoy. This is not nearly so complex as the first approach with automatic gybe detection, but still a lot more complex than the simple proximity tests of the second approach.

![approach-3-50pc](img/approach-3-50pc.png)

Approach 3 would provide accurate finishing times and would be quicker to develop + test than Approach 1, but somewhat more onerous than Approach 2. It also requires a Motion GPS to be mounted on top of the first buoy, which may not be straightforward. The boat crews will need to keep an eye out for cheating at the gybe marks.



#### Approach 4

The final approach attempts to address some of the risks and complexities of the first three approaches. The start / finish boat will require a Motion GPS securely mounted and with a clear view of the sky. A second Motion GPS should also be onboard serving as a standby / backup, mitigating any risk(s) of data loss. It is extremely unlikely that both devices would have an issue, and far more practical to mount them on a boat.

Zone A includes the "outer" gybe mark and could begin at roughly halfway between the buoys (e.g. 500 meters). The boat at the gybe mark will need to keep an eye out for any cheating. When riders re-enter Zone C they will be deemed to have completed a lap and need to head back towards Zone A. Simple proximity checks will be sufficient for the majority of the rankings, but the boat crew should still record the precise order of all the finishers.

![approach-4-50pc](img/approach-4-50pc.png)



The radius of Zone C should be slightly larger than the maximum distance between the start / finish boat and the buoy. Provisional rankings can be produced based on the times when riders enter Zone C on their final lap. Where necessary, rankings can be manually adjusted to match the order recorded by the boat crew. The start / finish boat should be relatively close to the buoy throughout the race, perhaps 100 meters or less.

There are two big advantages to this particular approach. Firstly, it is far more practical because a Motion GPS does not need to be attached to any of the buoys. Mounting the Motion GPS device(s) on the start / finish boat is far more practical and the likelihood of any technical issues are significantly reduced. Secondly, overall software development + testing effort is significantly lower than any of the other approaches.

In essence, throughout the race each rider need only have the distance between their current location and the start / finish boat calculated. Determination of their lap times can simply be based on entry to Zone C, and Zone A has to be entered before another lap can be completed. Overall, it's a relatively simple algorithm to implement and does not require nearly so much development + testing effort as the other approaches.



### Summary

The most practical way to use Motion GPS devices for the UKWA one hour classic would be as follows:

1. Secure Motion GPS devices (primary + backup) to the start / finish boat, recording its position every second.
2. Use existing software from Weymouth Speed Week to download data from all of the Motion GPS devices.
3. Provisionally rank riders based on the total number of laps completed and (approximate) finish times.
4. Adjust the provisional rankings (where necessary) based on the finishing positions recorded by the boat crew.
5. Rankings should also include the total distance for each rider, thus providing a quick + easy sanity check.

It's still not an insignificant task to develop + test the required software, but it is probably the most pragmatic approach.
