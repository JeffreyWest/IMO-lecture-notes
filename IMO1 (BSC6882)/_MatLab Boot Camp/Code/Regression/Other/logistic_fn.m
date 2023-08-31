function y = logistic_fn(params,xdata)
        y = params(1)./(1+params(2).*exp(-params(3).*xdata));
end