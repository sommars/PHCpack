with Interfaces.C;
with text_io;                              use text_io;
with Standard_Integer_Numbers_io;          use Standard_Integer_Numbers_io;
with Standard_Complex_Polynomials;
with Standard_Complex_Poly_Systems;
with DoblDobl_Complex_Polynomials;
with DoblDobl_Complex_Poly_Systems;
with QuadDobl_Complex_Polynomials;
with QuadDobl_Complex_Poly_Systems;
with Standard_Complex_Solutions;
with DoblDobl_Complex_Solutions;
with Standard_Dense_Series_Vectors;
with Standard_Dense_Series_VecVecs;
with DoblDobl_Dense_Series_Vectors;
with DoblDobl_Dense_Series_VecVecs;
with QuadDobl_Dense_Series_Vectors;
with QuadDobl_Dense_Series_VecVecs;
with Standard_Series_Poly_Systems;
with DoblDobl_Series_Poly_Systems;
with QuadDobl_Series_Poly_Systems;
with Series_and_Polynomials;
with Series_and_Solutions;
with Power_Series_Methods;                 use Power_Series_Methods;
with Standard_PolySys_Container;
with Standard_Systems_Pool;
with Standard_Solutions_Container;
with DoblDobl_PolySys_Container;
with DoblDobl_Systems_Pool;
with DoblDobl_Solutions_Container;
with QuadDobl_PolySys_Container;
with QuadDobl_Systems_Pool;
with QuadDobl_Complex_Solutions;
with QuadDobl_Solutions_Container;

function use_series ( job : integer32;
                      a : C_intarrs.Pointer;
                      b : C_intarrs.Pointer;
                      c : C_dblarrs.Pointer ) return integer32 is

  procedure extract_options
              ( idx,nbrit : out integer32; verbose : out boolean ) is

  -- DESCRIPTION :
  --   Extracts the options from the arguments a and b.

    v_b : constant C_Integer_Array := C_intarrs.Value(b);
    vrb : constant integer32 := integer32(v_b(v_b'first));
    v_a : constant C_Integer_Array
        := C_intarrs.Value(a,Interfaces.C.ptrdiff_t(2));
    use Interfaces.C;

  begin
    verbose := (vrb = 1);
    idx := integer32(v_a(v_a'first));
    nbrit := integer32(v_a(v_a'first+1));
    if verbose then
      put("The index of the series parameter : "); put(idx,1); new_line;
      put("The number of Newton steps : "); put(nbrit,1); new_line;
    end if;
  end extract_options;

  procedure Load_Series_Solutions
              ( s : out Standard_Dense_Series_VecVecs.Link_to_VecVec ) is

  -- DESCRIPTION :
  --   Loads the series s from the systems in the systems pool,
  --   converting every polynomial in the pool to a series.

    len : constant integer32 := integer32(Standard_Systems_Pool.Size);
    res : Standard_Dense_Series_VecVecs.VecVec(1..len);

  begin
    for k in 1..len loop
      declare
        lp : constant Standard_Complex_Poly_Systems.Link_to_Poly_Sys
           := Standard_Systems_Pool.Retrieve(k);
        sv : constant Standard_Dense_Series_Vectors.Vector
           := Series_and_Polynomials.System_to_Series_Vector(lp.all);
      begin
        res(k) := new Standard_Dense_Series_Vectors.Vector'(sv);
      end;
    end loop;
    s := new Standard_Dense_Series_VecVecs.VecVec'(res);
  end Load_Series_Solutions;

  procedure Load_Series_Solutions
              ( s : out DoblDobl_Dense_Series_VecVecs.Link_to_VecVec ) is

  -- DESCRIPTION :
  --   Loads the series s from the systems in the systems pool,
  --   converting every polynomial in the pool to a series.

    len : constant integer32 := integer32(DoblDobl_Systems_Pool.Size);
    res : DoblDobl_Dense_Series_VecVecs.VecVec(1..len);

  begin
    for k in 1..len loop
      declare
        lp : constant DoblDobl_Complex_Poly_Systems.Link_to_Poly_Sys
           := DoblDobl_Systems_Pool.Retrieve(k);
        sv : constant DoblDobl_Dense_Series_Vectors.Vector
           := Series_and_Polynomials.System_to_Series_Vector(lp.all);
      begin
        res(k) := new DoblDobl_Dense_Series_Vectors.Vector'(sv);
      end;
    end loop;
    s := new DoblDobl_Dense_Series_VecVecs.VecVec'(res);
  end Load_Series_Solutions;

  procedure Load_Series_Solutions
              ( s : out QuadDobl_Dense_Series_VecVecs.Link_to_VecVec ) is

  -- DESCRIPTION :
  --   Loads the series s from the systems in the systems pool,
  --   converting every polynomial in the pool to a series.

    len : constant integer32 := integer32(QuadDobl_Systems_Pool.Size);
    res : QuadDobl_Dense_Series_VecVecs.VecVec(1..len);

  begin
    for k in 1..len loop
      declare
        lp : constant QuadDobl_Complex_Poly_Systems.Link_to_Poly_Sys
           := QuadDobl_Systems_Pool.Retrieve(k);
        sv : constant QuadDobl_Dense_Series_Vectors.Vector
           := Series_and_Polynomials.System_to_Series_Vector(lp.all);
      begin
        res(k) := new QuadDobl_Dense_Series_Vectors.Vector'(sv);
      end;
    end loop;
    s := new QuadDobl_Dense_Series_VecVecs.VecVec'(res);
  end Load_Series_Solutions;

  procedure Store_Series_Solutions
              ( s : in Standard_Dense_Series_VecVecs.VecVec ) is

  -- DESCRIPTION :
  --   Stores the solutions in s in the systems pool,
  --   after converting every series vector to a polynomial system.

  begin
    Standard_Systems_Pool.Initialize(s'last);
    for k in s'range loop
      declare
        p : constant Standard_Complex_Poly_Systems.Poly_Sys
          := Series_and_Polynomials.Series_Vector_to_System(s(k).all);
      begin
        Standard_Systems_Pool.Initialize(k,p);
      end;
    end loop;
  end Store_Series_Solutions;

  procedure Store_Series_Solutions
              ( s : in DoblDobl_Dense_Series_VecVecs.VecVec ) is

  -- DESCRIPTION :
  --   Stores the solutions in s in the systems pool,
  --   after converting every series vector to a polynomial system.

  begin
    DoblDobl_Systems_Pool.Initialize(s'last);
    for k in s'range loop
      declare
        p : constant DoblDobl_Complex_Poly_Systems.Poly_Sys
          := Series_and_Polynomials.Series_Vector_to_System(s(k).all);
      begin
        DoblDobl_Systems_Pool.Initialize(k,p);
      end;
    end loop;
  end Store_Series_Solutions;

  procedure Store_Series_Solutions
              ( s : in QuadDobl_Dense_Series_VecVecs.VecVec ) is

  -- DESCRIPTION :
  --   Stores the solutions in s in the systems pool,
  --   after converting every series vector to a polynomial system.

  begin
    QuadDobl_Systems_Pool.Initialize(s'last);
    for k in s'range loop
      declare
        p : constant QuadDobl_Complex_Poly_Systems.Poly_Sys
          := Series_and_Polynomials.Series_Vector_to_System(s(k).all);
      begin
        QuadDobl_Systems_Pool.Initialize(k,p);
      end;
    end loop;
  end Store_Series_Solutions;

  procedure Run_Newton
              ( nq,idx,dim,nbrit : in integer32;
                echelon,verbose : in boolean;
                p : in Standard_Series_Poly_Systems.Poly_Sys;
                s : in out Standard_Dense_Series_VecVecs.VecVec ) is

  -- DESCRIPTION :
  --   The coordinates of the solution vectors in s are the leading
  --   coefficients in a power series solution to p.
  --   Newton's method is performed in standard double precision.

  -- ON ENTRY :
  --   nq       number of equations in p;
  --   idx      index to the series parameter;
  --   dim      the number of coordinates in the series;
  --   nbrit    the number of Newton steps;
  --   echelon  flag to indicate if echelon form needs to be used;
  --   verbose  flag to print message to screen;
  --   p        a polynomial of nq equations in nv unknowns;
  --   s        start terms in a solution series.

  begin
    if echelon then
      if verbose
       then put_line("Echelon Newton will be applied.");
      end if;
      Run_Echelon_Newton(nbrit,p,s,verbose);
    else
      if nq = dim then
        if verbose
         then put_line("LU Newton will be applied.");
        end if;
        Run_LU_Newton(nbrit,p,s,verbose);
      else
        if verbose
         then put_line("QR Newton will be applied.");
        end if;
        Run_QR_Newton(nbrit,p,s,verbose);
      end if;
    end if;
  end Run_Newton;

  procedure Run_Newton
              ( nq,idx,dim,nbrit : in integer32;
                echelon,verbose : in boolean;
                p : in DoblDobl_Series_Poly_Systems.Poly_Sys;
                s : in out DoblDobl_Dense_Series_VecVecs.VecVec ) is

  -- DESCRIPTION :
  --   The coordinates of the solution vectors in s are the leading
  --   terms in a power series solution to p.
  --   Newton's method is performed in double double precision.

  -- ON ENTRY :
  --   nq       number of equations in p;
  --   idx      index to the series parameter;
  --   dim      the number of coordinates in the series;
  --   nbrit    the number of Newton steps;
  --   echelon  flag to indicate whether to use echelon Newton;
  --   verbose  flag for printing intermediate output;
  --   p        a polynomial of nq equations in nv unknowns;
  --   s        start terms in a solution series.

  begin
    if echelon then
      if verbose
       then put_line("Echelon Newton will be applied.");
      end if;
      Run_Echelon_Newton(nbrit,p,s,verbose);
    else
      if nq = dim then
        if verbose
         then put_line("LU Newton will be applied.");
        end if;
        Run_LU_Newton(nbrit,p,s,verbose);
      else
        if verbose
         then put_line("QR Newton will be applied.");
        end if;
        Run_QR_Newton(nbrit,p,s,verbose);
      end if;
    end if;
  end Run_Newton;

  procedure Run_Newton
              ( nq,idx,dim,nbrit : in integer32;
                echelon,verbose : in boolean;
                p : in QuadDobl_Series_Poly_Systems.Poly_Sys;
                s : in out QuadDobl_Dense_Series_VecVecs.VecVec ) is

  -- DESCRIPTION :
  --   The coordinates of the solution vectors in s are the leading
  --   terms in a power series solution to p.
  --   Newton's method is performed in quad double precision.

  -- ON ENTRY :
  --   nq       number of equations in p;
  --   idx      index to the series parameter;
  --   dim      the number of coordinates in the series;
  --   nbrit    the number of Newton steps;
  --   echelon  flag to indicate whether to use echelon Newton;
  --   verbose  flag for intermediate output;
  --   p        a polynomial of nq equations in nv unknowns;
  --   s        start terms in a solution series.

  begin
    if echelon then
      if verbose
       then put_line("Echelon Newton will be applied.");
      end if;
      Run_Echelon_Newton(nbrit,p,s,verbose);
    else
      if nq = dim then
        if verbose
         then put_line("LU Newton will be applied.");
        end if;
        Run_LU_Newton(nbrit,p,s,verbose);
      else
        if verbose
         then put_line("QR Newton will be applied.");
        end if;
        Run_QR_Newton(nbrit,p,s,verbose);
      end if;
    end if;
  end Run_Newton;

  procedure Run_Newton
              ( nq,idx,dim,nbrit : in integer32; verbose : in boolean;
                p : in Standard_Complex_Poly_Systems.Poly_Sys;
                s : in Standard_Complex_Solutions.Solution_List ) is

  -- DESCRIPTION :
  --   The coordinates of the solution vectors in s are the leading
  --   coefficients in a power series solution to p.
  --   Newton's method is performed in standard double precision.

  -- ON ENTRY :
  --   nq       number of equations in p;
  --   idx      index to the series parameter;
  --   dim      the number of coordinates in the series;
  --   nbrit    the number of Newton steps;
  --   p        a polynomial of nq equations in nv unknowns;
  --   s        a list of solutions.

    use Standard_Complex_Solutions;

    len : constant integer32 := integer32(Length_Of(s));
    srv : Standard_Dense_Series_VecVecs.VecVec(1..len)
        := Series_and_Solutions.Create(s,idx);
    srp : Standard_Series_Poly_Systems.Poly_Sys(p'range)
        := Series_and_Polynomials.System_to_Series_System(p,idx);

  begin
    Run_Newton(nq,idx,dim,nbrit,true,verbose,srp,srv);
    Store_Series_Solutions(srv);
    Standard_Series_Poly_Systems.Clear(srp);
  end Run_Newton;

  procedure Run_Newton
              ( nq,idx,dim,nbrit : in integer32; verbose : in boolean;
                p : in DoblDobl_Complex_Poly_Systems.Poly_Sys;
                s : in DoblDobl_Complex_Solutions.Solution_List ) is

  -- DESCRIPTION :
  --   The coordinates of the solution vectors in s are the leading
  --   coefficients in a power series solution to p.
  --   Newton's method is performed in double double precision.

  -- ON ENTRY :
  --   nq       number of equations in p;
  --   idx      index to the series parameter;
  --   dim      the number of coordinates in the series;
  --   nbrit    the number of Newton steps;
  --   p        a polynomial of nq equations in nv unknowns;
  --   s        a list of solutions.

    use DoblDobl_Complex_Solutions;

    len : constant integer32 := integer32(Length_Of(s));
    srv : DoblDobl_Dense_Series_VecVecs.VecVec(1..len)
        := Series_and_Solutions.Create(s,idx);
    srp : DoblDobl_Series_Poly_Systems.Poly_Sys(p'range)
        := Series_and_Polynomials.System_to_Series_System(p,idx);

  begin
    Run_Newton(nq,idx,dim,nbrit,true,verbose,srp,srv);
    Store_Series_Solutions(srv);
    DoblDobl_Series_Poly_Systems.Clear(srp);
  end Run_Newton;

  procedure Run_Newton
              ( nq,idx,dim,nbrit : in integer32; verbose : in boolean;
                p : in QuadDobl_Complex_Poly_Systems.Poly_Sys;
                s : in QuadDobl_Complex_Solutions.Solution_List ) is

  -- DESCRIPTION :
  --   The coordinates of the solution vectors in s are the leading
  --   coefficients in a power series solution to p.
  --   Newton's method is performed in quad double precision.

  -- ON ENTRY :
  --   nq       number of equations in p;
  --   idx      index to the series parameter;
  --   dim      the number of coordinates in the series;
  --   nbrit    the number of Newton steps;
  --   p        a polynomial of nq equations in nv unknowns;
  --   s        a list of solutions.

    use QuadDobl_Complex_Solutions;

    len : constant integer32 := integer32(Length_Of(s));
    srv : QuadDobl_Dense_Series_VecVecs.VecVec(1..len)
        := Series_and_Solutions.Create(s,idx);
    srp : QuadDobl_Series_Poly_Systems.Poly_Sys(p'range)
        := Series_and_Polynomials.System_to_Series_System(p,idx);

  begin
    Run_Newton(nq,idx,dim,nbrit,true,verbose,srp,srv);
    Store_Series_Solutions(srv);
    QuadDobl_Series_Poly_Systems.Clear(srp);
  end Run_Newton;

  function Job1 return integer32 is -- standard double precision

    use Standard_Complex_Poly_Systems;
    use Standard_Complex_Solutions;

    lp : constant Link_to_Poly_Sys := Standard_PolySys_Container.Retrieve;
    sols : constant Solution_List := Standard_Solutions_Container.Retrieve;
    nq : constant integer32 := lp'last;
    nv : constant integer32 := Head_Of(sols).n;
    idx,nbr,dim : integer32;
    verbose : boolean;

  begin
    extract_options(idx,nbr,verbose);
    dim := (if idx = 0 then nv else nv-1);
    if verbose then
      put("Number of equations in the system : "); put(nq,1); new_line;
      put("The dimension of the series : "); put(dim,1); new_line;
    end if;
    Run_Newton(nq,idx,dim,nbr,verbose,lp.all,sols);
    return 0;
  end Job1;

  function Job2 return integer32 is -- double double precision

    use DoblDobl_Complex_Poly_Systems;
    use DoblDobl_Complex_Solutions;

    lp : constant Link_to_Poly_Sys := DoblDobl_PolySys_Container.Retrieve;
    sols : constant Solution_List := DoblDobl_Solutions_Container.Retrieve;
    nq : constant integer32 := lp'last;
    nv : constant integer32 := Head_Of(sols).n;
    idx,nbr,dim : integer32;
    verbose : boolean;

  begin
    extract_options(idx,nbr,verbose);
    dim := (if idx = 0 then nv else nv-1);
    if verbose then
      put("Number of equations in the system : "); put(nq,1); new_line;
      put("The dimension of the series : "); put(dim,1); new_line;
    end if;
    Run_Newton(nq,idx,dim,nbr,verbose,lp.all,sols);
    return 0;
  end Job2;

  function Job3 return integer32 is -- quad double precision

    use QuadDobl_Complex_Poly_Systems;
    use QuadDobl_Complex_Solutions;

    lp : constant Link_to_Poly_Sys := QuadDobl_PolySys_Container.Retrieve;
    sols : constant Solution_List := QuadDobl_Solutions_Container.Retrieve;
    nq : constant integer32 := lp'last;
    nv : constant integer32 := Head_Of(sols).n;
    idx,nbr,dim : integer32;
    verbose : boolean;

  begin
    extract_options(idx,nbr,verbose);
    dim := (if idx = 0 then nv else nv-1);
    if verbose then
      put("Number of equations in the system : "); put(nq,1); new_line;
      put("The dimension of the series : "); put(dim,1); new_line;
    end if;
    Run_Newton(nq,idx,dim,nbr,verbose,lp.all,sols);
    return 0;
  end Job3;

  function Job4 return integer32 is -- standard double precision

    use Standard_Complex_Polynomials;
    use Standard_Complex_Poly_Systems;

    lp : constant Link_to_Poly_Sys := Standard_PolySys_Container.Retrieve;
    nq : constant integer32 := lp'last;
    nv : constant integer32 := integer32(Number_of_Unknowns(lp(lp'first)));
    idx,nbr,dim : integer32;
    verbose : boolean;
    srv : Standard_Dense_Series_VecVecs.Link_to_VecVec;
    srp : Standard_Series_Poly_Systems.Poly_Sys(lp'range);

  begin
    Load_Series_Solutions(srv);
    extract_options(idx,nbr,verbose);
    srp := Series_and_Polynomials.System_to_Series_System(lp.all,idx);
    dim := (if idx = 0 then nv else nv-1);
    if verbose then
      put("Number of equations in the system : "); put(nq,1); new_line;
      put("The dimension of the series : "); put(dim,1); new_line;
    end if;
    Run_Newton(nq,idx,dim,nbr,true,verbose,srp,srv.all);
    Store_Series_Solutions(srv.all);
    Standard_Series_Poly_Systems.Clear(srp);
    return 0;
  end Job4;

  function Job5 return integer32 is -- double double precision

    use DoblDobl_Complex_Polynomials;
    use DoblDobl_Complex_Poly_Systems;

    lp : constant Link_to_Poly_Sys := DoblDobl_PolySys_Container.Retrieve;
    nq : constant integer32 := lp'last;
    nv : constant integer32 := integer32(Number_of_Unknowns(lp(lp'first)));
    idx,nbr,dim : integer32;
    verbose : boolean;
    srv : DoblDobl_Dense_Series_VecVecs.Link_to_VecVec;
    srp : DoblDobl_Series_Poly_Systems.Poly_Sys(lp'range);

  begin
    Load_Series_Solutions(srv);
    extract_options(idx,nbr,verbose);
    srp := Series_and_Polynomials.System_to_Series_System(lp.all,idx);
    dim := (if idx = 0 then nv else nv-1);
    if verbose then
      put("Number of equations in the system : "); put(nq,1); new_line;
      put("The dimension of the series : "); put(dim,1); new_line;
    end if;
    Run_Newton(nq,idx,dim,nbr,true,verbose,srp,srv.all);
    Store_Series_Solutions(srv.all);
    DoblDobl_Series_Poly_Systems.Clear(srp);
    return 0;
  end Job5;

  function Job6 return integer32 is -- quad double precision

    use QuadDobl_Complex_Polynomials;
    use QuadDobl_Complex_Poly_Systems;

    lp : constant Link_to_Poly_Sys := QuadDobl_PolySys_Container.Retrieve;
    nq : constant integer32 := lp'last;
    nv : constant integer32 := integer32(Number_of_Unknowns(lp(lp'first)));
    idx,nbr,dim : integer32;
    verbose : boolean;
    srv : QuadDobl_Dense_Series_VecVecs.Link_to_VecVec;
    srp : QuadDobl_Series_Poly_Systems.Poly_Sys(lp'range);

  begin
    Load_Series_Solutions(srv);
    extract_options(idx,nbr,verbose);
    srp := Series_and_Polynomials.System_to_Series_System(lp.all,idx);
    dim := (if idx = 0 then nv else nv-1);
    if verbose then
      put("Number of equations in the system : "); put(nq,1); new_line;
      put("The dimension of the series : "); put(dim,1); new_line;
    end if;
    Run_Newton(nq,idx,dim,nbr,true,verbose,srp,srv.all);
    Store_Series_Solutions(srv.all);
    QuadDobl_Series_Poly_Systems.Clear(srp);
    return 0;
  end Job6;

  function do_jobs return integer32 is
  begin
    case job is
      when 1 => return Job1; -- power series Newton in double precision
      when 2 => return Job2; -- power series Newton with double doubles
      when 3 => return Job3; -- power series Newton with quad doubles
      when 4 => return Job4; -- starting at series in double precision
      when 5 => return Job5; -- starting at series in double double precision
      when 6 => return Job6; -- starting at series in quad double precision
      when others => return -1;
    end case;
  end do_jobs;

begin
  return do_jobs;
end use_series;
