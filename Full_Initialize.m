wood = Material(1E6, 5E7, 9E7, 1);
a = Joint("a", [0,0]);
c = Joint("c", [4,0]);
b = Joint("b", [2,2]);
b.External_Force = [0,-1000];
[ab, a, b] = Member(a, b, .1, .1, wood); 
[ac, a, c] = Member(a, c, .1, .1, wood); 
[bc, b, c] = Member(b, c, .1, .1, wood);
%[a, b] = External_Reactions(c, a, b);
abc = Structure("abc", a, b, c, ab, ac, bc);
%abc = External_Reactions2(abc);
%abc = Method_of_Structure(abc);
%abc = Internal_Stress(abc);
%abc = Critical_Buckling_Force(abc);
%abc = Shear_Stress(abc);
%abc = Safety_Factor(abc);
[abc, Member_Table] = Analyze_Truss(abc);
Diagram(abc)