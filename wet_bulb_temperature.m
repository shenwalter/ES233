% Calculate wet bulb temperature

% inputs: Temperature (C), and RH (%)
% outputs: wet bulb temperature Tw (C)

% Formula from
% Stull, R. (2011). Wet-Bulb Temperature from Relative Humidity and Air Temperature, 
% Journal of Applied Meteorology and Climatology, 50(11), 2267-2269. 
% Retrieved Nov 21, 2022, from https://journals.ametsoc.org/view/journals/apme/50/11/jamc-d-11-0143.1.xml

% T: temperature, in Celsius
% RH: relative humidty, in percentage units (e.g. 70% RH is inputted as 70)
function T_w = wet_bulb_temperature(T, RH)
  T_w = T.*atan(0.151977*(RH+8.313659).^0.5) + atan(T+RH) - atan(RH - 1.676331) ...
  + 0.00391838*(RH).^1.5 .* atan(0.023101*RH) - 4.686035;