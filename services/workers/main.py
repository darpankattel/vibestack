import datetime
import time

print(datetime.datetime.now(), "Worker started successfully!")

while True:
    print(datetime.datetime.now(), "Worker is running tasks...")
    time.sleep(10)
