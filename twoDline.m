function [slope,yint,line, parallelLine] = twoDline (x1, y1, x2, y2, segment);
%Fucntion calculaties the 2 dimesional line from two points .
%m is the slope of the line (y2 - y1)/(x2 - x1)
%b is the y-intercept of the line x is the independent variable of the function y = f(x)

slope = ((y2 - y1) ./ (x2 - x1)); %slope (Yfinal - Yinitial)/(Xfinal - Xinitial)
yint = y1 - slope .* x1;
line = slope .* (segment(:,1)) + yint;
parallelLine = (1/2) * line;
end



%[slope,yint,line] = twoDline (x1, y1, x2, y2, segment);
%slopeTrunkY = (trunkP1(:,2) - trunkP2(:,2)) ./ (trunkP1(:,1) - trunkP2(:,1));