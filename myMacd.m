function macdValues = myMacd(data_desc)
    N = length(data_desc);
    macdValues = zeros(1, N-26);

    for i = 1:(N-26)
        macdValues(i) = myEma(data_desc(i:N), 12) - myEma(data_desc(i:N), 26);
    end
end