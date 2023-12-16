[y, Fs_original] = audioread('input.wav');

Fs_new = 8192;

y_resampled = resample(y, Fs_new, Fs_original);

audiowrite('reinput.wav', y_resampled, Fs_new);