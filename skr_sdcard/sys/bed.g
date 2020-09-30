; bed.g
; called to perform automatic bed compensation via G32
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Thu Sep 03 2020 14:18:01 GMT-0400 (Eastern Daylight Time)
M561															; clear any bed transform (mesh)
G28 															; home all axis

; Optional but would automatically set and configure the trigger height before doing automatic bed tramming
;G1 Z6															; lower Z by 6mm
;G30 S-3 														; Probe the bed and set the Z probe trigger height to the height it stopped at															

; Multiple probings to ensure the readings are 100% correct and that the bed is as level as possible
G30 P0 X20 Y160 Z-99999 										; probe near a leadscrew, half way along Y axis == COMMENT out if not using E1 as Z2
G30 P1 X280 Y160 Z-99999 S2 									; probe near a leadscrew and calibrate 2 motors, (S) Max correction of 2/mm/leadscrew == COMMENT out if not using E1 as Z2
G30 P0 X20 Y160 Z-99999 										; probe near a leadscrew, half way along Y axis == COMMENT out if not using E1 as Z2
G30 P1 X280 Y160 Z-99999 S2 									; probe near a leadscrew and calibrate 2 motors, (S) Max correction of 2/mm/leadscrew == COMMENT out if not using E1 as Z2
G30 P0 X20 Y160 Z-99999 										; probe near a leadscrew, half way along Y axis == COMMENT out if not using E1 as Z2
G30 P1 X280 Y160 Z-99999 S2 									; probe near a leadscrew and calibrate 2 motors, (S) Max correction of 2/mm/leadscrew == COMMENT out if not using E1 as Z2
G30 P0 X20 Y160 Z-99999 										; probe near a leadscrew, half way along Y axis == COMMENT out if not using E1 as Z2
G30 P1 X280 Y160 Z-99999 S2 									; probe near a leadscrew and calibrate 2 motors, (S) Max correction of 2/mm/leadscrew == COMMENT out if not using E1 as Z2
G30 P0 X20 Y160 Z-99999 										; probe near a leadscrew, half way along Y axis == COMMENT out if not using E1 as Z2
G30 P1 X280 Y160 Z-99999 S2 									; probe near a leadscrew and calibrate 2 motors, (S) Max correction of 2/mm/leadscrew == COMMENT out if not using E1 as Z2
G1 X150 Y150 Z6													; Move to X 150 Y 160 and lower the bed by 6mm														

; Optional but would automatically set and configure the trigger height after automatic bed tramming
;G30 S-3 														; Probe the bed and set the Z probe trigger height to the height it stopped at


M557 X18:300 Y4:300 S30                     					; set mesh limits for X/Y, Probe Spacing (S) 
M558 A10 F150 T3000 S0.01 H4    								; m(A)ximum of 10 probe retry's/point, (T)ravel speed, (F)eed rate, Tolerance of multiple probe(S), Dive (H)eight
G29 S0															; build mesh