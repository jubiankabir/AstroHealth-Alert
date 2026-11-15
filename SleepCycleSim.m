% Parameters
Fs = 60;             % Sampling frequency (samples per hour = 1 per minute)
T = 1/Fs;            % Sampling period (hours)
sleep_hours = 7.5;   % Total sleep duration (hours)
L = sleep_hours*Fs;  % Length of signal
t = (0:L-1)*T;       % Time vector (hours)

% Simulate sleep cycles using Gaussian peaks
cycle_length = 1.5;  % One sleep cycle = about 90 minutes
cycle_interval = round(Fs * cycle_length);

% Create synthetic sleep-depth signal
sleep_signal = zeros(size(t));

for i = 1:cycle_interval:L
    % Add a deep-sleep peak and a REM dip in each cycle
    t_pulse = (t - (i-1)*T);
    pulse = 3.0 * exp(-(t_pulse - 0.5).^2 / 0.05) ...
        - 1.0 * exp(-(t_pulse - 1.3).^2 / 0.01);
    idx = i:min(i+cycle_interval-1, L);
    sleep_signal(idx) = sleep_signal(idx) + pulse(idx);
end

% Plot the simulated sleep signal
figure;
plot(t, sleep_signal, 'LineWidth', 1.5);
title('Astro Health Alert: Simulated Sleep Signal');
xlabel('Time (hours)');
ylabel('Sleep Depth');
grid on;
