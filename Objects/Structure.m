classdef Structure
    %To create a Structure, input all the Joints and Members when defining
    %the structure.
    
    properties
        Name
        Joints
        Members
        Weight
    end
    
    methods
        function [obj] = Structure(Name, varargin)
            obj.Name = Name;
            for i = varargin
                if isa(i{1}, 'Joint')
                    obj.Joints = [obj.Joints i{1}];
                elseif isa(i{1}, 'Member')
                    obj.Members = [obj.Members i{1}];
                end
            end
        end
    end
end

