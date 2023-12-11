# https://pypi.org/project/pyfcm/

from schedule import *
from SendNotifications import *

if __name__ == '__main__':
    while True:
        send_notifications()
        time.sleep(59)
