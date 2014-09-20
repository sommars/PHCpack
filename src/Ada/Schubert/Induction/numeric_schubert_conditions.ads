with Standard_Natural_Numbers;          use Standard_Natural_Numbers;
with Standard_Integer_Numbers;          use Standard_Integer_Numbers;
with Standard_Complex_Matrices;
with Standard_Complex_Polynomials;      use Standard_Complex_Polynomials;
with Standard_Complex_Poly_Systems;     use Standard_Complex_Poly_Systems;
with Standard_Complex_Poly_Matrices;
with Brackets;                          use Brackets;
with Bracket_Polynomials;               use Bracket_Polynomials;
with Remember_Numeric_Minors;           use Remember_Numeric_Minors;
with Remember_Symbolic_Minors;          use Remember_Symbolic_Minors;

package Numeric_Schubert_Conditions is

-- DESCRIPTION :
--   Given the symbolic bracket systems that represent Schubert conditions
--   as minors of a matrix of type [ X | F ],
--   this package formulates the corresponding polynomial systems.

  function Degree ( b : Bracket; k : natural32 ) return integer32;

  -- DESCRIPTION :
  --   Returns the number of entries in b that are <= k.
  --   This number determines the degree of the polynomial equations
  --   resulting from the intersection conditions det([ X | F ]) = 0,
  --   if b is the selection of columns of [ X | F ].

  function Permute ( b,p : Bracket ) return Bracket;

  -- DESCRIPTION :
  --   Returns p(b), the entries in b are filtered through p.

  function Substitute ( p : Bracket_Polynomial; t : Numeric_Minor_Table )
                      return Bracket_Polynomial;
  function Substitute ( p : Bracket_Polynomial; t : Numeric_Minor_Table;
                        rows : Bracket ) return Bracket_Polynomial;

  -- DESCRIPTION :
  --   Substitutes the second bracket of each monomial in p
  --   by the corresponding value in the numeric minor table.

  -- ON ENTRY :
  --   p        bracket polynomial encodes a Laplace expansion,
  --            with two brackets in each monomial, respectively
  --            the symbolic and numeric minor;
  --   t        remember table for numerical minors;
  --   rows     optional displacement of the rows selected by the brackets
  --            in the Laplace expansion.

  function Substitute ( p : Bracket_Polynomial; t : Symbolic_Minor_Table )
                      return Poly;
  function Substitute ( p : Bracket_Polynomial; t : Symbolic_Minor_Table;
                        rows : Bracket ) return Poly;

  -- DESCRIPTION :
  --   Substitutes the minors in p by the corresponding polynomials of t,
  --   eventually taking the displacement with the rows into account.

  function Substitute ( p : Bracket_Polynomial;
                        nt,st : Symbolic_Minor_Table;
                        rows : Bracket ) return Poly;

  -- DESCRIPTION :
  --   Substitutes minors in p by the corresponding polynomials in nt
  --   for the first brackets and st for the second brackets of every
  --   term in p.

  function Select_Columns
              ( A : Standard_Complex_Matrices.Matrix;
                col : Bracket; d,k : integer32 )
              return Standard_Complex_Matrices.Matrix;
  function Select_Columns
              ( A : Standard_Complex_Poly_Matrices.Matrix;
                col : Bracket; d,k : integer32 )
              return Standard_Complex_Poly_Matrices.Matrix;

  -- DESCRIPTION :
  --   Selects as many as d columns of A,
  --   where d = col'last - Degree(b,k), for some k-bracket b.

  function Select_Columns
              ( x : Standard_Complex_Poly_Matrices.Matrix;
                col : Bracket; d : integer32 )
              return Standard_Complex_Poly_Matrices.Matrix;

  -- DESCRIPTION :
  --   Selects as many as d columns of x,
  --   using the first d indices from col.

  function Laplace_One_Minor
               ( n,k : integer32; row,col : Bracket;
                 A : Standard_Complex_Matrices.Matrix ) 
               return Bracket_Polynomial;
  function Laplace_One_Minor
               ( n,k : integer32; row,col : Bracket;
                 X : Standard_Complex_Poly_Matrices.Matrix; 
                 A : Standard_Complex_Matrices.Matrix ) return Poly;
  function Laplace_One_Minor
               ( n,k : integer32; row,col : Bracket;
                 X,A : Standard_Complex_Poly_Matrices.Matrix) return Poly;

  -- DESCRIPTION :
  --   Applies Laplace expansion to one minor defined by row and col
  --   to express that the intersection of a k-plane with an f-plane,
  --   generated by the columns of A, in n-space has dimension i.

  function Elaborate_One_Flag_Minor
               ( n,k,f,i : integer32; fm : Bracket_Polynomial;
                 A : Standard_Complex_Matrices.Matrix )
               return Bracket_Polynomial;
  function Elaborate_One_Flag_Minor
               ( n,k,f,i : integer32; fm : Bracket_Polynomial;
                 X : Standard_Complex_Poly_Matrices.Matrix;
                 A : Standard_Complex_Matrices.Matrix ) return Poly;
  function Elaborate_One_Flag_Minor
               ( n,k,f,i : integer32; fm : Bracket_Polynomial;
                 X,A : Standard_Complex_Poly_Matrices.Matrix ) return Poly;

  -- DESCRIPTION :
  --   Retrieves the row and column from the one monomial in fm
  --   and computes the condition that in n-space, a k-plane meets
  --   an f-plane, generated by the columns of A, in an i-space.

  function Expand ( n,k,nq : integer32; lambda : Bracket;
                    X : Standard_Complex_Poly_Matrices.Matrix;
                    flag : Standard_Complex_Matrices.Matrix )
                  return Poly_Sys;

  -- DECRIPTION :
  --   Expands all symbolic and numeric minors to return a polynomial
  --   system of nq equations for the Schubert conditions in lambda on
  --   a k-plane X in n-space meeting the given flag.

  function Expand ( n,k,nq : integer32; lambda : Bracket;
                    X,F : Standard_Complex_Poly_Matrices.Matrix )
                  return Poly_Sys;

  -- DESCRIPTION :
  --   All minors, both in X and F are now polynomials for expansion
  --   into a polynomial system for Schubert conditions on a k-plane in X
  --   meeting a flag F.

  -- REQUIRED :
  --   The number of unknowns in all polynomial matrices is the same for all.

-- WRAPPER FUNCTION :

  function Expanded_Polynomial_Equations 
             ( n,k : integer32; cond : Bracket;
               flag : Standard_Complex_Matrices.Matrix ) return Poly_Sys;

  -- DESCRIPTION :
  --   Returns the expanded polynomial equation for the condition on
  --   a k-plane in n-space with the localization map in locmap,
  --   imposed by the conditions in cond and with respect to the given flag.

  -- ON ENTRY :
  --   n        ambient dimension;
  --   k        dimension of the solution plane;
  --   cond     conditions imposed by Schubert conditions;
  --   flag     used for formulating the polynomial equations.

  -- ON RETURN :
  --   Expanded polynomial equations that define the Schubert conditions
  --   via all expanded minors.

end Numeric_Schubert_Conditions;
