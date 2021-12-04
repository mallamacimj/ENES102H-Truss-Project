function [Joint_Beginning, Joint_Ending] = ...
    External_Reactions(Joint_Force, Joint_Beginning, Joint_Ending)
%Input 3 Joints in the order this order
%1st: The Joint at which the external force is acting
%2nd: The Joint at which the first reaction rollers is
%3rd: The Joint at which the second reaction roller is
%Returns the reaction force at the first roller first then
%the reaction force at the second roller
%Only works for a single force acts a single joint solely in the y-direction
%and only with 2 reaction rollers for which it returns only a reaction in
%the y-direction
    A = [1 1; 0 Joint_Ending.Coordinate(1)-Joint_Beginning.Coordinate(1)];
    B = [-Joint_Force.External_Force(2); -((Joint_Force.Coordinate(1)-...
        Joint_Beginning.Coordinate(1)).*Joint_Force.External_Force(2))];
    Aaug=[A,B];
    C = rref(Aaug);
    Joint_Beginning.Reaction_Force = [0 C(1,3)];
    Joint_Ending.Reaction_Force = [0 C(2,3)];
end

