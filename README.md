# DDS-miniproject-T8 - Automatic Visitor Counter and Power control

**Team members:**

1. 221CS101, Aahil Rafiq, <aahilrafiq.221cs101@nitk.edu.in> , 79756 57621
1. 221CS119, Ch Muni Kiran, <munikiranch.221cs119@nitk.edu.in>, 9121716854
1. 221CS121, Shainu Suhas, <suhas.221cs121@nitk.edu.in> , 79897 75284

## Abstract :

**Automated Visitor Counting:** Utilizes sensors to automatically count incoming visitors and display the count using **7 segment displays**

**Bi-Directional Tracking:** Accurately records both entries and exits, adjusting the count accordingly.

**Laser-Based Detection:** Utilizes laser technology to precisely detect incoming and outgoing visitors.

**Customizable Limits:** Allows users to set maximum occupancy limits for safety and compliance.

**Automatic Restrict System:** Features an automatic Restriction system that stops entry when the room reaches its defined occupancy limit, enhancing security and efficiency.

**Energy Efficiency and control :** Incorporates power management by turning off lights in unoccupied areas and generates live Electricity Bill

## Functional Table :

* here people try to enter from time 0 to 210
* then exit from 210 to 420

| Time | Count | Color | Temperature | elec bill |
|------|-------|-------|-------------|-----------|
| 20   | 0001  | 00    | 11100       | 0000000   |
| 30   | 0010  | 00    | 11100       | 0000000   |
| 40   | 0011  | 01    | 11000       | 0000000   |
| 50   | 0100  | 01    | 11000       | 0000001   |
| 60   | 0101  | 10    | 10100       | 0000010   |
| 70   | 0110  | 10    | 10100       | 0000100   |
| 80   | 0111  | 10    | 10000       | 0000110   |
| 90   | 1000  | 11    | 10000       | 0001000   |
| 100  | 1000  | 11    | 10000       | 0001011   |
| 110  | 1000  | 11    | 10000       | 0001110   |
| 120  | 1000  | 11    | 10000       | 0010001   |
| 130  | 1000  | 11    | 10000       | 0010100   |
| 140  | 1000  | 11    | 10000       | 0010111   |
| 150  | 1000  | 11    | 10000       | 0011010   |
| 160  | 1000  | 11    | 10000       | 0011101   |
| 170  | 1000  | 11    | 10000       | 0100000   |
| 180  | 1000  | 11    | 10000       | 0100011   |
| 190  | 1000  | 11    | 10000       | 0100110   |
| 200  | 1000  | 11    | 10000       | 0101001   |
| 210  | 1000  | 11    | 10000       | 0101100   |
| 220  | 0111  | 10    | 10000       | 0101111   |
| 230  | 0110  | 10    | 10100       | 0110001   |
| 240  | 0101  | 10    | 10100       | 0110011   |
| 250  | 0100  | 01    | 11000       | 0110101   |
| 260  | 0011  | 01    | 11000       | 0110110   |
| 270  | 0010  | 00    | 11100       | 0110111   |
| 280  | 0001  | 00    | 11100       | 0110111   |
| 290  | 0000  | 00    | 11100       | 0110111   |
| 300  | 0000  | 00    | 11100       | 0110111   |
| 310  | 0000  | 00    | 11100       | 0110111   |
| 320  | 0000  | 00    | 11100       | 0110111   |
| 330  | 0000  | 00    | 11100       | 0110111   |
| 340  | 0000  | 00    | 11100       | 0110111   |
| 350  | 0000  | 00    | 11100       | 0110111   |
| 360  | 0000  | 00    | 11100       | 0110111   |
| 370  | 0000  | 00    | 11100       | 0110111   |
| 380  | 0000  | 00    | 11100       | 0110111   |
| 390  | 0000  | 00    | 11100       | 0110111   |
| 400  | 0000  | 00    | 11100       | 0110111   |
| 410  | 0000  | 00    | 11100       | 0110111   |
| 420  | 0001  | 00    | 11100       | 0110111   |
| 430  | 0010  | 00    | 11100       | 0110111   |
| 440  | 0011  | 01    | 11000       | 0110111   |
| 450  | 0100  | 01    | 11000       | 0111000   |
| 460  | 0101  | 10    | 10100       | 0111001   |

## FLowchart :
![image](https://github.com/AahilRafiq/DDS-miniproject-T8/assets/128609469/30cff0ae-33ea-42be-ba07-bf27485155bf)

## SnapShots :
#### logisim :
![image](https://github.com/AahilRafiq/DDS-miniproject-T8/assets/128609469/e9c70417-18e0-4774-b6be-291f509159cc)
#### verilog :
![image](https://github.com/AahilRafiq/DDS-miniproject-T8/assets/128609469/45a53663-65d2-4c12-ad7a-3ea4e81f3aa4)


