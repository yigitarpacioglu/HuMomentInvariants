function etas = HUeta(moments)

xbar = moments.moment10 / moments.moment00;
ybar = moments.moment01 / moments.moment00;

etas.eta11 = (moments.moment11 - ybar*moments.moment10) / moments.moment00^2;
etas.eta20 = (moments.moment20 - xbar*moments.moment10) / moments.moment00^2;
etas.eta02 = (moments.moment02 - ybar*moments.moment01) / moments.moment00^2;
etas.eta30 = (moments.moment30 - 3 * xbar * moments.moment20 + 2 * xbar^2 * moments.moment10) / moments.moment00^2.5;
etas.eta03 = (moments.moment03 - 3 * ybar * moments.moment02 + 2 * ybar^2 * moments.moment01) / moments.moment00^2.5;
etas.eta21 = (moments.moment21 - 2 * xbar * moments.moment11 - ybar * moments.moment20 + ...
           2 * xbar^2 * moments.moment01) / moments.moment00^2.5;
etas.eta12 = (moments.moment12 - 2 * ybar * moments.moment11 - xbar * moments.moment02 + ...
           2 * ybar^2 * moments.moment10) / moments.moment00^2.5;
