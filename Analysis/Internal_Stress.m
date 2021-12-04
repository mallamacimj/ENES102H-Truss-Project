function [Structure] = Internal_Stress(Structure)
%Input a Structure and the same structure will be output with all its
%members internal stresses completed
for i = 1:length(Structure.Members)
    Structure.Members(i).Internal_Stress = Structure.Members(i).Internal_Force/...
        Structure.Members(i).Cross_Sectional_Area;
end
end

