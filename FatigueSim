% Parameters
Fs = 60;             % Sampling frequency (samples per hour = 1 per minute)
T = 1/Fs;            % Sampling period (hours)
day_hours = 16;      % Hours awake
L = day_hours*Fs;    % Length of signal
t = (0:L-1)*T;       % Time vector (hours)

% Simulate work blocks using Gaussian peaks
block_length = 4;    % One work block = 4 hours
block_interval = round(Fs * block_length);

% Create synthetic fatigue signal
fatigue_signal = 0.25 * t;   % Fatigue slowly rises all day

for i = 1:block_interval:L
    % Add a tiredness bump during work and a dip during the break
    t_pulse = (t - (i-1)*T);
    pulse = 1.5 * exp(-(t_pulse - 2.5).^2 / 0.8) ...
        - 0.8 * exp(-(t_pulse - 3.8).^2 / 0.05);
    idx = i:min(i+block_interval-1, L);
    fatigue_signal(idx) = fatigue_signal(idx) + pulse(idx);
end

% Plot the simulated fatigue signal
figure;
plot(t, fatigue_signal, 'LineWidth', 1.5);
title('Astro Health Alert: Simulated Fatigue Signal');
xlabel('Time awake (hours)');
ylabel('Fatigue Level');
grid on;
