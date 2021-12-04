function [Structure] = External_Reactions2(Structure)
%Input a structure and the same structure is output but with the reaction
%forces solved for.
Total_External_Force = 0;
for i = 1:length(Structure.Joints)
    if ~isempty(Structure.Joints(i).External_Force)
        Total_External_Force = Total_External_Force + norm(Structure.Joints(i).External_Force);
    end
end
Structure.Joints(1).Reaction_Force = [0, Total_External_Force/2];
Structure.Joints(length(Structure.Joints)).Reaction_Force = [0, Total_External_Force/2];
end

