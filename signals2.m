%% Signal Generation and Plotting in MATLAB
% Author: Student
% Date: September 2025
% Description: This script generates and plots six fundamental signals
% used in signal processing and IoT applications

clear all; close all; clc;

%% Time vector definition
% Define continuous time vector from -10 to 10 with small step size
t = -10:0.01:10;  % High resolution for smooth continuous-time approximation
dt = 0.01;        % Time step

%% 1. Unit Impulse Signal (Dirac Delta approximation)
% Since true impulse cannot be represented digitally, we approximate it
% with a very narrow pulse at t=0
impulse = zeros(size(t));
[~, zero_index] = min(abs(t));  % Find index closest to t=0
impulse(zero_index) = 1/dt;     % Scale by 1/dt to approximate unit area

figure(1);
plot(t, impulse, 'b-', 'LineWidth', 2);
grid on;
title('Continuous Time Unit Impulse Signal');
xlabel('Continuous time t →');
ylabel('Amplitude →');
xlim([-10 10]);
ylim([-0.5 1.5/dt]);
% Add annotation for impulse
text(0.5, 0.8/dt, 'δ(t)', 'FontSize', 14, 'Color', 'red');

%% 2. Unit Step Signal
% u(t) = 0 for t < 0, u(t) = 1 for t >= 0
step = zeros(size(t));
step(t >= 0) = 1;

figure(2);
plot(t, step, 'b-', 'LineWidth', 2);
grid on;
title('Unit Step Signal');
xlabel('Continuous time t →');
ylabel('Amplitude →');
xlim([-10 10]);
ylim([-0.5 1.5]);
% Add text annotations
text(-5, 0.1, '0', 'FontSize', 12);
text(5, 1.1, '1', 'FontSize', 12);

%% 3. Unit Ramp Signal
% r(t) = 0 for t < 0, r(t) = t for t >= 0
ramp = zeros(size(t));
ramp(t >= 0) = t(t >= 0);

figure(3);
plot(t, ramp, 'b-', 'LineWidth', 2);
grid on;
title('Unit Ramp Signal');
xlabel('Continuous time t →');
ylabel('Amplitude →');
xlim([-10 10]);
ylim([0 12]);

%% 4. Exponential Signal
% x(t) = A * e^(-at) where A = 5, a = 0.5 (decaying exponential)
A = 5;          % Amplitude
a = 0.5;        % Decay constant
exponential = A * exp(-a * t);

figure(4);
plot(t, exponential, 'b-', 'LineWidth', 2);
grid on;
title('Continuous Time Exponential Signal');
xlabel('Continuous time t →');
ylabel('Amplitude →');
xlim([-10 10]);
ylim([0 6]);
% Add equation as text
text(-8, 4, 'x(t) = 5e^{-0.5t}', 'FontSize', 12, 'BackgroundColor', 'white');

%% 5. Signum Signal
% sgn(t) = -1 for t < 0, sgn(t) = 0 for t = 0, sgn(t) = 1 for t > 0
signum = sign(t);

figure(5);
plot(t, signum, 'b-', 'LineWidth', 2);
grid on;
title('Continuous Time Signum Function');
xlabel('Continuous time t →');
ylabel('Amplitude →');
xlim([-10 10]);
ylim([-1.5 1.5]);
% Add horizontal lines for clarity
hold on;
plot([-10 0], [-1 -1], 'b-', 'LineWidth', 2);
plot([0 10], [1 1], 'b-', 'LineWidth', 2);
plot([0 0], [-1 1], 'b-', 'LineWidth', 2);
hold off;

%% 6. Sinc Signal
% sinc(t) = sin(πt)/(πt), with sinc(0) = 1 by L'Hôpital's rule
sinc_signal = sinc(t);  % MATLAB's built-in sinc function

figure(6);
plot(t, sinc_signal, 'b-', 'LineWidth', 2);
grid on;
title('Continuous Time Sinc Function');
xlabel('Continuous time t →');
ylabel('Amplitude →');
xlim([-10 10]);
ylim([-0.3 1.2]);
% Add equation as text
text(-8, 0.8, 'sinc(t) = sin(πt)/(πt)', 'FontSize', 12, 'BackgroundColor', 'white');

%% Create a combined subplot figure for easy comparison
figure(7);

% Subplot 1: Unit Impulse
subplot(3,2,1);
plot(t, impulse, 'b-', 'LineWidth', 1.5);
grid on;
title('Unit Impulse Signal');
xlabel('Time t');
ylabel('Amplitude');
xlim([-5 5]);

% Subplot 2: Unit Step
subplot(3,2,2);
plot(t, step, 'b-', 'LineWidth', 1.5);
grid on;
title('Unit Step Signal');
xlabel('Time t');
ylabel('Amplitude');
xlim([-5 5]);

% Subplot 3: Unit Ramp
subplot(3,2,3);
plot(t, ramp, 'b-', 'LineWidth', 1.5);
grid on;
title('Unit Ramp Signal');
xlabel('Time t');
ylabel('Amplitude');
xlim([-2 8]);

% Subplot 4: Exponential
subplot(3,2,4);
plot(t, exponential, 'b-', 'LineWidth', 1.5);
grid on;
title('Exponential Signal');
xlabel('Time t');
ylabel('Amplitude');
xlim([-2 8]);

% Subplot 5: Signum
subplot(3,2,5);
plot(t, signum, 'b-', 'LineWidth', 1.5);
grid on;
title('Signum Function');
xlabel('Time t');
ylabel('Amplitude');
xlim([-5 5]);

% Subplot 6: Sinc
subplot(3,2,6);
plot(t, sinc_signal, 'b-', 'LineWidth', 1.5);
grid on;
title('Sinc Function');
xlabel('Time t');
ylabel('Amplitude');
xlim([-8 8]);

% Adjust overall layout
sgtitle('Fundamental Signals in Continuous Time', 'FontSize', 16, 'FontWeight', 'bold');

%% Save figures (optional)
% Uncomment the following lines to save figures as PNG files
% saveas(figure(1), 'unit_impulse.png');
% saveas(figure(2), 'unit_step.png');
% saveas(figure(3), 'unit_ramp.png');
% saveas(figure(4), 'exponential.png');
% saveas(figure(5), 'signum.png');
% saveas(figure(6), 'sinc.png');
% saveas(figure(7), 'all_signals_combined.png');

%% Display signal properties
fprintf('\n=== Signal Properties ===\n');
fprintf('Time vector range: %.1f to %.1f seconds\n', min(t), max(t));
fprintf('Time step (dt): %.3f seconds\n', dt);
fprintf('Number of samples: %d\n', length(t));
fprintf('Impulse peak value: %.2f (approximated)\n', max(impulse));
fprintf('Step signal final value: %.1f\n', max(step));
fprintf('Ramp signal max value: %.1f\n', max(ramp));
fprintf('Exponential initial value: %.2f\n', exponential(zero_index));
fprintf('Sinc signal peak value: %.3f\n', max(sinc_signal));
fprintf('\nAll figures generated successfully!\n');