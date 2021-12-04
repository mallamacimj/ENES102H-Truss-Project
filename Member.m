classdef Member
    %To create a member, input a start joint, an end joint and a material
    %This will output a member, an updated start joint, and an updated end
    %joint
    
    properties
        Name
        Start_Joint
        End_Joint
        Vector
        Unit_Vector
        Length
        Angle
        Internal_Force
        Cross_Sectional_Area
        Cross_Sectional_Area_Length
        Cross_Sectional_Area_Width
        Internal_Stress
        Critical_Buckling_Force
        Shear_Stress
        Modulus_of_Elasticity
        Yield_Strength
        Glue_Yield_Strength
        Moment_of_Area_Length_cubed
        Moment_of_Area_Width_cubed
        Weight
        SF_Yielding
        SF_Buckling
        SF_Shear
    end
    
    methods
        function [obj, Start_Joint, End_Joint] = Member(Start_Joint, End_Joint,...
                Cross_Sectional_Area_Length, Cross_Sectional_Area_Width, Material)
            obj.Name = strcat(Start_Joint.Joint_Name,End_Joint.Joint_Name);
            obj.Start_Joint = Start_Joint;
            obj.End_Joint = End_Joint;
            obj.Vector = obj.End_Joint.Coordinate - obj.Start_Joint.Coordinate;
            obj.Unit_Vector = obj.Vector./norm(obj.Vector);
            obj.Length = norm(obj.Vector);
            obj.Angle = 180*(1/pi)*atan((Start_Joint.Coordinate(2)-End_Joint.Coordinate(2))...
                /(Start_Joint.Coordinate(1)-End_Joint.Coordinate(1)));
            obj.Cross_Sectional_Area_Length = Cross_Sectional_Area_Length;
            obj.Cross_Sectional_Area_Width = Cross_Sectional_Area_Width;
            obj.Cross_Sectional_Area = obj.Cross_Sectional_Area_Length * obj.Cross_Sectional_Area_Width;
            obj.Moment_of_Area_Length_cubed = (1/12)*obj.Cross_Sectional_Area_Width*(obj.Cross_Sectional_Area_Length^3);
            obj.Moment_of_Area_Width_cubed = (1/12)*obj.Cross_Sectional_Area_Length*(obj.Cross_Sectional_Area_Width^3);
            obj.Modulus_of_Elasticity = Material.Modulus_of_Elasticity;
            obj.Yield_Strength = Material.Yield_Strength;
            obj.Glue_Yield_Strength =  Material.Glue_Yield_Strength;
            obj.Weight = Material.Density*Cross_Sectional_Area_Width*Cross_Sectional_Area_Length*obj.Length;
            Start_Joint.Connected_Members = [Start_Joint.Connected_Members obj];
            End_Joint_obj = obj;
            End_Joint_obj.Unit_Vector = -(obj.Unit_Vector);
            End_Joint.Connected_Members = [End_Joint.Connected_Members End_Joint_obj];
        end
        
        %function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            %outputArg = obj.Property1 + inputArg;
        %end
    end
end

