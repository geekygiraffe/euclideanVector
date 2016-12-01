function [line, Plane, xPlane, yPlane, zPlane] = threePointPlane (segmentP1, segmentP2, segmentP3, segmentP4)
%define and solve equation of plane using three points in 3D space
% Vector form of the equation of a line R = r +tv = (x, y, z) + t(a,b,c)
% tv = vector that lies along the line and expresses how far from the
% origianl point we shoudl move.
% (t > 0) moving away from original point in the direction of v 
% (t < 0) move away from the original point in the opposite direction of v


% x,y,z components pf points defining segment labeled as p1:4
p1 = segmentP1(1,:);
p2 = segmentP2(1,:);
p3 = segmentP3(1,:);
p4 = segmentP4(1,:);

%cross product of three points to define normal vector
%cross product is binary operation on two vectors in 3D space. cross product a x b of two linearly
%independednt vectors a and b defines a vector perpendicular to both a and b and therefor normal to plane containing them

normalVector = cross(p1-p2, p1-p3);
%* bug check to make sure p1, p2,p3 are linearly independed [cos(0)]
%normalVector is orthagonal [cos(90)]

%declare symbolic variables with x y z components and define a tempory plane - basically preallocating it in the x y z fields

syms x y z
tempPlane = [x,y,z];

%compute the dot product of this vector with previously defined normal vector
%dot product uses vecters direction and magnitude as its length 
% a .*b = |a|.*|b|cos(theta) with theta is the angle betwen a and b

definePlane = dot(normalVector, tempPlane - p1); %replace temporary plane with calculated plane

%3d line equation R = Rinitial + t(vector) 

syms t %symbolic variable t
%line = p2 + t*(p2 - p1); %[ (27363871335903*t)/9007199254740992 - 2683677003551569/4503599627370496, 5380099194048597/9007199254740992 - (16417872441579*t)/2251799813685248, (1483737918834975*t)/36028797018963968 + 8469685632015069/36028797018963968]
line = p3 + t*(p3 - p2);  %[ (684961474526033*t)/9007199254740992 - 10397/20000, 1336684132002259/2251799813685248 - (33362666039561*t)/9007199254740992, 842042525929089/4503599627370496 - (4811*t)/100000]
%line = p3 + t*(p3 - p1); %[ (44520334116371*t)/562949953421312 - 10397/20000, 1336684132002259/2251799813685248 - (99034155805877*t)/9007199254740992, 842042525929089/4503599627370496 - (433*t)/62500]

%line  gives the coordinates of a typical point on our line in terms of the parameter t
%can now evaluate plane by substituting line for P.
% % subs is a built in matlab function for symbolic substitutions
% %     subs(S,OLD,NEW) replaces OLD with NEW in the symbolic expression S.
% %     OLD is a symbolic variable, a string representing a variable name, or
% %     a string (quoted) expression. NEW is a symbolic or numeric variable
% %     or expression.

Plane = subs(definePlane, tempPlane, line);

%solve: Symbolic solution of algebraic equations.
%     The eqns are symbolic expressions, equations, or inequalities.  The
%     vars are symbolic variables specifying the unknown variables.
%     If the expressions are not equations or inequalities, 
%     solve seeks zeros of the expressions.
%     Otherwise solve seeks solutions.

%automatically sets equation equal to zero, recognizes the independent variable (t), and solves for  

t0 = solve(Plane);
point = subs(line,t,t0); %substitutes the result in line to obtain point
subs(definePlane, tempPlane, point);

%solve line equation for x, y, and z
xPlane = solve(definePlane,x);
yPlane = solve(definePlane,y);
zPlane = solve(definePlane,z);
end


%% Example using trunk
%{
p1 = trunkP1(1,:);
p2 = trunkP2(1,:);
p3 = trunkP3(1,:);

normalVector = cross(p1-p2, p1-p3);

syms x y z
tempPlane = [x,y,z];
definePlane = dot(normalVector, tempPlane - p1);


syms t
line = p2 + t*(p2 - p1); %[ (27363871335903*t)/9007199254740992 - 2683677003551569/4503599627370496, 5380099194048597/9007199254740992 - (16417872441579*t)/2251799813685248, (1483737918834975*t)/36028797018963968 + 8469685632015069/36028797018963968]
line = p3 + t*(p3 - p2); %[ (684961474526033*t)/9007199254740992 - 10397/20000, 1336684132002259/2251799813685248 - (33362666039561*t)/9007199254740992, 842042525929089/4503599627370496 - (4811*t)/100000]
line = p3 + t*(p3 - p1); %[ (44520334116371*t)/562949953421312 - 10397/20000, 1336684132002259/2251799813685248 - (99034155805877*t)/9007199254740992, 842042525929089/4503599627370496 - (433*t)/62500]

Plane = subs(definePlane, tempPlane, line);

t0 = solve(Plane);
point = subs(line,t,t0);
subs(definePlane, tempPlane, point);

xPlane = solve(definePlane,x);
yPlane = solve(definePlane,y);
zPlane = solve(definePlane,z);
%}