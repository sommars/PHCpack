with text_io;                           use text_io;
with Standard_Natural_Numbers;          use Standard_Natural_Numbers;
with Standard_Integer_Numbers;          use Standard_Integer_Numbers;
with Standard_Complex_Vectors;          use Standard_Complex_Vectors;
with Standard_Complex_Matrices;         use Standard_Complex_Matrices;
with Standard_Complex_Poly_Systems;     use Standard_Complex_Poly_Systems;
with Standard_Complex_Solutions;        use Standard_Complex_Solutions;

package Extrinsic_Diagonal_Continuation is

-- DESCRIPTION :
--   A diagonal homotopy allows to compute witness sets for all components
--   of the intersection of two positive dimensional solution sets.
--   The extrinsic version applies the equations for the witness sets.

-- IMPORTANT REQUIREMENT :
--   The polynomial systems and system functions assume the right
--   number of equations, i.e.: complete intersections.
--   Randomize whenever necessary before applying diagonal homotopies.

  function Minimal_Intersection_Dimension
             ( n,a,b : integer32 ) return integer32;

  -- DESCRIPTION :
  --   Returns the minimal dimension of the intersection of 
  --   an a-dimensional with a b-dimensional component in n-space.

  procedure Extrinsic_Diagonal_Homotopy
              ( file : in file_type; name : in string; report : in boolean;
                p1e,p2e : in Poly_Sys; a,b : in natural32;
                sols1,sols2 : in Solution_List );

  -- DESCRIPTION :
  --   Runs the diagonal homotopy algorithm in extrinsic coordinates
  --   to intersect a-dimensional witness set (p1e,sols1)
  --   with the b-dimensional witness set (p2e,sols2).

  -- ON ENTRY :
  --   file     for intermediate output and diagnostics;
  --   name     name of the output file, will be used as prefix to write
  --            the (super) witness sets;
  --   report   flag to ask for intermediate output during path following;
  --   p1e      1st embedded polynomial system;
  --   p2e      2nd embedded polynomial system;
  --   a        dimension of the 1st witness set;
  --   b        dimension of the 2nd witness set;
  --   sols1    witness points on the 1st component, without embedding;
  --   sols2    witness points on the 2nd component, without embedding.

  -- REQUIRED : a >= b.

end Extrinsic_Diagonal_Continuation;
