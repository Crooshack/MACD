function [crossings, crossings_x, crossings_y, crossings_buy_sell] = getCrossings(N, macdLine, signalLine)
    signalLineLength = length(signalLine);

    crossings = find(diff(sign(macdLine(end-signalLineLength+1:end) - signalLine)) ~= 0);
    crossings_x = (N - signalLineLength + crossings);
    crossings_y = signalLine(crossings);
    crossings_buy_sell = zeros(1, length(crossings)); % 1 - buy, 0 - sell

    for i = 1:length(crossings)
        if macdLine(end - signalLineLength + crossings(i) + 1) > signalLine(crossings(i)+1)
            % Sygnał przecięcia MACD w górę linii sygnału - punkt do zakupu      
            crossings_buy_sell(i) = 1;
        else
            % Sygnał przecięcia MACD w dół linii sygnału - punkt do sprzedaży
            crossings_buy_sell(i) = 0;
        end
    end
end