function plotData(data)
    figure('Position', [100, 100, 1200, 600]);
    plot(1:1000, data);
    title("Apple price over time");
    xlabel("Time");
    ylabel("Price");

    print -dpng prices.png
end