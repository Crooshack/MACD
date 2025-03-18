function plotMacdAndSignalAndCrossings(N, macdLine, signalLine)
    macdLength = length(macdLine);    
    signalLineLength = length(signalLine);
    [crossings, crossings_x, crossings_y, crossings_buy_sell] = getCrossings(N, macdLine, signalLine);
    
    figure('Position', [100, 100, 1200, 600]);
    hold on
    plot((N-macdLength+1):N, macdLine);
    plot((N-signalLineLength+1):N, signalLine);

    for i = 1:length(crossings)
        if crossings_buy_sell(i) == 1
            % Sygnał przecięcia MACD w górę linii sygnału - punkt do zakupu
            plot(crossings_x(i), crossings_y(i), 'go', 'MarkerSize', 10); % Zielony punkt dla punktu do zakupu
        else
            % Sygnał przecięcia MACD w dół linii sygnału - punkt do sprzedaży
            plot(crossings_x(i), crossings_y(i), 'ro', 'MarkerSize', 10); % Czerwony punkt dla punktu do sprzedaży
        end
    end

    legend("MACD", "SIGNAL", "Buy", "Sell");
    title("MACD and SIGNAL with Crossings");
    xlabel("Samples");
    xlim([N - macdLength, N]);
    hold off

    print -dpng macdAndSignal.png
end