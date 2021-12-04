function [Structure] = Method_of_Structure(Structure)
%Input is a structure and output is that same structure with all it's
%member's internal forces completed
n = length(Structure.Members);
m = length(Structure.Joints) * 2;
A = zeros(m,n);
B = zeros(m, 1);
x = strings(n, 1);
for i = 1:n
    x(i,1) = Structure.Members(i).Name;
end
for i = 1:m
    if rem(i, 2) ~= 0
        for ii = 1:length(Structure.Joints((i/2)+(1/2)).Connected_Members)
            z = find(strcmp(Structure.Joints((i/2)+(1/2)).Connected_Members(ii).Name,x));
            A(i,z) = Structure.Joints((i/2)+(1/2)).Connected_Members(ii).Unit_Vector(1);
        end
    elseif rem(i, 2) == 0
        for ii = 1:length(Structure.Joints(i/2).Connected_Members)
            z = find(strcmp(Structure.Joints(i/2).Connected_Members(ii).Name,x));
            A(i,z) = Structure.Joints(i/2).Connected_Members(ii).Unit_Vector(2);
        end
    end
end
for i = 1:m/2
    if ~isempty(Structure.Joints(i).External_Force)
        B(2*i, 1) = Structure.Joints(i).External_Force(2);
    end
    if ~isempty(Structure.Joints(i).Reaction_Force)
        B(2*i, 1) = Structure.Joints(i).Reaction_Force(2);
    end
end
X = -linsolve(A,B);
for i = 1:n
    Structure.Members(i).Internal_Force = X(i);
end
end

