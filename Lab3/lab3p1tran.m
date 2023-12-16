Number = [5 3 5 0 4 6 0 3 4 6];

x = DTMFT(Number);

soundsc(x, 8192);

function[x] = DTMFT(Number)

    frequency = [941 1336;
                 697 1209;
                 697 1336;
                 697 1477;
                 770 1209;
                 770 1336;
                 770 1477;
                 852 1209;
                 852 1336;
                 852 1477];
    
    number_size = size(Number);
    character = [0 1 2 3 4 5 6 7 8 9];
    duration = 0:1/8192:0.25;
    x = zeros(1, number_size(1) * 2049);
    i = 0;
    
    for digit = Number
        index = find(character == digit);
        if digit <= 9 && digit >= 0
            digit_freq = frequency(index, :);
            signal = cos(2*pi*digit_freq(1)*duration)+cos(2*pi*digit_freq(2)*duration);
            i = i + 1;
            x = horzcat(x, signal); % horzcat() horizantal concatination of arrays
        end
    end
end
