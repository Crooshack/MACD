function signalLine = mySignal(macdValues)
    macdLength = length(macdValues);
    signalLine = zeros(1, macdLength-9);
    for i = 1:(macdLength-9)
        signalLine(i) = myEma(macdValues(i:macdLength), 9);
    end
end