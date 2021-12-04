classdef Joint
    %To create a joint input a name and a coordinate.
    
    properties
        Joint_Name
        Coordinate
        External_Force
        Reaction_Force
        Connected_Members
    end
    
    methods
        function obj = Joint(Name, Coordinate)
            obj.Joint_Name = Name;
            obj.Coordinate = Coordinate;
        end
    end
end

