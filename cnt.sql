-- Function: devmod.cnt(integer, integer)

-- DROP FUNCTION devmod.cnt(integer, integer);

CREATE OR REPLACE FUNCTION devmod.cnt(dev_id integer, inp_param_num integer)
  RETURNS integer AS
$BODY$ DECLARE
  cnt INTEGER;
BEGIN
  RETURN devmod.par_val_count(dev_id, devmod.dev_param_id_by_i(dev_id, inp_param_num));
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION devmod.cnt(integer, integer)
  OWNER TO arc_energo;
