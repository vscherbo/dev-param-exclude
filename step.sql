-- Function: devmod.step(integer, integer, integer)

-- DROP FUNCTION devmod.step(integer, integer, integer);

CREATE OR REPLACE FUNCTION devmod.step(
    inp_dev_id integer,
    inp_param_num integer,
    inp_version_num integer)
  RETURNS integer AS
$BODY$DECLARE
  i INTEGER;
  cnt_mult INTEGER = 1;
BEGIN
  IF ( 1 = inp_param_num ) THEN
     RETURN 1;
  ELSE
     FOR i IN 1..inp_param_num-1 LOOP
       cnt_mult := cnt_mult*devmod.cnt(inp_dev_id, i, inp_version_num);
     END LOOP;
     -- useless, i.e. step[1] always eq 1
     -- cnt_mult := cnt_mult * step(inp_dev_id, 1);
     RETURN cnt_mult;
  END IF;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION devmod.step(integer, integer, integer)
  OWNER TO arc_energo;
