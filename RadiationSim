% Parameters
Fs = 60;             % Sampling frequency (samples per hour = 1 per minute)
T = 1/Fs;            % Sampling period (hours)
total_hours = 24;    % One day
L = total_hours*Fs;  % Length of signal
t = (0:L-1)*T;       % Time vector (hours)

% Background radiation level
background = 0.05;   % Normal dose rate (mSv per hour)
radiation_signal = background * ones(size(t));

% Small changes every 3 hours
change_interval = round(Fs * 3);

for i = 1:change_interval:L
    % Add a small bump in radiation
    t_pulse = (t - (i-1)*T);
    pulse = 0.02 * exp(-(t_pulse - 1.5).^2 / 0.3);
    idx = i:min(i+change_interval-1, L);
    radiation_signal(idx) = radiation_signal(idx) + pulse(idx);
end

% Add one solar storm at hour 15
storm = 0.6 * exp(-(t - 15).^2 / 0.5);
radiation_signal = radiation_signal + storm;

% Plot the simulated radiation signal
figure;
plot(t, radiation_signal, 'LineWidth', 1.5);
yline(0.2, '--r', 'Red alert: go to shelter', 'LineWidth', 1.5);
title('Astro Health Alert: Simulated Radiation Signal');
xlabel('Time (hours)');
ylabel('Dose rate (mSv/hour)');
grid on;
