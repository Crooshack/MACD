function gain = simulateStockMarket(data_asc, macdLine_asc, signalLine_asc, availableMoney, startDay, endDay)
    [~, crossings_x, ~, crossings_buy_sell] = getCrossings(length(data_asc), macdLine_asc, signalLine_asc);
   
    indices_in_range = crossings_x >= startDay & crossings_x <= endDay;
    crossings_x_in_range = crossings_x(indices_in_range);
    crossings_buy_sell_in_range = crossings_buy_sell(indices_in_range);

    startMoney = availableMoney;
    shares = 0;
   
    for currentCrossingIndex = 1:length(crossings_x_in_range)
        i = crossings_x_in_range(currentCrossingIndex);
        if(crossings_buy_sell_in_range(currentCrossingIndex) == 1)
            newShares = fix(availableMoney / data_asc(i));
            availableMoney = availableMoney - data_asc(i)*newShares;
            shares = shares + newShares;
        else
            availableMoney = availableMoney + data_asc(i)*shares;
            shares = 0;
        end
    end

    if(shares ~= 0)
        availableMoney = availableMoney + data_asc(endDay)*shares;
        shares = 0;
    end

    gain = availableMoney - startMoney;
end