Had to design a single stage CE amplifier to achieve the following performance specifications:

-- Midbandgain (vo /vSig) of -20 to -30 (26 to 30 dB) and an AC collector-emitter swing of at least
± 3.5V from the Q pt. The AC signal source (vSig) has a 1 kΩ source resistance (RSig) and is capacitively coupled (via CC1) to the amplifier.

-- Drive a grounded load (RL) of 20 kΩ connected to the collector node of the transistor via a coupling capacitor (CC2).

-- SPICE bandwidth that meets or exceeds 8 Hz to 2 MHz (i.e., lower -3dB fL ≤ 8Hz and upper -3dB fH ≥ 2 MHz).

-- Total AC inputresistance seen by vSig (includes RSig and the bias resistors) greater than 6 kΩ (i.e., RinAC > 6 kΩ).


Design Constraints:

[1] MustuseanNPN_430transistorthathasthefollowingbasicparameters:β=120,rx (or rBB’)= 100 Ω, Cje = 40 pF, Cjc = 4 pF and VA = 179
Also can modify the 2N2222 bipolar transistor contained in PSPICE or LT_SPICE by placing that part onto your schematic; 
highlight and manually convert that transistor into NPN_430 by replacing the 2N2222's model parameters with the parameters given in “NPN_430.txt.”

[2] Use the smallest external capacitors possible and none larger than 470 μF. 
The largest resistor available = 82 kΩ. VCC= 15 V. In your final circuit design, use only standard component values

[3] Hints: the collectorresistor ≤ 10 kΩ, and the DC emitterresistance must be ≥ 500 Ω to insure adequate bias stability.
