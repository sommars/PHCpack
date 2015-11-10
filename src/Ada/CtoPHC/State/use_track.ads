with Standard_Integer_Numbers;          use Standard_Integer_Numbers;
with C_Integer_Arrays;                  use C_Integer_Arrays;
with C_Double_Arrays;                   use C_Double_Arrays;

function use_track ( job : integer32;
                     a : C_intarrs.Pointer;
                     b : C_intarrs.Pointer;
                     c : C_dblarrs.Pointer ) return integer32;

-- DESCRIPTION :
--   Provides a gateway to the path trackers in PHCpack,
--   following the jumpstarting of homotopies idea.

-- ON ENTRY :
--   job    =  -1 : refine a solution with Newton on the container system  
--                  with in a the dimension of the solution,
--                       in b the multiplicity flag, and 
--                       in c the coordinates of the start solution,
--                  on return in (a,b,c) is the refined solution;
--          =   0 : read target system without its solutions;
--          =   1 : read start system without start solutions;
--          =   2 : create homotopy with random gamma constant;
--          =   3 : create homotopy with gamma given in c;
--          =   4 : clear the homotopy.
--          =   5 : track one path with a silent homotopy,
--                  with in a the dimension of the solution,
--                       in b the multiplicity flag, and
--                       in c the coordinates of the start solution,
--                  on return is the solution at the end of the path,
--                  and in a are (#step,#fail,#iter,#syst);
--          =   6 : track one path with a reporting homotopy,
--                  with in a the dimension of the solution,
--                       in b the multiplicity flag, and
--                       in c the coordinates of the start solution,
--                  on return is the solution at the end of the path,
--                  and in a are (#step,#fail,#iter,#syst);
--          =   7 : writes the next solution to defined output file,
--                  with extra diagnostics, provided in a:
--                  as follows a = (#step,#fail,#iter,#syst);
--          =   8 : writes a string of characters to defined output file;
--                  with in a the number of characters, and
--                       in b the character string converted
--                       to an integer array;
--          =   9 : writes a sequence of integers to the defined output file,
--                  each integer is seperated from the next by a space,
--                  with in a the number of integers, and
--                       in b the sequence of integer numbers to be written;
--          =  10 : writes a sequence of doubles to the defined output file,
--                  each double is seperated from the next by a space,
--                  with in a the number of doubles, and
--                       in c the sequence of doubles to be written;
--          =  11 : file name of target system to read without solutions
--                  is given in b, in a is the number of characters;
--          =  12 : file name of start system to read without solutions
--                  is given in b, in a is the number of characters;
--          =  13 : file name of linear-product start system to read 
--                  is given in b, in a is the number of characters;
--          =  14 : create a cascade homotopy from the stored systems;
--          =  15 : create a diagonal homotopy from the systems stored
--                  as target and start systems in standard double precision,
--                  the input parameters a and b are the dimensions of 
--                  the witness sets;
--          =  16 : reads first or second witness set from file,
--                  depending on whether the value of a equals 1 or 2,
--                  and returns in a the dimension of the ambient space
--                  and in b the following two numbers:
--                    b[0] : dimension of the solution set;
--                    b[1] : degree of the solution set;
--          =  17 : resets the input file to read in the witness set k,
--                  where k is the value of a on input, on return are
--                  in b the following two numbers:
--                    b[0] : the length of the solution list,
--                    b[1] : the dimension of the solution vectors;
--          =  18 : given in a the ambient dimensions of two witness sets,
--                  and in b their respective dimensions,
--                  on return is in a the dimension of the diagonal homotopy
--                  to start the cascade in extrinsic coordinates.
--          =  19 : computes a witness set for a polynomial in container,
--                  on entry in a and b are
--                    a[0] : index of the polynomial in the container,
--                    a[1] : number of characters in the string b;
--                    b : characters of the name of the output file.
--          =  20 : eliminates the extrinsic diagonal for the system
--                  and the solutions in the container, on entry are
--                    a[0] : current number of slack variables,
--                    a[1] : number of slack variables to be added.
--          =  21 : removes the last slack variable for the system
--                  and the solutions in the container, on input is
--                  in a the current number of slack variables.
--
-- double double precision versions :
--
--   job    =  22 : create homotopy with double double precision,
--                  with a random gamma constant.
--          =  23 : create homotopy with double double precision,
--                  with a gamma constant given by two doubles in c.
--          =  24 : clear the homotopy.
--          =  25 : track one path with a silent homotopy,
--                  with in a the dimension of the solution,
--                       in b the multiplicity flag, and
--                       in c the coordinates of the start solution,
--                  on return is the solution at the end of the path,
--                  and in a are (#step,#fail,#iter,#syst);
--          =  26 : track one path with a reporting homotopy,
--                  with in a the dimension of the solution,
--                       in b the multiplicity flag, and
--                       in c the coordinates of the start solution,
--                  on return is the solution at the end of the path,
--                  and in a are (#step,#fail,#iter,#syst);
--          =  27 : writes the next solution to defined output file,
--                  with extra diagnostics, provided in a:
--                  as follows a = (#step,#fail,#iter,#syst);
--          =  28 : create a cascade homotopy from the stored systems.
--
-- quad double precision versions :
--
--   job    =  32 : create homotopy with quad double precision,
--                  with a random gamma constant.
--          =  33 : create homotopy with quad double precision,
--                  with a gamma constant given by two doubles in c.
--          =  34 : clear the homotopy.
--          =  35 : track one path with a silent homotopy,
--                  with in a the dimension of the solution,
--                       in b the multiplicity flag, and
--                       in c the coordinates of the start solution,
--                  on return is the solution at the end of the path,
--                  and in a are (#step,#fail,#iter,#syst);
--          =  36 : track one path with a reporting homotopy,
--                  with in a the dimension of the solution,
--                       in b the multiplicity flag, and
--                       in c the coordinates of the start solution,
--                  on return is the solution at the end of the path,
--                  and in a are (#step,#fail,#iter,#syst);
--          =  37 : writes the next solution to defined output file,
--                  with extra diagnostics, provided in a:
--                  as follows a = (#step,#fail,#iter,#syst);
--          =  38 : create a cascade homotopy from the stored systems.
--
-- additional operations for diagonal homotopies ...
--
--   job    =  40 : given in a[0] the number n of variables, 
--                        in a[1] the number of characters stored in b,
--                  where b represents a polynomial in n variables,
--                  places a witness set in the systems and solutions
--                  container for the polynomial stored in b.
--          =  41 : makes the solutions to start the cascade to intersect
--                  two witness sets of dimensions in a[0] and b[0].
--          =  42 : doubles the number of symbols in the symbol table
--                  needed to write the target system solved to start the
--                  cascade of diagonal homotopies in extrinsic coordinates,
--                  given in a[0] the ambient dimension, original #variables,
--                        in a[1] the top dimension of the set,
--                        in a[2] the number of characters stored in b,
--                  where b stores the names of the symbols in the first set,
--                  on a successful return, the symbol table will contain the
--                  suffixed symbols to write the target system properly;
--          =  43 : create a diagonal homotopy from the systems stored
--                  as target and start systems in double double precision,
--                  the input parameters a and b are the dimensions of 
--                  the witness sets;
--          =  44 : create a diagonal homotopy from the systems stored
--                  as target and start systems in quad double precision,
--                  the input parameters a and b are the dimensions of 
--                  the witness sets.
--
-- multiprecision versions to create homotopy :
--
--   job    =  52 : create homotopy with multiprecision,
--                  with a random gamma constant.
--          =  53 : create homotopy with multiprecision,
--                  with a gamma constant given by two doubles in c.
--          =  54 : clear the homotopy.
--
-- ON RETURN :
--   0 if the operation was successful, otherwise something went wrong,
--   e.g.: job not in the right range.
