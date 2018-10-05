# geocoded_voting_stations
Geocodes voting stations in Brazil

You will need a google API key. Go to Google Cloud Platform to get one. Don't forget to enable the Geocoding API.

The list of all voting stations come from here: https://drive.google.com/file/d/0B85iHUpDSZB5elVFd2R1XzAzX1U/view

Unfortunately, I cannot give credit to the person who has published the voting stations' file. I remember it was placed on a comment section somewhere, an that the file was provided by the Electoral Authority. If you know or are that person, please let me know and I will give you full credit. I apologize for not taking note.

I have that same file converted to csv here: 

https://www.dropbox.com/s/46847p8avw90txr/locais_voto_2016.csv?dl=0

If you don't want to run the code yourself, email me and I will send you the file with geocoded voting stations (lucasnovaes09 at gmail). If you can, please provide some context about what you are going to do with the file.

There are few places still not coded (geocode failed). The table below shows where these places are.

AC  AL  AM  AP  BA  CE  ES  GO  MA  MG  MS  MT  PA  PB  PE  PI  PR  RJ  RN  RO  RR  RS  SC  SE  SP  TO 
  4   6  16   3 251 120  12  26  50  52   4  14   6  23  44  90  62   7  16   5   2  92  25  28  11  19
