CREATE OR REPLACE PROCEDURE b_prc_tksd_10so(tksd NUMBER) IS

  kq_so_dep VARCHAR2(200) := sb_bi.f_tksd_v10(tksd); -- ket qua dau ra ham so dep
  nth1      NUMBER := instr(kq_so_dep, '-', 1, 1); -- vi tri dau - thu nhat
  nth2      NUMBER := instr(kq_so_dep, '-', 1, 2); -- vi tri dau - thu hai

BEGIN

  MERGE INTO b_tbl_tksd_10so x
  USING (SELECT substr(tksd + 1e10, -10, 10) AS so_tai_khoan
               ,substr(kq_so_dep, 1, nth1 - 1) loai
               ,substr(kq_so_dep, nth1 + 1, nth2 - nth1 - 1) hang
               ,substr(kq_so_dep, nth2 + 1, length(kq_so_dep) - nth1) matran
           FROM dual) y
  ON (x.so_tai_khoan = y.so_tai_khoan)
  WHEN MATCHED THEN
    UPDATE SET x.loai = y.loai, x.matran = y.matran, x.hang = y.hang
  WHEN NOT MATCHED THEN
    INSERT
      (so_tai_khoan, loai, hang, matran)
    VALUES
      (y.so_tai_khoan, y.loai, y.hang, y.matran);

  DELETE FROM b_tbl_tksd_10so WHERE loai IS NULL;
  COMMIT;

END b_prc_tksd_10so;

  /*
  CREATE TABLE B_TBL_TKSD_10SO 
  (SO_TAI_KHOAN VARCHAR2(100),
  LOAI VARCHAR2(100),
  MATRAN VARCHAR2(100),
  HANG VARCHAR2(100)
  )*/

  /*
  DECLARE
    a NUMBER := 1e10 - 1;
  BEGIN
    dbms_output.put_line('Program started');
    WHILE (a >= 100) LOOP
      dbms_output.put_line(a);
      jump_binhnn.b_prc_tksd_10so(a);
      a := a - 1;
    END LOOP;
    dbms_output.put_line('Program completed');
  END;
  /
  */
