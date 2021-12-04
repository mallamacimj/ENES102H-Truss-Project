function [Structure] = Shear_Stress(Structure)
%Input a structure and output the same structure with the shear stress
%filled out for each member
for i = 1:length(Structure.Members)
    if Structure.Members(i).Cross_Sectional_Area_Length >=...
            Structure.Members(i).Cross_Sectional_Area_Width
        Shear_Area = Structure.Members(i).Cross_Sectional_Area_Length * .15 * Structure.Members(i).Length;
        Structure.Members(i).Shear_Stress = abs(Structure.Members(i).Internal_Force)/(2*Shear_Area);
    else
        Shear_Area = Structure.Members(i).Cross_Sectional_Area_Width * .15 * Structure.Members(i).Length;
        Structure.Members(i).Shear_Stress = abs(Structure.Members(i).Internal_Force)/(2*Shear_Area);
    end
end
end

