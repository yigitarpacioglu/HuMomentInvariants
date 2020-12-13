function moments = HUcomputemoments(img)

[Row, Col] = size(img);
[x, y] = meshgrid(1:Col, 1:Row);
  
x = x(:);
y = y(:);
img = img(:);
  
moments.moment00 = sum(img);

if (moments.moment00 == 0)
    moments.moment00 = eps;
end
  
moments.moment10 = sum(x .* img);
moments.moment01 = sum(y .* img);
moments.moment11 = sum(x .* y .* img);
moments.moment20 = sum(x.^2 .* img);
moments.moment02 = sum(y.^2 .* img);
moments.moment30 = sum(x.^3 .* img);
moments.moment03 = sum(y.^3 .* img);
moments.moment12 = sum(x .* y.^2 .* img);
moments.moment21 = sum(x.^2 .* y .* img);
end