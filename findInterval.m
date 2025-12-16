function idx = findInterval(val, edges)
    idx = find(val >= edges,1,'last');
end
