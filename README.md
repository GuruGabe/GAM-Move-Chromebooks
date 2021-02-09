# GAM-Move-Chromebooks
This will use GAM to retrieve a list of Chromebooks in the default OU and move to correct OU based on annotatedLocation and annotatedAssetId

*Windows machines* open command line and cd into your working directory. Run gam print ous>ou.csv
This will list all of your OUs into a nice CSV file for use by the script.

Run Move-Root-Cromebooks.bat. This will list all of your Active Chromebooks in your root directory, read what is in annotatedLocation (in my use, campus) and annotatedAssetID (classroom or cart, etc) and put them into variables for GAM.
Next we will look in your ou.csv and see if any OU contains both the annotatedLocation and annotatedAssetID
Example OU (/Elementary School/First Grade Wing/Room 3)
Example annotatedLocation: Elementary School
Example annotationAssetID: Room 3
Then we will use GAM to move that Chromebook by serial number into correct OU.
