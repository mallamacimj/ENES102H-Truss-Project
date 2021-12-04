function [Joint_System_Matrix] = Method_of_Joints(Joint)
%Input a joint and a matrix is outputed that has all the coeffients of the
%internal forces of the members connected to that joint. The columns of the
%matrix are different internal forces for members and the top row is the
%x-direction and the bottom row is the y-direction.
Joint_System_Matrix = zeros(2,length(Joint.Connected_Members));
for i = 1:length(Joint.Connected_Members)
    x_component = (Joint.Connected_Members(i).Vector(1))/...
        (Joint.Connected_Members(i).Length);
    y_component = (Joint.Connected_Members(i).Vector(2))/...
        (Joint.Connected_Members(i).Length);
    Joint_System_Matrix(1,i) = x_component;
    Joint_System_Matrix(2,i) = y_component;

end

