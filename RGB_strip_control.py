#!/usr/bin/env python3

import serial
import time
import sys, getopt

def main(argv):
    try:
        opts, args = getopt.getopt(argv, "rcoR")
    except getopt.GetoptError:
        print('RGB_strip_control.py -r (RED) -c (CYLON) -o (OFF) -R (RAINBOW)')
        sys.exit(2)
    
    try:
        ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)
        ser.flush()
    except serial.SerialException:
        print('SERIAL_ERROR')
        sys.exit(2)

    # à décommenter si l'arduino se reset
    time.sleep(3)

    result = ser.readline().decode('utf-8').rstrip()
    print(result)

    time.sleep(1)

    for opt, arg in opts:
        
        if opt == '-r':
            # mode RED demandé
            ser.write(b"RED\n")
            result = ser.readline().decode('utf-8').rstrip()
            print(result)
        
        elif opt == '-c':
            # mode CYLON demandé
            ser.write(b"CYLON\n")
            result = ser.readline().decode('utf-8').rstrip()
            print(result)

        elif opt == '-o':
            # extinction demandée
            ser.write(b"OFF\n")
            result = ser.readline().decode('utf-8').rstrip()
            print(result)

        elif opt == '-R':
            # mode RAINBOW demandé
            ser.write(b"RAINBOW\n")
            result = ser.readline().decode('utf-8').rstrip()
            print(result)

if __name__ == '__main__':
    main(sys.argv[1:])
