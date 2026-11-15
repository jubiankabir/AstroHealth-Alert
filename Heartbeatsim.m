% Parameters
 Fs = 500;            % Sampling frequency (Hz)
 T = 1/Fs;            % Sampling period
 L = 1000;            % Length of signal
 t = (0:L-1)T;       % Time vector

 % Simulate a basic periodic heartbeat using Gaussian peaks (R-peaks)
 heart_rate = 72;     % Beats per minute
 f_heart = heart_rate / 60; % Frequency in Hz

 % Create synthetic ECG-like pulse train
 ecg_signal = zeros(size(t));
 beat_interval = round(Fs / f_heart);

 for i = 1:beat_interval:L
     % Add a QRS-like sharp peak around each beat index
     t_pulse = (t - (i-1)T);
     pulse = 1.2 * exp(-(t_pulse - 0.05).^2 / 0.001) ...
         
0.3 * exp(-(t_pulse - 0.02).^2 / 0.0005) ...
0.2 * exp(-(t_pulse - 0.08).^2 / 0.0005);
 idx = i:min(i+length(pulse)-1, L);
ecg_signal(idx) = ecg_signal(idx) + pulse(idx);
end

 % Plot the simulated heartbeat
 figure;
 plot(t, ecg_signal, 'LineWidth', 1.5);
 title('Simulated ECG Heartbeat Signal');
 xlabel('Time (seconds)');
 ylabel('Amplitude (mV)');
 grid on;
