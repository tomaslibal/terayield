% make octave think this is a script file
1;

% needed for movavg function
pkg load financial

% reads historical market price (in USD) from api.blockchain.info/charts/market-price?format=csv
% 27 November 2016 - 26 November 2017
price=csvread("./price.csv");
% reads the historical hash rate (in TH/s) from api.blockchain.info/charts/hash-rate?format=csv
hash=csvread("./hashrate.csv");

% BTC revenue per 1 TH/s
% assumptions:
% 144 blocks in a day, no fees, 12.5 BTC block reward
btc_rev = 1 ./ hash .* 1800;

% USD revenue per 1 TH/s
usd_rev = btc_rev .* price;

disp("The correlation between hash rate and the USD price: "), disp(corr(hash, price));
disp("The correlation between hash rate and the USD revenue per 1 TH/s: "), disp(corr(hash, usd_rev));

% compute the trend line for the last 365 days
x=linspace(1,365, 365);
b=polyfit(transpose(x),usd_rev,1);
trend=polyval(b, transpose(x));

plot(usd_rev)
movavg(usd_rev, 10, 30)
hold on
plot(trend)
title("USD revenue per 1TH/s of BTC mining")
xlabel("per day")
ylabel("USD")
legend("1TH/s revenue","MA30","MA10","Trendline")
