function [Structure, Member_Table] = Analyze_Truss(Structure)
%Input a Structure and the same structure is output with the truss analyzed
%and a table that has all the members of the truss filled out
Structure = External_Reactions2(Structure);
Structure = Method_of_Structure(Structure);
Structure = Internal_Stress(Structure);
Structure = Critical_Buckling_Force(Structure);
Structure = Shear_Stress(Structure);
Structure = Safety_Factor(Structure);
Structure = Weight(Structure);
Diagram(Structure)
%Joint_Table = struct2table(struct(Structure.Joints(1)),'AsArray', true);
%for i = 2:length(Structure.Joints)
    %Joint_Table = [Joint_Table; struct2table(struct(Structure.Joints(i)), 'AsArray', true)];
%end
Member_Table = struct2table(struct(Structure.Members(1)), 'AsArray', true);
for i = 2:length(Structure.Members)
    Member_Table = [Member_Table; struct2table(struct(Structure.Members(i)), 'AsArray', true)];
end
Structure.Weight
end

