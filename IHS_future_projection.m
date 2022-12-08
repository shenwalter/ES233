%% Calculates Integrated Heat Stress for future scenario, under different SSPs

clear all;
close all;

% Read in data
lat = ncread('SSP_models/Temp_2049.nc','lat');
lon = ncread('SSP_models/Temp_2049.nc','lon');
time = ncread('SSP_models/RH_2099-SSP1.nc','time');
dt = datetime(time*24*3600, 'ConvertFrom', 'epochtime', 'Epoch', '1850-01-01');

Temp_SSP1 = ncread('SSP_models/Temp_2099-SSP1.nc','ts')-273.15;
RH_SSP1 = ncread('SSP_models/RH_2099-SSP1.nc','hurs');

Temp_SSP2 = ncread('SSP_models/Temp_2099-SSP2.nc','ts')-273.15;
RH_SSP2 = ncread('SSP_models/RH_2099-SSP2.nc','hurs');

Temp_SSP5 = ncread('SSP_models/Temp_2099-SSP5.nc','ts')-273.15;
RH_SSP5 = ncread('SSP_models/RH_2099-SSP5.nc','hurs');

% calculate wet bulb, heat stress temperatures
T_w_SSP1 = wet_bulb_temperature(Temp_SSP1, RH_SSP1); % T_w for all times from 2015 to 2099
T_s_SSP1 = heat_stress_temperature(Temp_SSP1, RH_SSP1); % T_s for all times from 2015 to 2099

T_w_SSP2 = wet_bulb_temperature(Temp_SSP2, RH_SSP2); % T_w for all times from 2015 to 2099
T_s_SSP2 = heat_stress_temperature(Temp_SSP2, RH_SSP2); % T_s for all times from 2015 to 2099

T_w_SSP5 = wet_bulb_temperature(Temp_SSP5, RH_SSP5); % T_w for all times from 2015 to 2099
T_s_SSP5 = heat_stress_temperature(Temp_SSP5, RH_SSP5); % T_s for all times from 2015 to 2099

% Boston : 42.361145, -71.057083=288.9429
% 95 lat, 206 lon index.

% Mumbai, India: 19.0760° N, 72.8777° E
% index lon: 53 lat: 78

% New Delhi, India: 28.6139° N, 77.2090° E
% index lon: 56 lat: 85

% Kolkata, India: 22.5726° N, 88.3639° E
% index lon: 64 lat: 81

alpha = 1.5;

% Mumbai, calculate IHS
T_s_SSP1_time_series = reshape(T_s_SSP1(53,78,:),1020,1);
T_s_SSP1_index = Heat_Stress_Index(T_s_SSP1_time_series,alpha);
T_s_SSP1_index = trapz(T_s_SSP1_index);

T_s_SSP2_time_series = reshape(T_s_SSP2(53,78,:),1020,1);
T_s_SSP2_index = Heat_Stress_Index(T_s_SSP2_time_series,alpha);
T_s_SSP2_index = trapz(T_s_SSP2_index);

T_s_SSP5_time_series = reshape(T_s_SSP5(53,78,:),1020,1);
T_s_SSP5_index = Heat_Stress_Index(T_s_SSP5_time_series,alpha);
T_s_SSP5_index = trapz(T_s_SSP5_index);

% New Delhi
T_s_SSP1_time_series_NewDelhi = reshape(T_s_SSP1(56,85,:),1020,1);
T_s_SSP1_index_NewDelhi = Heat_Stress_Index(T_s_SSP1_time_series_NewDelhi,alpha);
T_s_SSP1_index_NewDelhi = trapz(T_s_SSP1_index_NewDelhi);

T_s_SSP2_time_series_NewDelhi = reshape(T_s_SSP2(56,85,:),1020,1);
T_s_SSP2_index_NewDelhi = Heat_Stress_Index(T_s_SSP2_time_series_NewDelhi,alpha);
T_s_SSP2_index_NewDelhi = trapz(T_s_SSP2_index_NewDelhi);

T_s_SSP5_time_series_NewDelhi = reshape(T_s_SSP5(56,85,:),1020,1);
T_s_SSP5_index_NewDelhi = Heat_Stress_Index(T_s_SSP5_time_series_NewDelhi,alpha);
T_s_SSP5_index_NewDelhi = trapz(T_s_SSP5_index_NewDelhi);

% Kolkata
T_s_SSP1_time_series_Kolkata = reshape(T_s_SSP1(64,81,:),1020,1);
T_s_SSP1_index_Kolkata = Heat_Stress_Index(T_s_SSP1_time_series_Kolkata,alpha);
T_s_SSP1_index_Kolkata = trapz(T_s_SSP1_index_Kolkata);

T_s_SSP2_time_series_Kolkata = reshape(T_s_SSP2(64,81,:),1020,1);
T_s_SSP2_index_Kolkata = Heat_Stress_Index(T_s_SSP2_time_series_Kolkata,alpha);
T_s_SSP2_index_Kolkata = trapz(T_s_SSP2_index_Kolkata);

T_s_SSP5_time_series_Kolkata = reshape(T_s_SSP5(64,81,:),1020,1);
T_s_SSP5_index_Kolkata = Heat_Stress_Index(T_s_SSP5_time_series_Kolkata,alpha);
T_s_SSP5_index_Kolkata = trapz(T_s_SSP5_index_Kolkata);

% plot data for three cities in India
subplot(1,3,1);
plot(dt, cumsum(Heat_Stress_Index(T_s_SSP1_time_series,alpha)),'LineWidth',3)
hold on
plot(dt, cumsum(Heat_Stress_Index(T_s_SSP2_time_series,alpha)),'LineWidth',3)
hold on
plot(dt, cumsum(Heat_Stress_Index(T_s_SSP5_time_series,alpha)),'LineWidth',3)
hold on
ylim([0 10000])
ylabel("Cumulative Heat Stress Index (C month)")
xlabel("Year")
legend('SSP1-2.6','SSP2-4.5','SSP5-8.5','FontSize',14,'Location','northwest')
title("Mumbai, India (19°N, 73°E)")

subplot(1,3,2); 
plot(dt, cumsum(Heat_Stress_Index(T_s_SSP1_time_series_NewDelhi,alpha)),'LineWidth',3)
hold on
plot(dt, cumsum(Heat_Stress_Index(T_s_SSP2_time_series_NewDelhi,alpha)),'LineWidth',3)
hold on
plot(dt, cumsum(Heat_Stress_Index(T_s_SSP5_time_series_NewDelhi,alpha)),'LineWidth',3)
hold on
ylim([0 10000])
xlabel("Year")
legend('SSP1-2.6','SSP2-4.5','SSP5-8.5','FontSize',14,'Location','northwest')
title("New Delhi, India (29°N, 77°E)")

subplot(1,3,3); 
plot(dt, cumsum(Heat_Stress_Index(T_s_SSP1_time_series_Kolkata,alpha)),'LineWidth',3)
hold on
plot(dt, cumsum(Heat_Stress_Index(T_s_SSP2_time_series_Kolkata,alpha)),'LineWidth',3)
hold on
plot(dt, cumsum(Heat_Stress_Index(T_s_SSP5_time_series_Kolkata,alpha)),'LineWidth',3)
hold on
ylim([0 10000])
xlabel("Year")
legend('SSP1-2.6','SSP2-4.5','SSP5-8.5','FontSize',14,'Location','northwest')
title("Kolkata, India (23°N, 88°E)")

sgtitle("Integrated Heat Stress, CNRM-CM6-1, monthly 2015-2100",'FontSize',18)

% map of IHS, for SSP5
figure
LAT = repmat(flip(lat), 1,256);
LON = repmat(transpose(lon), 128,1);
axesm eckert4
geoshow(LAT, LON, rot90(trapz(Heat_Stress_Index(T_s_SSP5,alpha),3)),'DisplayType','texturemap')
framem
gridm
cb = colorbar('southoutside');
cb.Label.String = 'Integrated Heat Stress, 2015-2100 (°C month)';
geoshow('landareas.shp','FaceAlpha',0)