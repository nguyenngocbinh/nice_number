CREATE OR REPLACE FUNCTION tksd_v10(so_dep NUMBER) RETURN VARCHAR2 IS
  tksd VARCHAR2(10);
  x1   VARCHAR2(1);
  x2   VARCHAR2(1);
  x3   VARCHAR2(1);
  x4   VARCHAR2(1);
  x5   VARCHAR2(1);
  x6   VARCHAR2(1);
  x7   VARCHAR2(1);
  x8   VARCHAR2(1);
  x9   VARCHAR2(1);
  x10  VARCHAR2(1);
  loai VARCHAR2(50);
  nhap_sai_ky_tu EXCEPTION;
  PRAGMA EXCEPTION_INIT(nhap_sai_ky_tu, -20001);

BEGIN
  -- Kiem tra dinh dang so dep
  IF so_dep < 0 OR so_dep > 1e10 - 1 THEN
    -- RAISE nhap_sai_ky_tu;
    raise_application_error(-20001, 'Nhap sai dinh dang');
  END IF;

  tksd := substr(so_dep + 1e10, -10, 10);
  x1   := substr(tksd, -10, 1);
  x2   := substr(tksd, -9, 1);
  x3   := substr(tksd, -8, 1);
  x4   := substr(tksd, -7, 1);
  x5   := substr(tksd, -6, 1);
  x6   := substr(tksd, -5, 1);
  x7   := substr(tksd, -4, 1);
  x8   := substr(tksd, -3, 1);
  x9   := substr(tksd, -2, 1);
  x10  := substr(tksd, -1, 1);
  loai := CASE
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 = x5 AND x1 = x6 AND
                 x1 = x7 AND x1 = x8 AND x1 = x9 AND x1 = x10 THEN
             'V10-HANG1-aaaaaaaaaa'
            WHEN substr(so_dep + 1e10, -10, 10) = '3939393939' THEN
             'V10-HANG1-3939393939'
            WHEN substr(so_dep + 1e10, -10, 10) = '7979797979' THEN
             'V10-HANG1-7979797979'
            WHEN substr(so_dep + 1e10, -10, 10) = '3979397939' THEN
             'V10-HANG1-3979397939'
            WHEN substr(so_dep + 1e10, -10, 10) = '3979397979' THEN
             'V10-HANG1-3979397979'
            WHEN substr(so_dep + 1e10, -10, 10) = '3939393979' THEN
             'V10-HANG1-3939393979'
            WHEN substr(so_dep + 1e10, -10, 10) = '7979797939' THEN
             'V10-HANG1-7979797939'
            WHEN substr(so_dep + 1e10, -10, 10) = '3939397979' THEN
             'V10-HANG1-3939397979'
            WHEN substr(so_dep + 1e10, -10, 10) = '7979793939' THEN
             'V10-HANG1-7979793939'
            WHEN substr(so_dep + 1e10, -10, 10) = '3939797979' THEN
             'V10-HANG1-3939797979'
            WHEN substr(so_dep + 1e10, -10, 10) = '7979393939' THEN
             'V10-HANG1-7979393939'
            WHEN substr(so_dep + 1e10, -10, 10) = '3979797979' THEN
             'V10-HANG1-3979797979'
            WHEN substr(so_dep + 1e10, -10, 10) = '7939393939' THEN
             'V10-HANG1-7939393939'
            WHEN substr(so_dep + 1e10, -10, 10) = '3838383838' THEN
             'V10-HANG1-3838383838'
            WHEN substr(so_dep + 1e10, -10, 10) = '7878787878' THEN
             'V10-HANG1-7878787878'
            WHEN substr(so_dep + 1e10, -10, 10) = '3878387838' THEN
             'V10-HANG1-3878387838'
            WHEN substr(so_dep + 1e10, -10, 10) = '3878387878' THEN
             'V10-HANG1-3878387878'
            WHEN substr(so_dep + 1e10, -10, 10) = '3838383878' THEN
             'V10-HANG1-3838383878'
            WHEN substr(so_dep + 1e10, -10, 10) = '7878787838' THEN
             'V10-HANG1-7878787838'
            WHEN substr(so_dep + 1e10, -10, 10) = '3838387878' THEN
             'V10-HANG1-3838387878'
            WHEN substr(so_dep + 1e10, -10, 10) = '7878783838' THEN
             'V10-HANG1-7878783838'
            WHEN substr(so_dep + 1e10, -10, 10) = '3838787878' THEN
             'V10-HANG1-3838787878'
            WHEN substr(so_dep + 1e10, -10, 10) = '7878383838' THEN
             'V10-HANG1-7878383838'
            WHEN substr(so_dep + 1e10, -10, 10) = '3878787878' THEN
             'V10-HANG1-3878787878'
            WHEN substr(so_dep + 1e10, -10, 10) = '7838383838' THEN
             'V10-HANG1-7838383838'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 = x5 AND x1 <> x6 AND
                 x6 = x7 AND x6 = x8 AND x6 = x9 AND x6 = x10 THEN
             'V10-HANG2-aaaaabbbbb'
            WHEN x1 = x2 AND x1 = x7 AND x1 = x8 AND x1 <> x3 AND x3 = x4 AND
                 x3 = x5 AND x3 = x6 AND x3 = x8 AND x3 = x9 AND x3 = x10 THEN
             'V10-HANG2-aabbbaabbb'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 <> x5 AND x5 = x6 AND
                 x1 = x7 AND x1 = x8 AND x1 = x9 AND x1 = x10 THEN
             'V10-HANG2-aaaabbaaaa'
            WHEN x1 = x2 AND x1 = x3 AND x1 <> x4 AND x4 = x5 AND x4 = x6 AND
                 x4 = x7 AND x1 = x8 AND x1 = x9 AND x1 = x10 THEN
             'V10-HANG2-aaabbbbaaa'
            WHEN x1 = x2 AND x1 <> x3 AND x1 = x4 AND x1 = x5 AND x3 = x6 AND
                 x1 = x7 AND x1 = x8 AND x3 = x9 AND x1 = x10 THEN
             'V10-HANG2-aabaabaaba'
            WHEN x1 <> x2 AND x2 = x3 AND x1 = x4 AND x2 = x5 AND x2 = x6 AND
                 x1 = x7 AND x2 = x8 AND x2 = x9 AND x1 = x10 THEN
             'V10-HANG2-abbabbabba'
            WHEN x1 = x2 AND x1 <> x3 AND x3 = x4 AND x3 = x5 AND x3 = x6 AND
                 x3 = x7 AND x3 = x8 AND x1 = x9 AND x1 = x10 THEN
             'V10-HANG2-aabbbbbbaa'
            WHEN x1 = x3 AND x1 <> x2 AND x2 = x4 AND x1 = x5 AND x2 = x6 AND
                 x1 = x7 AND x2 = x8 AND x1 = x9 AND x2 = x10 THEN
             'V10-HANG2-ababababab'
            WHEN x1 = x2 AND x1 <> x3 AND x3 = x4 AND x1 = x5 AND x1 = x6 AND
                 x3 = x7 AND x3 = x8 AND x1 = x9 AND x1 = x10 THEN
             'V10-HANG2-aabbaabbaa'
            WHEN x1 = x2 AND x3 = x4 AND x5 = x6 AND x7 = x8 AND x9 = x10 AND
                 x1 <> x3 AND x1 <> x5 AND x1 <> x7 AND x1 <> x9 AND
                 x3 <> x5 AND x3 <> x7 AND x3 <> x9 AND x5 <> x7 AND
                 x5 <> x9 AND x7 <> x9 THEN
             'V10-HANG2-aabbccddee'
            WHEN x1 <> x2 AND x2 = x3 AND x2 = x4 AND x2 = x5 AND x2 = x6 AND
                 x2 = x7 AND x2 = x8 AND x2 = x9 AND x1 = x10 THEN
             'V10-HANG2-abbbbbbbba'
            WHEN x1 = x6 AND x2 = x7 AND x3 = x8 AND x4 = x9 AND x5 = x10 AND
                 x1 <> x2 AND x1 <> x3 AND x1 <> x4 AND x1 <> x5 AND
                 x2 <> x3 AND x2 <> x4 AND x2 <> x5 AND x3 <> x4 AND
                 x3 <> x5 AND x4 <> x5 THEN
             'V10-HANG2-abcdeabcde'
            WHEN x1 = x10 AND x2 = x9 AND x3 = x8 AND x4 = x7 AND x5 = x6 AND
                 x1 <> x2 AND x1 <> x3 AND x1 <> x4 AND x1 <> x5 AND
                 x2 <> x3 AND x2 <> x4 AND x2 <> x5 AND x3 <> x4 AND
                 x3 <> x5 AND x4 <> x5 THEN
             'V10-HANG2-abcdeedcba'
            WHEN x1 <> x2 AND x2 = x3 AND x2 = x4 AND x1 = x5 AND x1 = x6 AND
                 x2 = x7 AND x2 = x8 AND x2 = x9 AND x1 = x10 THEN
             'V10-HANG2-abbbaabbba'
            WHEN x1 = x2 AND x1 <> x3 AND x1 = x4 AND x1 = x5 AND x1 = x6 AND
                 x1 = x7 AND x3 = x8 AND x1 = x9 AND x1 = x10 THEN
             'V10-HANG2-aabaaaabaa'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x5 = x4 + 1 AND
                 x6 = x4 + 2 AND x7 = x4 + 3 AND x8 = x4 + 4 AND x9 = x4 + 5 AND
                 x10 = x4 + 6 THEN
             'V10-HANG2-aaaa(a+1)(a+2)(a+3)(a+4)(a+5)(a+6)'
            WHEN x2 = x1 + 1 AND x3 = x1 + 2 AND x4 = x1 + 3 AND x5 = x1 + 4 AND
                 x6 = x1 + 5 AND x7 = x1 + 6 AND x8 = x1 AND x9 = x1 AND
                 x10 = x1 THEN
             'V10-HANG2-a(a+1)(a+2)(a+3)(a+4)(a+5)(a+6)aaa'
            WHEN x1 = x2 AND x1 = x3 AND x1 <> x4 AND x5 = x4 + 1 AND
                 x6 = x4 + 2 AND x7 = x4 + 3 AND x8 = x4 + 4 AND x9 = x4 + 5 AND
                 x10 = x4 + 6 THEN
             'V10-HANG2-aaab(b+1)(b+2)(b+3)(b+4)(b+5)(b+6)'
            WHEN x2 = x1 + 1 AND x3 = x1 + 2 AND x4 = x1 + 3 AND x5 = x1 + 4 AND
                 x6 = x1 + 5 AND x7 = x1 + 6 AND x8 <> x1 AND x9 = x8 AND
                 x10 = x8 THEN
             'V10-HANG2-a(a+1)(a+2)(a+3)(a+4)(a+5)(a+6)bbb'
            WHEN x1 = x4 AND x2 = x5 AND x3 = x6 AND x5 = x4 + 1 AND
                 x6 = x4 + 2 AND x7 = x4 + 3 AND x8 = x4 + 4 AND x9 = x4 + 5 AND
                 x10 = x4 + 6 THEN
             'V10-HANG2-a(a+1)(a+2)a(a+1)(a+2)(a+3)(a+4)(a+5)(a+6)'
            WHEN x1 = x8 AND x2 = x9 AND x3 = x10 AND x2 = x1 + 1 AND
                 x3 = x1 + 2 AND x4 = x1 + 3 AND x5 = x1 + 4 AND x6 = x1 + 5 AND
                 x7 = x1 + 6 THEN
             'V10-HANG2-a(a+1)(a+2)(a+3)(a+4)(a+5)(a+6)a(a+1)(a+2)'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 = x5 AND x6 = x5 + 1 AND
                 x7 = x5 + 2 AND x8 = x5 + 3 AND x9 = x5 + 4 AND
                 x10 = x5 + 5 THEN
             'V10-HANG2-aaaaa(a+1)(a+2)(a+3)(a+4)(a+5)'
            WHEN x1 = x7 AND x1 = x8 AND x1 = x9 AND x1 = x10 AND
                 x2 = x1 + 1 AND x3 = x1 + 2 AND x4 = x1 + 3 AND x5 = x1 + 4 AND
                 x6 = x1 + 5 THEN
             'V10-HANG2-a(a+1)(a+2)(a+3)(a+4)(a+5)aaaa'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 <> x5 AND
                 x6 = x5 + 1 AND x7 = x5 + 2 AND x8 = x5 + 3 AND x9 = x5 + 4 AND
                 x10 = x5 + 5 THEN
             'V10-HANG2-aaaab(b+1)(b+2)(b+3)(b+4)(b+5)'
            WHEN x7 = x8 AND x7 = x9 AND x7 = x10 AND x1 <> x7 AND
                 x2 = x1 + 1 AND x3 = x1 + 2 AND x4 = x1 + 3 AND x5 = x1 + 4 AND
                 x6 = x1 + 5 THEN
             'V10-HANG2-a(a+1)(a+2)(a+3)(a+4)(a+5)bbbb'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 = x5 AND x1 = x6 AND
                 x7 = x1 + 1 AND x8 = x1 + 2 AND x1 = x6 + 3 AND
                 x10 = x1 + 4 THEN
             'V10-HANG2-aaaaaa(a+1)(a+2)(a+3)(a+4)'
            WHEN x1 = x6 AND x1 = x7 AND x1 = x8 AND x1 = x9 AND x1 = x10 AND
                 x2 = x1 + 1 AND x3 = x1 + 2 AND x4 = x1 + 3 AND x5 = x1 + 4 THEN
             'V10-HANG2-a(a+1)(a+2)(a+3)(a+4)aaaaa'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 = x5 AND x1 <> x6 AND
                 x7 = x6 + 1 AND x8 = x6 + 2 AND x9 = x6 + 3 AND
                 x10 = x6 + 4 THEN
             'V10-HANG2-aaaaab(b+1)(b+2)(b+3)(b+4)'
            WHEN x1 <> x6 AND x6 = x7 AND x6 = x8 AND x6 = x9 AND x6 = x10 AND
                 x2 = x1 + 1 AND x3 = x1 + 2 AND x4 = x1 + 3 AND x5 = x1 + 4 THEN
             'V10-HANG2-a(a+1)(a+2)(a+3)(a+4)bbbbb'
            WHEN x1 <> x6 AND x7 = x6 + 1 AND x8 = x6 + 2 AND x9 = x6 + 3 AND
                 x10 = x6 + 4 AND x2 = x1 + 1 AND x3 = x1 + 2 AND
                 x4 = x1 + 3 AND x5 = x1 + 4 THEN
             'V10-HANG2-a(a+1)(a+2)(a+3)(a+4)b(b+1)(b+2)(b+3)(b+4)'
            WHEN x1 = x2 AND x1 = x3 AND x1 <> x4 AND x4 = x5 AND x4 = x6 AND
                 x4 = x7 AND x4 = x8 AND x4 = x9 AND x4 = x10 THEN
             'V10-HANG2-aaabbbbbbb'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 <> x5 AND x5 = x6 AND
                 x5 = x7 AND x5 = x8 AND x5 = x9 AND x5 = x10 THEN
             'V10-HANG2-aaaabbbbbb'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 = x5 AND x1 <> x6 AND
                 x6 = x7 AND x6 = x8 AND x6 = x9 AND x6 = x10 THEN
             'V10-HANG2-aaaaabbbbb'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 = x5 AND x1 = x6 AND
                 x1 <> x7 AND x7 = x8 AND x7 = x9 AND x7 = x10 THEN
             'V10-HANG2-aaaaaabbbb'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 = x5 AND x1 = x6 AND
                 x1 = x7 AND x1 <> x8 AND x8 = x9 AND x8 = x10 THEN
             'V10-HANG2-aaaaaaabbb'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 = x5 AND x1 = x6 AND
                 x1 = x7 AND x1 = x8 AND x1 <> x9 AND x9 = x10 THEN
             'V10-HANG2-aaaaaaaabb'
            WHEN x1 = x2 AND x1 = x3 AND x1 = x4 AND x1 = x5 AND x1 = x6 AND
                 x1 = x7 AND x1 = x8 AND x1 = x9 AND x1 <> x10 THEN
             'V10-HANG2-aaaaaaaaab'
            WHEN x2 = x3 AND x2 = x4 AND x2 = x5 AND x2 = x6 AND x2 = x7 AND
                 x2 = x8 AND x2 = x9 AND x2 = x10 THEN
             'V9-HANG1-aaaaaaaaa'
            WHEN x3 = x2 + 1 AND x4 = x2 + 2 AND x5 = x2 + 3 AND x6 = x2 + 4 AND
                 x7 = x2 + 5 AND x8 = x2 + 6 AND x9 = x2 + 7 AND
                 x10 = x2 + 8 THEN
             'V9-HANG1-a(a+1)…(a+6)(a+7)(a+8)'
            WHEN substr(so_dep + 1e10, -9, 9) = '393939393' THEN
             'V9-HANG1-393939393'
            WHEN substr(so_dep + 1e10, -9, 9) = '797979797' THEN
             'V9-HANG1-797979797'
            WHEN substr(so_dep + 1e10, -9, 9) = '397939793' THEN
             'V9-HANG1-397939793'
            WHEN substr(so_dep + 1e10, -9, 9) = '793979397' THEN
             'V9-HANG1-793979397'
            WHEN substr(so_dep + 1e10, -9, 9) = '383838383' THEN
             'V9-HANG1-383838383'
            WHEN substr(so_dep + 1e10, -9, 9) = '787878787' THEN
             'V9-HANG1-787878787'
            WHEN x2 = x3 AND x2 = x4 AND x2 = x5 AND x2 <> x6 AND x2 = x7 AND
                 x2 = x8 AND x2 = x9 AND x2 = x10 THEN
             'V9-HANG2-aaaabaaaa'
            WHEN x2 = x3 AND x2 = x4 AND x2 <> x5 AND x5 = x6 AND x5 = x7 AND
                 x2 = x8 AND x2 = x9 AND x2 = x10 THEN
             'V9-HANG2-aaabbbaaa'
            WHEN x2 = x3 AND x2 = x4 AND x2 <> x5 AND x5 = x6 AND x5 = x7 AND
                 x5 <> x8 AND x8 = x9 AND x8 = x10 THEN
             'V9-HANG2-aaabbbccc'
            WHEN x2 = x5 AND x2 = x8 AND x2 <> x3 AND x3 = x6 AND x3 = x9 AND
                 x3 <> x4 AND x4 = x7 AND x4 = x10 THEN
             'V9-HANG2-abcabcabc'
            WHEN x2 = x3 AND x2 = x5 AND x2 = x6 AND x2 = x8 AND x2 = x9 AND
                 x2 = x8 AND x2 = x9 AND x2 <> x4 AND x4 = x7 AND x7 = x10 THEN
             'V9-HANG2-aabaabaab'
            WHEN x2 = x5 AND x2 = x8 AND x2 <> x3 AND x3 = x4 AND x3 = x6 AND
                 x3 = x7 AND x3 = x9 AND x3 = x10 THEN
             'V9-HANG2-abbabbabb'
            WHEN x2 = x4 AND x2 = x5 AND x2 = x7 AND x2 = x8 AND x2 = x10 AND
                 x2 <> x3 AND x3 = x6 AND x3 = x9 THEN
             'V9-HANG2-abaabaaba'
            WHEN x2 = x4 AND x2 = x6 AND x2 = x8 AND x2 = x10 AND x2 <> x3 AND
                 x3 = x5 AND x3 = x7 AND x3 = x9 THEN
             'V9-HANG2-ababababa'
            WHEN x2 = x3 AND x2 = x6 AND x2 = x7 AND x2 = x10 AND x2 <> x4 AND
                 x4 = x5 AND x4 = x8 AND x4 = x9 THEN
             'V9-HANG2-aabbaabba'
            WHEN x2 = x3 AND x2 = x9 AND x2 = x10 AND x2 <> x4 AND x4 = x5 AND
                 x4 = x6 AND x4 = x7 AND x4 = x8 THEN
             'V9-HANG2-aabbbbbaa'
            WHEN x2 = x4 AND x2 = x5 AND x2 = x6 AND x2 = x7 AND x2 = x8 AND
                 x2 = x10 AND x2 <> x3 AND x3 = x9 THEN
             'V9-HANG2-abaaaaaba'
            WHEN x2 = x10 AND x2 <> x3 AND x3 = x4 AND x3 = x5 AND x3 = x6 AND
                 x3 = x7 AND x3 = x8 AND x3 = x9 THEN
             'V9-HANG2-abbbbbbba'
            WHEN x2 = x3 AND x2 = x4 AND x2 = x5 AND x6 = x2 + 1 AND
                 x7 = x2 + 2 AND x8 = x2 + 3 AND x9 = x2 + 4 AND
                 x10 = x2 + 5 THEN
             'V9-HANG2-aaaa(a+1)(a+2)(a+3)(a+4)(a+5)'
            WHEN x2 = x3 AND x2 = x4 AND x2 <> x5 AND x6 = x5 + 1 AND
                 x7 = x5 + 2 AND x8 = x5 + 3 AND x9 = x5 + 4 AND
                 x10 = x5 + 5 THEN
             'V9-HANG2-aaab(b+1)(b+2)(b+3)(b+4)(b+5)'
            WHEN x3 = x2 + 1 AND x4 = x2 + 2 AND x5 = x2 AND x6 = x2 + 1 AND
                 x7 = x2 + 2 AND x8 = x2 + 3 AND x9 = x2 + 4 AND
                 x10 = x2 + 5 THEN
             'V9-HANG2-a(a+1)(a+2)a(a+1)(a+2)(a+3)(a+4)(a+5)'
            WHEN x3 = x2 + 1 AND x4 = x2 + 2 AND x5 = x2 + 3 AND x6 = x2 + 4 AND
                 x7 = x2 + 5 AND x8 = x2 AND x9 = x2 AND x10 = x2 THEN
             'V9-HANG2-a(a+1)(a+2)(a+3)(a+4)(a+5)aaa'
            WHEN x3 = x2 + 1 AND x4 = x2 + 2 AND x5 = x2 + 3 AND x6 = x2 + 4 AND
                 x7 = x2 + 5 AND x8 = x2 AND x9 = x3 AND x10 = x4 THEN
             'V9-HANG2-a(a+1)(a+2)(a+3)(a+4)(a+5)a(a+1)(a+2)'
            WHEN x2 = x3 AND x2 = x4 AND x2 = x5 AND x6 = x2 AND x7 = x2 + 1 AND
                 x8 = x2 + 2 AND x9 = x2 + 3 AND x10 = x2 + 4 THEN
             'V9-HANG2-aaaaa(a+1)(a+2)(a+3)(a+4)'
            WHEN x2 = x3 AND x2 = x4 AND x2 = x5 AND x6 <> x2 AND
                 x7 = x6 + 1 AND x8 = x6 + 2 AND x9 = x6 + 3 AND
                 x10 = x6 + 4 THEN
             'V9-HANG2-aaaab(b+1)(b+2)(b+3)(b+4)'
            WHEN x3 = x2 + 1 AND x4 = x2 + 2 AND x5 = x2 + 3 AND x6 = x2 + 4 AND
                 x7 = x2 AND x8 = x2 AND x9 = x2 AND x10 = x2 THEN
             'V9-HANG2-a(a+1)(a+2)(a+3)(a+4)aaaa'
            WHEN x3 = x2 + 1 AND x4 = x2 + 2 AND x5 = x2 + 3 AND x6 = x2 + 4 AND
                 x7 <> x2 AND x8 = x7 AND x9 = x7 AND x10 = x7 THEN
             'V9-HANG2-a(a+1)(a+2)(a+3)(a+4)bbbb'
            WHEN x2 = x3 AND x2 = x4 AND x2 <> x5 AND x5 = x6 AND x5 = x7 AND
                 x5 = x8 AND x5 = x9 AND x5 = x10 THEN
             'V9-HANG2-aaabbbbbb'
            WHEN x2 = x3 AND x2 = x4 AND x2 = x5 AND x2 <> x6 AND x6 = x7 AND
                 x6 = x8 AND x6 = x9 AND x6 = x10 THEN
             'V9-HANG2-aaaabbbbb'
            WHEN x2 = x3 AND x2 = x4 AND x2 = x5 AND x2 = x6 AND x2 <> x7 AND
                 x7 = x8 AND x7 = x9 AND x7 = x10 THEN
             'V9-HANG2-aaaaabbbb'
            WHEN x2 = x3 AND x2 = x4 AND x2 = x5 AND x2 = x6 AND x2 = x7 AND
                 x2 <> x8 AND x8 = x9 AND x8 = x10 THEN
             'V9-HANG2-aaaaaabbb'
            WHEN x2 = x3 AND x2 = x4 AND x2 = x5 AND x2 = x6 AND x2 = x7 AND
                 x2 = x8 AND x2 <> x9 AND x9 = x10 THEN
             'V9-HANG2-aaaaaaabb'
            WHEN x2 = x3 AND x2 = x4 AND x2 = x5 AND x2 = x6 AND x2 = x7 AND
                 x2 = x8 AND x2 = x9 AND x2 <> x10 THEN
             'V9-HANG2-aaaaaaaab'
            WHEN x1 = 0 AND x3 = x3 AND x3 = x4 AND x3 = x5 AND x3 = x6 AND
                 x3 = x7 AND x3 = x8 AND x3 = x9 AND x3 = x10 THEN
             'V8-HANG1-aaaaaaaa'
            WHEN x4 = x3 + 1 AND x5 = x3 + 2 AND x6 = x3 + 3 AND x7 = x3 + 4 AND
                 x8 = x3 + 5 AND x9 = x3 + 6 AND x10 = x3 + 7 THEN
             'V8-HANG1-a(a+1)…(a+6)(a+7)'
            WHEN substr(so_dep + 1e10, -8, 8) = '39793979' THEN
             'V8-HANG1-39793979'
            WHEN substr(so_dep + 1e10, -8, 8) = '39793979' THEN
             'V8-HANG1-39793979'
            WHEN substr(so_dep + 1e10, -8, 8) = '79397939' THEN
             'V8-HANG1-79397939'
            WHEN substr(so_dep + 1e10, -8, 8) = '79397939' THEN
             'V8-HANG1-79397939'
            WHEN substr(so_dep + 1e10, -8, 8) = '39393939' THEN
             'V8-HANG1-39393939'
            WHEN substr(so_dep + 1e10, -8, 8) = '79797979' THEN
             'V8-HANG1-79797979'
            WHEN substr(so_dep + 1e10, -8, 8) = '38783878' THEN
             'V8-HANG1-38783878'
            WHEN substr(so_dep + 1e10, -8, 8) = '38783878' THEN
             'V8-HANG1-38783878'
            WHEN substr(so_dep + 1e10, -8, 8) = '78387838' THEN
             'V8-HANG1-78387838'
            WHEN substr(so_dep + 1e10, -8, 8) = '78387838' THEN
             'V8-HANG1-78387838'
            WHEN substr(so_dep + 1e10, -8, 8) = '38383838' THEN
             'V8-HANG1-38383838'
            WHEN substr(so_dep + 1e10, -8, 8) = '39397979' THEN
             'V8-HANG1-39397979'
            WHEN substr(so_dep + 1e10, -8, 8) = '79793939' THEN
             'V8-HANG1-79793939'
            WHEN x3 = x7 AND x4 = x8 AND x5 = x9 AND x6 = x10 AND x3 <> x4 AND
                 x3 <> x5 AND x3 <> x6 AND x4 <> x5 AND x4 <> x6 AND
                 x5 <> x6 THEN
             'V8-HANG2-abcdabcd'
            WHEN x3 = x10 AND x4 = x9 AND x5 = x8 AND x6 = x7 AND x3 <> x4 AND
                 x3 <> x5 AND x3 <> x6 AND x4 <> x5 AND x4 <> x6 AND
                 x5 <> x6 THEN
             'V8-HANG2-abcddcba'
            WHEN x3 = x6 AND x3 = x7 AND x3 = x10 AND x3 <> x4 AND x4 = x5 AND
                 x4 = x8 AND x4 = x9 THEN
             'V8-HANG2-abbaabba'
            WHEN x3 = x4 AND x3 = x7 AND x3 = x8 AND x3 <> x5 AND x5 = x6 AND
                 x5 = x9 AND x5 = x10 THEN
             'V8-HANG2-aabbaabb'
            WHEN x3 = x5 AND x3 = x7 AND x3 = x9 AND x3 <> x4 AND x3 <> x6 AND
                 x4 = x8 AND x4 <> x5 AND x5 = x9 AND x6 = x10 THEN
             'V8-HANG2-abacabac'
            WHEN x3 = x4 AND x3 = x5 AND x3 = x8 AND x3 = x9 AND x3 = x10 AND
                 x3 <> x6 AND x6 = x7 THEN
             'V8-HANG2-aaabbaaa'
            WHEN x3 = x4 AND x3 <> x5 AND x3 <> x7 AND x3 <> x9 AND x5 = x6 AND
                 x5 <> x7 AND x5 <> x9 AND x7 = x8 AND x7 <> x9 AND x9 = x10 THEN
             'V8-HANG2-aabbccdd'
            WHEN x3 = x5 AND x3 = x7 AND x3 = x9 AND x3 <> x4 AND x4 = x6 AND
                 x4 = x8 AND x4 = x10 THEN
             'V8-HANG2-abababab'
            WHEN x3 = x4 AND x3 = x9 AND x3 = x10 AND x3 <> x5 AND x5 = x6 AND
                 x5 = x7 AND x5 = x8 THEN
             'V8-HANG2-aabbbbaa'
            WHEN x3 = x5 AND x3 = x8 AND x3 = x10 AND x3 <> x4 AND x4 = x6 AND
                 x4 = x7 AND x4 = x9 THEN
             'V8-HANG2-ababbaba'
            WHEN x3 = x10 AND x3 <> x4 AND x4 = x5 AND x4 = x6 AND x4 = x7 AND
                 x4 = x8 AND x4 = x9 THEN
             'V8-HANG2-abbbbbba'
            WHEN x3 = x4 AND x3 = x5 AND x3 = x6 AND x7 = x3 + 1 AND
                 x8 = x3 + 2 AND x9 = x3 + 3 AND x10 = x3 + 4 THEN
             'V8-HANG2-aaaa(a+1)(a+2)(a+3)(a+4)'
            WHEN x3 = x4 AND x3 = x5 AND x3 <> x6 AND x7 = x6 + 1 AND
                 x8 = x6 + 2 AND x9 = x6 + 3 AND x10 = x6 + 4 THEN
             'V8-HANG2-aaab(b+1)(b+2)(b+3)(b+4)'
            WHEN x3 = x4 AND x4 = x3 + 1 AND x5 = x3 + 2 AND x3 = x6 AND
                 x3 = x7 AND x3 = x8 AND x3 = x9 AND x3 = x10 THEN
             'V8-HANG2-a(a+1)(a+2)aaaaa'
            WHEN x3 = x4 AND x4 = x3 + 1 AND x5 = x3 + 2 AND x3 <> x6 AND
                 x6 = x7 AND x6 = x8 AND x6 = x9 AND x6 = x10 THEN
             'V8-HANG2-a(a+1)(a+2)bbbbb'
            WHEN x3 = x4 AND x4 = x3 + 1 AND x5 = x3 + 2 AND x3 <> x6 AND
                 x7 = x6 + 1 AND x8 = x6 + 2 AND x9 = x6 + 3 AND
                 x10 = x6 + 4 THEN
             'V8-HANG2-a(a+1)(a+2)a(a+1)(a+2)(a+3)(a+4)'
            WHEN x3 = x4 AND x4 = x3 + 1 AND x5 = x3 + 2 AND x6 = x3 + 3 AND
                 x7 = x3 + 4 AND x8 = x3 AND x9 = x8 + 1 AND x10 = x8 + 2 THEN
             'V8-HANG2-a(a+1)(a+2)(a+3)(a+4)a(a+1)(a+2)'
            WHEN x3 = x4 AND x3 = x5 AND x3 <> x6 AND x6 = x7 AND x6 = x8 AND
                 x6 = x9 AND x6 = x10 THEN
             'V8-HANG2-aaabbbbb'
            WHEN x3 = x4 AND x3 = x5 AND x3 = x6 AND x3 <> x7 AND x7 = x8 AND
                 x7 = x9 AND x7 = x10 THEN
             'V8-HANG2-aaaabbbb'
            WHEN x3 = x4 AND x3 = x5 AND x3 = x6 AND x3 = x7 AND x7 <> x8 AND
                 x8 = x9 AND x8 = x10 THEN
             'V8-HANG2-aaaaabbb'
            WHEN x3 = x4 AND x3 = x5 AND x3 = x6 AND x3 = x7 AND x3 = x8 AND
                 x3 <> x9 AND x9 = x10 THEN
             'V8-HANG2-aaaaaabb'
            WHEN x3 = x4 AND x3 = x5 AND x3 = x6 AND x3 = x7 AND x3 = x8 AND
                 x3 = x9 AND x9 <> x10 THEN
             'V8-HANG2-aaaaaaab'
            WHEN x4 = x5 AND x4 = x6 AND x4 = x7 AND x4 = x8 AND x4 = x9 AND
                 x4 = x10 THEN
             'V7-HANG1-aaaaaaa'
            WHEN x5 = x4 + 1 AND x6 = x4 + 2 AND x7 = x4 + 3 AND x8 = x4 + 4 AND
                 x9 = x4 + 5 AND x10 = x4 + 6 THEN
             'V7-HANG1-a(a+1)…(a+6)'
            WHEN substr(so_dep + 1e10, -7, 7) = '3939393' THEN
             'V7-HANG1-3939393'
            WHEN substr(so_dep + 1e10, -7, 7) = '7979797' THEN
             'V7-HANG1-7979797'
            WHEN substr(so_dep + 1e10, -7, 7) = '3838383' THEN
             'V7-HANG1-3838383'
            WHEN substr(so_dep + 1e10, -7, 7) = '7878787' THEN
             'V7-HANG1-7878787'
            WHEN x4 = x5 AND x4 = x6 AND x4 = x7 AND x4 = x9 AND x4 = x10 AND
                 x4 <> x6 AND x6 = x8 THEN
             'V7-HANG2-aababaa'
            WHEN x4 = x6 AND x4 = x8 AND x4 = x10 AND x4 <> x5 AND x5 = x7 AND
                 x5 = x9 THEN
             'V7-HANG2-abababa'
            WHEN x4 = x5 AND x4 = x9 AND x4 = x10 AND x4 <> x6 AND x6 = x7 AND
                 x6 = x8 THEN
             'V7-HANG2-aabbbaa'
            WHEN x4 = x10 AND x4 <> x5 AND x5 = x6 AND x5 = x7 AND x5 = x8 AND
                 x5 = x9 THEN
             'V7-HANG2-abbbbba'
            WHEN x4 = x5 AND x4 = x6 AND x4 = x7 AND x8 = x4 + 1 AND
                 x9 = x4 + 2 AND x10 = x4 + 3 THEN
             'V7-HANG2-aaaa(a+1)(a+2)(a+3)'
            WHEN x4 = x5 AND x4 = x6 AND x4 <> x7 AND x8 = x7 + 1 AND
                 x9 = x7 + 2 AND x10 = x7 + 3 THEN
             'V7-HANG2-aaab(b+1)(b+2)(b+3)'
            WHEN x5 = x4 + 1 AND x6 = x4 + 2 AND x7 = x4 AND x8 = x4 AND
                 x9 = x4 AND x10 = x4 THEN
             'V7-HANG2-a(a+1)(a+2)aaaa'
            WHEN x5 = x4 + 1 AND x6 = x4 + 2 AND x7 <> x4 AND x8 = x7 AND
                 x9 = x7 AND x10 = x7 THEN
             'V7-HANG2-a(a+1)(a+2)bbbb'
            WHEN x4 = x5 AND x4 = x6 AND x4 = x7 AND x4 = x8 AND x9 = x4 + 1 AND
                 x10 = x4 + 2 THEN
             'V7-HANG2-aaaaa(a+1)(a+2)'
            WHEN x4 = x5 AND x4 = x6 AND x4 = x7 AND x4 <> x8 AND
                 x9 = x8 + 1 AND x10 = x8 + 2 THEN
             'V7-HANG2-aaaab(b+1)(b+2)'
            WHEN x5 = x4 + 1 AND x6 = x4 + 2 AND x7 = x4 + 3 AND x8 = x4 AND
                 x9 = x4 AND x10 = x4 THEN
             'V7-HANG2-a(a+1)(a+2)(a+3)aaa'
            WHEN x5 = x4 + 1 AND x6 = x4 + 2 AND x7 = x4 + 3 AND x8 <> x4 AND
                 x9 = x8 AND x10 = x8 THEN
             'V7-HANG2-a(a+1)(a+2)(a+3)bbb'
            WHEN x5 = x4 + 1 AND x6 = x4 + 2 AND x7 = x4 AND x8 = x4 + 1 AND
                 x9 = x4 + 2 AND x10 = x4 + 3 THEN
             'V7-HANG2-a(a+1)(a+2)a(a+1)(a+2)(a+3)'
            WHEN x5 = x4 + 1 AND x6 = x4 + 2 AND x7 = x4 + 3 AND x8 = x4 AND
                 x9 = x4 + 1 AND x10 = x4 + 2 THEN
             'V7-HANG2-a(a+1)(a+2)(a+3)a(a+1)(a+2)'
            WHEN x4 = x5 AND x4 <> x6 AND x7 = x6 AND x8 = x6 AND x9 = x6 AND
                 x10 = x6 THEN
             'V7-HANG2-aabbbbb'
            WHEN x4 = x5 AND x4 = x6 AND x4 <> x7 AND x8 = x7 AND x9 = x7 AND
                 x10 = x7 THEN
             'V7-HANG2-aaabbbb'
            WHEN x4 = x5 AND x4 = x6 AND x4 = x7 AND x4 <> x8 AND x9 = x8 AND
                 x10 = x8 THEN
             'V7-HANG2-aaaabbb'
            WHEN x4 = x5 AND x4 = x6 AND x4 = x7 AND x4 = x8 AND x4 <> x9 AND
                 x10 = x9 THEN
             'V7-HANG2-aaaaabb'
            WHEN x4 = x5 AND x4 = x6 AND x4 = x7 AND x4 = x8 AND x4 = x9 AND
                 x10 <> x4 THEN
             'V7-HANG2-aaaaaab'
            WHEN x5 = x6 AND x5 = x7 AND x5 = x8 AND x5 = x9 AND x5 = x10 THEN
             'V6-HANG1-aaaaaa'
            WHEN x6 = x5 + 1 AND x7 = x5 + 2 AND x8 = x5 + 3 AND x9 = x5 + 4 AND
                 x10 = x5 + 5 THEN
             'V6-HANG1-a(a+1)…(a+5)'
            WHEN substr(so_dep + 1e10, -6, 6) = '393939' THEN
             'V6-HANG1-393939'
            WHEN substr(so_dep + 1e10, -6, 6) = '797979' THEN
             'V6-HANG1-797979'
            WHEN substr(so_dep + 1e10, -6, 6) = '383838' THEN
             'V6-HANG1-383838'
            WHEN substr(so_dep + 1e10, -6, 6) = '787878' THEN
             'V6-HANG1-787878'
            WHEN substr(so_dep + 1e10, -6, 6) = '397979' THEN
             'V6-HANG1-397979'
            WHEN substr(so_dep + 1e10, -6, 6) = '393979' THEN
             'V6-HANG1-393979'
            WHEN substr(so_dep + 1e10, -6, 6) = '793939' THEN
             'V6-HANG1-793939'
            WHEN substr(so_dep + 1e10, -6, 6) = '797939' THEN
             'V6-HANG1-797939'
            WHEN x5 = x7 AND x5 = x8 AND x5 = x10 AND x5 <> x6 AND x6 = x9 THEN
             'V6-HANG2-abaaba'
            WHEN x5 = x8 AND x5 <> x6 AND x6 = x7 AND x6 = x9 AND x6 = x10 THEN
             'V6-HANG2-abbabb'
            WHEN x5 = x6 AND x5 = x8 AND x5 = x9 AND x5 <> x7 AND x7 = x10 THEN
             'V6-HANG2-aabaab'
            WHEN x5 = x6 AND x5 = x9 AND x5 = x10 AND x5 <> x7 AND x7 = x8 THEN
             'V6-HANG2-aabbaa'
            WHEN x5 = x10 AND x5 <> x6 AND x6 = x7 AND x6 = x8 AND x6 = x9 AND
                 x6 = x10 THEN
             'V6-HANG2-abbbba'
            WHEN x5 = x6 AND x5 <> x7 AND x5 <> x9 AND x7 = x8 AND x8 <> x9 AND
                 x9 = x10 THEN
             'V6-HANG2-aabbcc'
            WHEN x5 = x7 AND x5 = x9 AND x5 <> x6 AND x6 = x8 AND x6 = x10 THEN
             'V6-HANG2-ababab'
            WHEN x5 = x6 AND x5 = x7 AND x5 = x8 AND x9 = x5 + 1 AND
                 x10 = x5 + 2 THEN
             'V6-HANG2-aaaa(a+1)(a+2)'
            WHEN x5 = x6 AND x5 = x7 AND x5 <> x8 AND x9 = x8 + 1 AND
                 x10 = x8 + 2 THEN
             'V6-HANG2-aaab(b+1)(b+2)'
            WHEN x6 = x5 + 1 AND x7 = x5 + 2 AND x5 <> x8 AND x9 = x8 AND
                 x10 = x8 THEN
             'V6-HANG2-a(a+1)(a+2)bbb'
            WHEN x6 = x5 + 1 AND x7 = x5 + 2 AND x5 <> x8 AND x9 = x5 AND
                 x10 = x5 THEN
             'V6-HANG2-a(a+1)(a+2)aaa'
            WHEN x5 = x6 AND x5 <> x7 AND x8 = x7 AND x9 = x7 AND x10 = x7 THEN
             'V6-HANG2-aabbbb'
            WHEN x5 = x6 AND x5 = x7 AND x5 <> x8 AND x9 = x8 AND x10 = x8 THEN
             'V6-HANG2-aaabbb'
            WHEN x5 = x6 AND x5 = x7 AND x5 = x8 AND x5 <> x9 AND x9 = x10 THEN
             'V6-HANG2-aaaabb'
            WHEN x5 = x6 AND x5 = x7 AND x5 = x8 AND x5 = x9 AND x5 <> x10 THEN
             'V6-HANG2-aaaaab'
            WHEN x6 = x7 AND x6 = x8 AND x6 = x9 AND x6 = x10 THEN
             'V5-HANG1-aaaaa'
            WHEN x7 = x6 + 1 AND x8 = x6 + 2 AND x9 = x6 + 3 AND
                 x10 = x6 + 4 THEN
             'V5-HANG1-a(a+1)…(a+4)'
            WHEN x7 = x6 + 2 AND x8 = x6 + 4 AND x9 = x6 + 6 AND
                 x10 = x6 + 8 THEN
             'V5-HANG1-a(a+2)(a+4)(a+6)(a+8)'
            WHEN substr(so_dep + 1e10, -5, 5) = '39393' THEN
             'V5-HANG1-39393'
            WHEN substr(so_dep + 1e10, -5, 5) = '79797' THEN
             'V5-HANG1-79797'
            WHEN substr(so_dep + 1e10, -5, 5) = '38383' THEN
             'V5-HANG1-38383'
            WHEN substr(so_dep + 1e10, -5, 5) = '78787' THEN
             'V5-HANG1-78787'
            WHEN x6 = x10 AND x6 <> x7 AND x7 = x9 AND x6 <> x8 AND x7 <> x8 THEN
             'V5-HANG2-abcba'
            WHEN x6 = x8 AND x6 = x10 AND x6 <> x7 AND x7 = x9 THEN
             'V5-HANG2-ababa'
            WHEN x6 = x7 AND x6 = x9 AND x6 = x10 AND x6 <> x8 THEN
             'V5-HANG2-aabaa'
            WHEN x6 = x10 AND x7 = x8 AND x7 = x9 THEN
             'V5-HANG2-abbba'
            WHEN x7 = x8 AND x7 = x9 AND x7 = x10 THEN
             'V4-HANG1-aaaa'
            WHEN x8 = x7 + 1 AND x9 = x7 + 2 AND x10 = x7 + 3 THEN
             'V4-HANG1-a(a+1)…(a+3)'
            WHEN x8 = x7 + 2 AND x9 = x7 + 4 AND x10 = x7 + 6 THEN
             'V4-HANG1-a(a+2)(a+4)(a+6)'
            WHEN substr(so_dep + 1e10, -4, 4) = '3878' THEN
             'V4-HANG1-3878'
            WHEN substr(so_dep + 1e10, -4, 4) = '3979' THEN
             'V4-HANG1-3979'
            WHEN substr(so_dep + 1e10, -4, 4) = '3939' THEN
             'V4-HANG1-3939'
            WHEN substr(so_dep + 1e10, -4, 4) = '3838' THEN
             'V4-HANG1-3838'
            WHEN x7 = x8 AND x7 <> x9 AND x9 = x10 THEN
             'V4-HANG2-aabb'
            WHEN x7 = x9 AND x7 <> x8 AND x8 = x10 THEN
             'V4-HANG2-abab'
            WHEN x7 = x10 AND x7 <> x8 AND x8 = x9 THEN
             'V4-HANG2-abba'
            WHEN x8 = x9 AND x8 = x10 THEN
             'V3-HANG1-aaa'
            WHEN x9 = x8 + 1 AND x10 = x8 + 2 THEN
             'V3-HANG1-a(a+1)(a+2)'
            WHEN x9 = x8 + 2 AND x10 = x8 + 4 THEN
             'V3-HANG1-a(a+2)(a+4)'
            WHEN x8 = x10 AND x8 <> x9 THEN
             'V3-HANG2-aba'
          
            ELSE
             NULL
          END;

  RETURN to_char(loai);
  -- RETURN to_char(tksd);
END tksd_v10;
