EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:w_opto
LIBS:RMC
LIBS:w_microcontrollers
LIBS:i2sd_v3
LIBS:opendous
LIBS:led_clock-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "LED Clock with Arduino Mini"
Date "2016-02-20"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LED D1
U 1 1 53EFB507
P 3400 2800
F 0 "D1" H 3400 2900 50  0000 C CNN
F 1 "LED" H 3400 2700 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 3400 2800 60  0001 C CNN
F 3 "~" H 3400 2800 60  0000 C CNN
	1    3400 2800
	-1   0    0    1   
$EndComp
$Comp
L LED D10
U 1 1 53EFB50D
P 3400 3200
F 0 "D10" H 3400 3300 50  0000 C CNN
F 1 "LED" H 3400 3100 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 3400 3200 60  0001 C CNN
F 3 "~" H 3400 3200 60  0000 C CNN
	1    3400 3200
	-1   0    0    1   
$EndComp
$Comp
L LED D19
U 1 1 53EFB519
P 3400 3600
F 0 "D19" H 3400 3700 50  0000 C CNN
F 1 "LED" H 3400 3500 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 3400 3600 60  0001 C CNN
F 3 "~" H 3400 3600 60  0000 C CNN
	1    3400 3600
	-1   0    0    1   
$EndComp
Text GLabel 2550 3000 0    60   Input ~ 0
ROW1
Text GLabel 2550 3400 0    60   Input ~ 0
ROW2
Text GLabel 2550 3800 0    60   Input ~ 0
ROW3
$Comp
L LED D2
U 1 1 53EFB57D
P 4100 2800
F 0 "D2" H 4100 2900 50  0000 C CNN
F 1 "LED" H 4100 2700 50  0000 C CNN
F 2 "RMC:LED-0805_GREEN" H 4100 2800 60  0001 C CNN
F 3 "~" H 4100 2800 60  0000 C CNN
	1    4100 2800
	-1   0    0    1   
$EndComp
$Comp
L LED D11
U 1 1 53EFB583
P 4100 3200
F 0 "D11" H 4100 3300 50  0000 C CNN
F 1 "LED" H 4100 3100 50  0000 C CNN
F 2 "RMC:LED-0805_GREEN" H 4100 3200 60  0001 C CNN
F 3 "~" H 4100 3200 60  0000 C CNN
	1    4100 3200
	-1   0    0    1   
$EndComp
$Comp
L LED D20
U 1 1 53EFB589
P 4100 3600
F 0 "D20" H 4100 3700 50  0000 C CNN
F 1 "LED" H 4100 3500 50  0000 C CNN
F 2 "RMC:LED-0805_GREEN" H 4100 3600 60  0001 C CNN
F 3 "~" H 4100 3600 60  0000 C CNN
	1    4100 3600
	-1   0    0    1   
$EndComp
$Comp
L LED D3
U 1 1 53EFB58F
P 4800 2800
F 0 "D3" H 4800 2900 50  0000 C CNN
F 1 "LED" H 4800 2700 50  0000 C CNN
F 2 "RMC:LED-0805_GREEN" H 4800 2800 60  0001 C CNN
F 3 "~" H 4800 2800 60  0000 C CNN
	1    4800 2800
	-1   0    0    1   
$EndComp
$Comp
L LED D12
U 1 1 53EFB595
P 4800 3200
F 0 "D12" H 4800 3300 50  0000 C CNN
F 1 "LED" H 4800 3100 50  0000 C CNN
F 2 "RMC:LED-0805_GREEN" H 4800 3200 60  0001 C CNN
F 3 "~" H 4800 3200 60  0000 C CNN
	1    4800 3200
	-1   0    0    1   
$EndComp
$Comp
L LED D21
U 1 1 53EFB59B
P 4800 3600
F 0 "D21" H 4800 3700 50  0000 C CNN
F 1 "LED" H 4800 3500 50  0000 C CNN
F 2 "RMC:LED-0805_GREEN" H 4800 3600 60  0001 C CNN
F 3 "~" H 4800 3600 60  0000 C CNN
	1    4800 3600
	-1   0    0    1   
$EndComp
$Comp
L LED D4
U 1 1 53EFB5A1
P 5500 2800
F 0 "D4" H 5500 2900 50  0000 C CNN
F 1 "LED" H 5500 2700 50  0000 C CNN
F 2 "RMC:LED-0805_GREEN" H 5500 2800 60  0001 C CNN
F 3 "~" H 5500 2800 60  0000 C CNN
	1    5500 2800
	-1   0    0    1   
$EndComp
$Comp
L LED D13
U 1 1 53EFB5A7
P 5500 3200
F 0 "D13" H 5500 3300 50  0000 C CNN
F 1 "LED" H 5500 3100 50  0000 C CNN
F 2 "RMC:LED-0805_GREEN" H 5500 3200 60  0001 C CNN
F 3 "~" H 5500 3200 60  0000 C CNN
	1    5500 3200
	-1   0    0    1   
$EndComp
$Comp
L LED D22
U 1 1 53EFB5AD
P 5500 3600
F 0 "D22" H 5500 3700 50  0000 C CNN
F 1 "LED" H 5500 3500 50  0000 C CNN
F 2 "RMC:LED-0805_GREEN" H 5500 3600 60  0001 C CNN
F 3 "~" H 5500 3600 60  0000 C CNN
	1    5500 3600
	-1   0    0    1   
$EndComp
$Comp
L LED D5
U 1 1 53EFB5B3
P 6200 2800
F 0 "D5" H 6200 2900 50  0000 C CNN
F 1 "LED" H 6200 2700 50  0000 C CNN
F 2 "RMC:LED-0805_BLUE" H 6200 2800 60  0001 C CNN
F 3 "~" H 6200 2800 60  0000 C CNN
	1    6200 2800
	-1   0    0    1   
$EndComp
$Comp
L LED D14
U 1 1 53EFB5B9
P 6200 3200
F 0 "D14" H 6200 3300 50  0000 C CNN
F 1 "LED" H 6200 3100 50  0000 C CNN
F 2 "RMC:LED-0805_BLUE" H 6200 3200 60  0001 C CNN
F 3 "~" H 6200 3200 60  0000 C CNN
	1    6200 3200
	-1   0    0    1   
$EndComp
$Comp
L LED D23
U 1 1 53EFB5BF
P 6200 3600
F 0 "D23" H 6200 3700 50  0000 C CNN
F 1 "LED" H 6200 3500 50  0000 C CNN
F 2 "RMC:LED-0805_BLUE" H 6200 3600 60  0001 C CNN
F 3 "~" H 6200 3600 60  0000 C CNN
	1    6200 3600
	-1   0    0    1   
$EndComp
$Comp
L LED D6
U 1 1 53EFB5C5
P 6900 2800
F 0 "D6" H 6900 2900 50  0000 C CNN
F 1 "LED" H 6900 2700 50  0000 C CNN
F 2 "RMC:LED-0805_BLUE" H 6900 2800 60  0001 C CNN
F 3 "~" H 6900 2800 60  0000 C CNN
	1    6900 2800
	-1   0    0    1   
$EndComp
$Comp
L LED D15
U 1 1 53EFB5CB
P 6900 3200
F 0 "D15" H 6900 3300 50  0000 C CNN
F 1 "LED" H 6900 3100 50  0000 C CNN
F 2 "RMC:LED-0805_BLUE" H 6900 3200 60  0001 C CNN
F 3 "~" H 6900 3200 60  0000 C CNN
	1    6900 3200
	-1   0    0    1   
$EndComp
$Comp
L LED D24
U 1 1 53EFB5D1
P 6900 3600
F 0 "D24" H 6900 3700 50  0000 C CNN
F 1 "LED" H 6900 3500 50  0000 C CNN
F 2 "RMC:LED-0805_BLUE" H 6900 3600 60  0001 C CNN
F 3 "~" H 6900 3600 60  0000 C CNN
	1    6900 3600
	-1   0    0    1   
$EndComp
$Comp
L LED D7
U 1 1 53EFB5D7
P 7600 2800
F 0 "D7" H 7600 2900 50  0000 C CNN
F 1 "LED" H 7600 2700 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 7600 2800 60  0001 C CNN
F 3 "~" H 7600 2800 60  0000 C CNN
	1    7600 2800
	-1   0    0    1   
$EndComp
$Comp
L LED D16
U 1 1 53EFB5DD
P 7600 3200
F 0 "D16" H 7600 3300 50  0000 C CNN
F 1 "LED" H 7600 3100 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 7600 3200 60  0001 C CNN
F 3 "~" H 7600 3200 60  0000 C CNN
	1    7600 3200
	-1   0    0    1   
$EndComp
$Comp
L LED D25
U 1 1 53EFB5E3
P 7600 3600
F 0 "D25" H 7600 3700 50  0000 C CNN
F 1 "LED" H 7600 3500 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 7600 3600 60  0001 C CNN
F 3 "~" H 7600 3600 60  0000 C CNN
	1    7600 3600
	-1   0    0    1   
$EndComp
$Comp
L LED D8
U 1 1 53EFB5E9
P 8300 2800
F 0 "D8" H 8300 2900 50  0000 C CNN
F 1 "LED" H 8300 2700 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 8300 2800 60  0001 C CNN
F 3 "~" H 8300 2800 60  0000 C CNN
	1    8300 2800
	-1   0    0    1   
$EndComp
$Comp
L LED D17
U 1 1 53EFB5EF
P 8300 3200
F 0 "D17" H 8300 3300 50  0000 C CNN
F 1 "LED" H 8300 3100 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 8300 3200 60  0001 C CNN
F 3 "~" H 8300 3200 60  0000 C CNN
	1    8300 3200
	-1   0    0    1   
$EndComp
$Comp
L LED D26
U 1 1 53EFB5F5
P 8300 3600
F 0 "D26" H 8300 3700 50  0000 C CNN
F 1 "LED" H 8300 3500 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 8300 3600 60  0001 C CNN
F 3 "~" H 8300 3600 60  0000 C CNN
	1    8300 3600
	-1   0    0    1   
$EndComp
$Comp
L LED D9
U 1 1 53EFB5FB
P 9000 2800
F 0 "D9" H 9000 2900 50  0000 C CNN
F 1 "LED" H 9000 2700 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 9000 2800 60  0001 C CNN
F 3 "~" H 9000 2800 60  0000 C CNN
	1    9000 2800
	-1   0    0    1   
$EndComp
$Comp
L LED D18
U 1 1 53EFB601
P 9000 3200
F 0 "D18" H 9000 3300 50  0000 C CNN
F 1 "LED" H 9000 3100 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 9000 3200 60  0001 C CNN
F 3 "~" H 9000 3200 60  0000 C CNN
	1    9000 3200
	-1   0    0    1   
$EndComp
$Comp
L LED D27
U 1 1 53EFB607
P 9000 3600
F 0 "D27" H 9000 3700 50  0000 C CNN
F 1 "LED" H 9000 3500 50  0000 C CNN
F 2 "RMC:LED-0805_RED" H 9000 3600 60  0001 C CNN
F 3 "~" H 9000 3600 60  0000 C CNN
	1    9000 3600
	-1   0    0    1   
$EndComp
Text GLabel 3000 1500 0    60   Input ~ 0
COL1
Text GLabel 3700 1500 0    60   Input ~ 0
COL2
Text GLabel 4400 1500 0    60   Input ~ 0
COL3
Text GLabel 5100 1500 0    60   Input ~ 0
COL4
Text GLabel 5800 1500 0    60   Input ~ 0
COL5
Text GLabel 6500 1500 0    60   Input ~ 0
COL6
Text GLabel 7200 1500 0    60   Input ~ 0
COL7
Text GLabel 7900 1500 0    60   Input ~ 0
COL8
Text GLabel 8600 1500 0    60   Input ~ 0
COL9
Wire Wire Line
	3000 1500 3100 1500
Wire Wire Line
	3100 1500 3100 3600
Wire Wire Line
	3100 3200 3200 3200
Wire Wire Line
	3200 2800 3100 2800
Connection ~ 3100 2800
Wire Wire Line
	3100 3600 3200 3600
Connection ~ 3100 3200
Wire Wire Line
	3700 1500 3800 1500
Wire Wire Line
	3800 1500 3800 3600
Wire Wire Line
	3800 3200 3900 3200
Wire Wire Line
	3900 2800 3800 2800
Connection ~ 3800 2800
Wire Wire Line
	3800 3600 3900 3600
Connection ~ 3800 3200
Wire Wire Line
	2550 3000 9200 3000
Wire Wire Line
	5000 2800 5000 3000
Connection ~ 5000 3000
Wire Wire Line
	5700 2800 5700 3000
Connection ~ 5700 3000
Wire Wire Line
	6400 2800 6400 3000
Connection ~ 6400 3000
Wire Wire Line
	7100 2800 7100 3000
Connection ~ 7100 3000
Wire Wire Line
	7800 2800 7800 3000
Connection ~ 7800 3000
Wire Wire Line
	8500 3000 8500 2800
Connection ~ 8500 3000
Wire Wire Line
	9200 3000 9200 2800
Wire Wire Line
	3600 3200 3600 3400
Wire Wire Line
	2550 3400 9200 3400
Wire Wire Line
	2550 3800 9200 3800
Wire Wire Line
	3600 3800 3600 3600
Wire Wire Line
	4300 3200 4300 3400
Connection ~ 4300 3400
Wire Wire Line
	5000 3200 5000 3400
Connection ~ 5000 3400
Wire Wire Line
	5700 3200 5700 3400
Connection ~ 5700 3400
Wire Wire Line
	6400 3200 6400 3400
Connection ~ 6400 3400
Wire Wire Line
	7100 3200 7100 3400
Connection ~ 7100 3400
Wire Wire Line
	7800 3200 7800 3400
Connection ~ 7800 3400
Wire Wire Line
	8500 3200 8500 3400
Connection ~ 8500 3400
Wire Wire Line
	9200 3400 9200 3200
Wire Wire Line
	4400 1500 4500 1500
Wire Wire Line
	4500 1500 4500 3600
Wire Wire Line
	4500 3200 4600 3200
Wire Wire Line
	4600 2800 4500 2800
Connection ~ 4500 2800
Wire Wire Line
	4500 3600 4600 3600
Connection ~ 4500 3200
Wire Wire Line
	5100 1500 5200 1500
Wire Wire Line
	5200 1500 5200 3600
Wire Wire Line
	5200 3200 5300 3200
Wire Wire Line
	5300 2800 5200 2800
Connection ~ 5200 2800
Wire Wire Line
	5200 3600 5300 3600
Connection ~ 5200 3200
Wire Wire Line
	5800 1500 5900 1500
Wire Wire Line
	5900 1500 5900 3600
Wire Wire Line
	5900 3200 6000 3200
Wire Wire Line
	6000 2800 5900 2800
Connection ~ 5900 2800
Wire Wire Line
	5900 3600 6000 3600
Connection ~ 5900 3200
Wire Wire Line
	6500 1500 6600 1500
Wire Wire Line
	6600 1500 6600 3600
Wire Wire Line
	6600 3200 6700 3200
Wire Wire Line
	6700 2800 6600 2800
Connection ~ 6600 2800
Wire Wire Line
	6600 3600 6700 3600
Connection ~ 6600 3200
Wire Wire Line
	7200 1500 7300 1500
Wire Wire Line
	7300 1500 7300 3600
Wire Wire Line
	7300 3200 7400 3200
Wire Wire Line
	7400 2800 7300 2800
Connection ~ 7300 2800
Wire Wire Line
	7300 3600 7400 3600
Connection ~ 7300 3200
Wire Wire Line
	7900 1500 8000 1500
Wire Wire Line
	8000 1500 8000 3600
Wire Wire Line
	8000 3200 8100 3200
Wire Wire Line
	8100 2800 8000 2800
Connection ~ 8000 2800
Wire Wire Line
	8000 3600 8100 3600
Connection ~ 8000 3200
Wire Wire Line
	8600 1500 8700 1500
Wire Wire Line
	8700 1500 8700 3600
Wire Wire Line
	8700 3200 8800 3200
Wire Wire Line
	8800 2800 8700 2800
Connection ~ 8700 2800
Wire Wire Line
	8700 3600 8800 3600
Connection ~ 8700 3200
Wire Wire Line
	4300 3600 4300 3800
Connection ~ 4300 3800
Wire Wire Line
	5000 3800 5000 3600
Connection ~ 5000 3800
Wire Wire Line
	5700 3600 5700 3800
Connection ~ 5700 3800
Wire Wire Line
	6400 3600 6400 3800
Connection ~ 6400 3800
Wire Wire Line
	7100 3600 7100 3800
Connection ~ 7100 3800
Wire Wire Line
	7800 3600 7800 3800
Connection ~ 7800 3800
Wire Wire Line
	8500 3600 8500 3800
Connection ~ 8500 3800
Wire Wire Line
	9200 3800 9200 3600
Connection ~ 3600 3400
Connection ~ 3600 3800
Wire Wire Line
	3600 2800 3600 3000
Connection ~ 3600 3000
Wire Wire Line
	4300 2800 4300 3000
Connection ~ 4300 3000
$EndSCHEMATC
