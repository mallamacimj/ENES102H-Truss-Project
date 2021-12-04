function [Structure] = Safety_Factor(Structure)
%Input a Structure and the same structure is output with the member safety
%factors updated
for i = 1:length(Structure.Members)
    Structure.Members(i).SF_Yielding = Structure.Members(i).Yield_Strength/...
        abs(Structure.Members(i).Internal_Stress);
    Structure.Members(i).SF_Buckling = Structure.Members(i).Critical_Buckling_Force/...
        abs(Structure.Members(i).Internal_Force);
    Structure.Members(i).SF_Shear = Structure.Members(i).Glue_Yield_Strength/...
        abs(Structure.Members(i).Shear_Stress);
end
end

