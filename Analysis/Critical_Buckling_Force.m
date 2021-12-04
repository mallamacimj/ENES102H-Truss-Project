function [Structure] = Critical_Buckling_Force(Structure)
%Input a Structure and the same structure is output but with the critical
%buckling forces filled out for each member
for i = 1:length(Structure.Members)
    if Structure.Members(i).Internal_Force < 0
        length_cubed = (pi*pi)*Structure.Members(i).Modulus_of_Elasticity...
            *Structure.Members(i).Moment_of_Area_Length_cubed/...
            (Structure.Members(i).Length^2);
        width_cubed = (pi*pi)*Structure.Members(i).Modulus_of_Elasticity...
            *Structure.Members(i).Moment_of_Area_Width_cubed/...
            (Structure.Members(i).Length^2);
        if length_cubed <= width_cubed
            Structure.Members(i).Critical_Buckling_Force = length_cubed;
        else
            Structure.Members(i).Critical_Buckling_Force = width_cubed;
        end
    end
end

end

