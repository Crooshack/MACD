function ema = myEma(data_desc, periods)
    alfa = 2 / (periods + 1);
    nominator = 0;
    denominator = 0; 
    
    for i = 0:periods
        nominator = nominator + data_desc(i+1)*(1-alfa)^(i);
        denominator = denominator + (1-alfa)^(i);
    end
    
    ema = nominator/denominator;
end