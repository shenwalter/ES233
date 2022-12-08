% calculate lethal heat stress temperature, as in Wouters et al. paper

% T: temperature, in Celsius
% RH: relative humidty, in percentage units (e.g. 70% RH is inputted as 70)

% output: T_s, heat stress temperature (C)
function T_s = heat_stress_temperature(T, RH)
  T_s = wet_bulb_temperature(T,RH) + 4.5*(1-(RH/100).^2);