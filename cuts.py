import csv
import subprocess
import datetime

with open('sets.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile, fieldnames=['start', 'end', 'name'])
    for row in reader:
        start = datetime.datetime.strptime(row["start"], "%H:%M:%S")
        end = datetime.datetime.strptime(row["end"], "%H:%M:%S")
        delta = (end-start)
        duration = (datetime.datetime.min + delta).time().strftime("%H:%M:%S")
        subprocess.run(["ffmpeg -y -ss " + row["start"] + " -i input.mp4 -t " + duration + " ./output/" + row["name"] + ".mp4"], shell=True)
