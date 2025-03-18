load("prices_desc.csv");
prices_desc_length = length(prices_desc);

%macd
macdLine = myMacd(prices_desc);

%signal
signalLine = mySignal(macdLine);


%plots
%zamiana bo algorytm jest dla danych wejściowych posortowanych od
%najnowszych do najstarszych
macdLine = fliplr(macdLine);
signalLine = fliplr(signalLine);
plotMacdAndSignalAndCrossings(prices_desc_length, macdLine, signalLine);

prices_asc = flipud(prices_desc);
plotData(prices_asc);


%symulacja biznesmena
startMoney = 1000;
startDay = 1;
endDay = 1000;
gain = simulateStockMarket(prices_asc, macdLine, signalLine, startMoney, startDay, endDay);
fprintf("Zysk z inwestycji od dnia %d do dnia %d przy początkowych funduszach $%d wynosi: $%.2f", startDay, endDay, startMoney, gain);