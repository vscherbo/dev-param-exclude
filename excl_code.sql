-- Function: devmod.excl_code(integer, integer, integer, integer)

-- DROP FUNCTION devmod.excl_code(integer, integer, integer, integer);

CREATE OR REPLACE FUNCTION devmod.excl_code(
    inp_dev_id integer,
    inp_version_num integer,
    inp_dev_param_id integer,
    inp_param_id integer)
  RETURNS integer AS
$BODY$DECLARE
 res integer;
 step_i integer;
 j integer;
 i integer;
 Npp integer;
BEGIN
  Npp := devmod.dev_par_order(inp_dev_id, inp_dev_param_id, inp_version_num);
  step_i := devmod.step(inp_dev_id, Npp, inp_version_num);
  j := devmod.par_order(inp_dev_id, inp_dev_param_id, inp_param_id, inp_version_num);
  i := devmod.dev_par_order(inp_dev_id, inp_dev_param_id, inp_version_num);
  res := step_i * j + i-1 ;
  -- RAISE NOTICE 'Npp=%, step_i=%, j=%, i-1=%', Npp, step_i, j, i-1;
  RETURN res;  
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION devmod.excl_code(integer, integer, integer, integer)
  OWNER TO arc_energo;
