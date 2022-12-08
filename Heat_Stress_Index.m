% calculate lethal heat stress index (contribution above lethal thresholds as given in Wouters et. al.)

% input:
% time series of lethal heat stress temp
% alpha, weighting of red lethal region

% output: index for each individual time..
function Heat_Stress_Index = Heat_Stress_Index(T_s_timeseries, alpha)
  Heat_Stress_Index=max(T_s_timeseries-19,0) - max(T_s_timeseries-27,0) + alpha * max(T_s_timeseries-27,0);