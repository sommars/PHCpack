with Standard_Floating_Numbers;         use Standard_Floating_Numbers;
with Double_Double_Numbers;             use Double_Double_Numbers;
with Quad_Double_Numbers;               use Quad_Double_Numbers;
with Standard_Complex_Numbers;
with DoblDobl_Complex_Numbers;
with QuadDobl_Complex_Numbers;

package body VarbPrec_Matrix_Conversions is

  function d2dd ( mtx : Standard_Floating_Matrices.Matrix )
                return Double_Double_Matrices.Matrix is

    res : Double_Double_Matrices.Matrix(mtx'range(1),mtx'range(2));

  begin
    for i in mtx'range(1) loop
      for j in mtx'range(2) loop
        res(i,j) := create(mtx(i,j));
      end loop;
    end loop;
    return res;
  end d2dd;

  function d2dd ( mtx : Standard_Complex_Matrices.Matrix )
                return DoblDobl_Complex_Matrices.Matrix is

    res : DoblDobl_Complex_Matrices.Matrix(mtx'range(1),mtx'range(2));

  begin
    for i in mtx'range(1) loop
      for j in mtx'range(2) loop
        declare
          strp : constant double_float
               := Standard_Complex_Numbers.REAL_PART(mtx(i,j));
          ddrp : constant double_double := create(strp);
          stip : constant double_float
               := Standard_Complex_Numbers.IMAG_PART(mtx(i,j));
          ddip : constant double_double := create(stip);
        begin
          res(i,j) := DoblDobl_Complex_Numbers.create(ddrp,ddip);
        end;
      end loop;
    end loop;
    return res;
  end d2dd;

  function d2qd ( mtx : Standard_Floating_Matrices.Matrix )
                return Quad_Double_Matrices.Matrix is

    res : Quad_Double_Matrices.Matrix(mtx'range(1),mtx'range(2));

  begin
    for i in mtx'range(1) loop
      for j in mtx'range(2) loop
        res(i,j) := create(mtx(i,j));
      end loop;
    end loop;
    return res;
  end d2qd;

  function d2qd ( mtx : Standard_Complex_Matrices.Matrix )
                return QuadDobl_Complex_Matrices.Matrix is

    res : QuadDobl_Complex_Matrices.Matrix(mtx'range(1),mtx'range(2));

  begin
    for i in mtx'range(1) loop
      for j in mtx'range(2) loop
        declare
          strp : constant double_float
               := Standard_Complex_Numbers.REAL_PART(mtx(i,j));
          ddrp : constant double_double := create(strp);
          qdrp : constant quad_double := create(ddrp);
          stip : constant double_float
               := Standard_Complex_Numbers.IMAG_PART(mtx(i,j));
          ddip : constant double_double := create(stip);
          qdip : constant quad_double := create(ddip);
        begin
          res(i,j) := QuadDobl_Complex_Numbers.create(qdrp,qdip);
        end;
      end loop;
    end loop;
    return res;
  end d2qd;

  function dd2d ( mtx : Double_Double_Matrices.Matrix )
                return Standard_Floating_Matrices.Matrix is

    res : Standard_Floating_Matrices.Matrix(mtx'range(1),mtx'range(2));

  begin
    for i in mtx'range(1) loop
      for j in mtx'range(2) loop
        res(i,j) := to_double(mtx(i,j));
      end loop;
    end loop;
    return res;
  end dd2d;

  function dd2d ( mtx : DoblDobl_Complex_Matrices.Matrix )
                return Standard_Complex_Matrices.Matrix is

    res : Standard_Complex_Matrices.Matrix(mtx'range(1),mtx'range(2));

  begin
    for i in mtx'range(1) loop
      for j in mtx'range(2) loop
        declare
          ddrp : constant double_double
               := DoblDobl_Complex_Numbers.REAL_PART(mtx(i,j));
          strp : constant double_float := to_double(ddrp);
          ddip : constant double_double
               := DoblDobl_Complex_Numbers.IMAG_PART(mtx(i,j));
          stip : constant double_float := to_double(ddip);
        begin
          res(i,j) := Standard_Complex_Numbers.create(strp,stip);
        end;
      end loop;
    end loop;
    return res;
  end dd2d;

  function qd2d ( mtx : Quad_Double_Matrices.Matrix )
                return Standard_Floating_Matrices.Matrix is

    res : Standard_Floating_Matrices.Matrix(mtx'range(1),mtx'range(2));

  begin
    for i in mtx'range(1) loop
      for j in mtx'range(2) loop
        res(i,j) := to_double(mtx(i,j));
      end loop;
    end loop;
    return res;
  end qd2d;

  function qd2d ( mtx : QuadDobl_Complex_Matrices.Matrix )
                return Standard_Complex_Matrices.Matrix is

    res : Standard_Complex_Matrices.Matrix(mtx'range(1),mtx'range(2));

  begin
    for i in mtx'range(1) loop
      for j in mtx'range(2) loop
        declare
          qdrp : constant quad_double
               := QuadDobl_Complex_Numbers.REAL_PART(mtx(i,j));
          strp : constant double_float := to_double(qdrp);
          qdip : constant quad_double
               := QuadDobl_Complex_Numbers.IMAG_PART(mtx(i,j));
          stip : constant double_float := to_double(qdip);
        begin
          res(i,j) := Standard_Complex_Numbers.create(strp,stip);
        end;
      end loop;
    end loop;
    return res;
  end qd2d;

end VarbPrec_Matrix_Conversions;