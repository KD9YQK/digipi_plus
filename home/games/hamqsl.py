#!/usr/bin/env python3
import requests
import xml.etree.ElementTree as ET

# Get XML file from web server
url = "https://www.hamqsl.com/solarxml.php?nwra=north&muf=grnlnd"
webxml = (requests.get(url)).content
#print(webxml)

root = ET.fromstring(webxml)

# Declare variables from XML fields
for solardata in root.findall('solardata'):
    source = solardata.find('source').attrib['url']
    updated = solardata.find('updated').text

    solarflux = solardata.find('solarflux').text
    sunspots = solardata.find('sunspots').text
    aindex = solardata.find('aindex').text
    kindex = solardata.find('kindex').text
    kindexnt = solardata.find('kindexnt').text
    xray = solardata.find('xray').text
    heliumline = solardata.find('heliumline').text
    protonflux = solardata.find('protonflux').text
    electronflux = solardata.find('electonflux').text # misspelled in XML source
    aurora = solardata.find('aurora').text
    normalization = solardata.find('normalization').text
    solarwind = solardata.find('solarwind').text
    magneticfield = solardata.find('magneticfield').text

    b8040d = solardata.findall(".//band[@name='80m-40m'][@time='day']")[0].text
    b3020d = solardata.findall(".//band[@name='30m-20m'][@time='day']")[0].text
    b1715d = solardata.findall(".//band[@name='17m-15m'][@time='day']")[0].text
    b1210d = solardata.findall(".//band[@name='12m-10m'][@time='day']")[0].text

    b8040n = solardata.findall(".//band[@name='80m-40m'][@time='night']")[0].text
    b3020n = solardata.findall(".//band[@name='30m-20m'][@time='night']")[0].text
    b1715n = solardata.findall(".//band[@name='17m-15m'][@time='night']")[0].text
    b1210n = solardata.findall(".//band[@name='12m-10m'][@time='night']")[0].text

    auroralat = solardata.find('latdegree').text
    esaura = solardata.findall(".//phenomenon[@name='vhf-aurora'][@location='northern_hemi']")[0].text
    e6meseu = solardata.findall(".//phenomenon[@name='E-Skip'][@location='europe_6m']")[0].text
    e4meseu = solardata.findall(".//phenomenon[@name='E-Skip'][@location='europe_4m']")[0].text
    e2meseu = solardata.findall(".//phenomenon[@name='E-Skip'][@location='europe']")[0].text
    e2mesna = solardata.findall(".//phenomenon[@name='E-Skip'][@location='north_america']")[0].text

    geomagfield = solardata.find('geomagfield').text
    snr = solardata.find('signalnoise').text
    muf = solardata.find('muf').text
    muffactor = solardata.find('muffactor').text
    fof2 = solardata.find('fof2').text

header = """
-------------------------------------------------
            Solar and Band Conditions
-------------------------------------------------"""
lr = "-------------------------------------------------"
print(header)
print('From: ', source)
print('Updated: ', updated)

print(lr)
print("            Solar-Terrestrial Data")
print('Solar Flux: ', solarflux, end ="\t")
print('Sunspots: ', sunspots)

if kindexnt != "No Report":
        knt = "nt"
else:
        knt = ""
print('A-Index:', aindex, end ="\t\t")
print('K-Index:', kindex, '/', kindexnt, knt)

print('X-Ray:', xray, end ="\t\t")
print('Helium:', heliumline)

print('Proton Flux: ', protonflux, end ="\t")
print('Electron Flux: ', electronflux)

print('Solar Wind: ', solarwind, end ="\t")
print('Aurora: ', aurora, '/', normalization)

print('Magnetic Field: ', magneticfield)

print(lr)
print("    HF Conditions           VHF Conditions")
print("Band\t Day\tNight")
print('80m-40m\t', b8040d, '\t', b8040n, '\t6m ESkip EU: ', e6meseu)
print('30m-20m\t', b3020d, '\t', b3020n, '\t4m ESkip EU: ', e4meseu)
print('17m-15m\t', b1715d, '\t', b1715n, '\t2m ESkip EU: ', e2meseu)
print('12m-10m\t', b1210d, '\t', b1210n, '\t2m ESkip NA: ', e2mesna)
print('Auorora Latitude: ', auroralat, 'Aurora Skip: ', esaura)

print(lr)
print('Geomagnetic Field: ', geomagfield, end ="\t")
print('SNR: ', snr)

print('Max Usable Freq: ', muf, end ="\t\t")
print('MUF Factor: ', muffactor)
print('Crit foF2 Freq: ', fof2)

print(lr)
