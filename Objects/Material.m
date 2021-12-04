classdef Material
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Modulus_of_Elasticity
        Yield_Strength
        Glue_Yield_Strength
        Density
    end
    
    methods
        function obj = Material(Modulus_of_Elasticity, Yield_Strength, Glue_Yield_Strength, Density)
            obj.Modulus_of_Elasticity = Modulus_of_Elasticity;
            obj.Yield_Strength = Yield_Strength;
            obj.Glue_Yield_Strength = Glue_Yield_Strength;
            obj.Density = Density;
        end
    end
end

