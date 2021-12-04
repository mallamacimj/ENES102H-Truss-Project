function [Structure] = Weight(Structure)
%Creates a weight value for the whole structure
Structure.Weight = 0;
for i = 1:length(Structure.Members)
    Structure.Weight = Structure.Weight + Structure.Members(i).Weight;
end
end

