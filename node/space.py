#!/usr/bin/env python3
import requests
menu = """
Space Weather Reports
-----------------------------------
1) Geophysical Alert Message
2) Advisory Outlook
3) Forecast Discussion
4) Weekly Highlights and Forecasts
5) 3-Day Forecast
6) 3-Day Geomagnetic Forecast
7) 3-day Space Weather Predictions
-----------------------------------"""

about = """
Get information about solar storms,
geomagnetic storms, and more right 
from NOAA.

This is a Python3 script which pulls data from
https://services.swpc.noaa.gov/text/.

Script developed by Brad Brown KC1JMH
"""

def pullthis(url):
        response = requests.get(url)
        data = response.text
        print("\n{}\n".format(data))

print(menu)
while True:
        selected = str(input("#1-7), R)elist, A)bout, Q)uit :> "))
        if "1" in selected:
                pullthis("https://services.swpc.noaa.gov/text/wwv.txt") #7
        elif "2" in selected:
                pullthis("https://services.swpc.noaa.gov/text/advisory-outlook.txt") #5
        elif "3" in selected:
                pullthis("https://services.swpc.noaa.gov/text/discussion.txt") #1
        elif "4" in selected:
                pullthis("https://services.swpc.noaa.gov/text/weekly.txt") #6
        elif "5" in selected:
                pullthis("https://services.swpc.noaa.gov/text/3-day-forecast.txt") #2
        elif "6" in selected:
                pullthis("https://services.swpc.noaa.gov/text/3-day-geomag-forecast.txt") #3
        elif "7" in selected:
                pullthis("https://services.swpc.noaa.gov/text/3-day-solar-geomag-predictions.txt") #4
        elif "a" in selected.lower():
                print (about)
        elif "r" in selected.lower():
                print (menu)
        elif "q" in selected.lower():
                print ("\nExiting...\n")
                exit()
