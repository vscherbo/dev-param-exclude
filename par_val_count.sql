-- Function: devmod.par_val_count(integer, integer, integer)

-- DROP FUNCTION devmod.par_val_count(integer, integer, integer);

CREATE OR REPLACE FUNCTION devmod.par_val_count(
    inp_dev_id integer,
    inp_dev_param_id integer,
    inp_version_num integer)
  RETURNS integer AS
$BODY$DECLARE
  cnt INTEGER;
BEGIN
    SELECT COUNT(*) INTO cnt 
        FROM devmod.param 
        WHERE 
            dev_id = inp_dev_id 
            AND version_num = inp_version_num
            AND dev_param_id = inp_dev_param_id;
    RETURN cnt;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION devmod.par_val_count(integer, integer, integer)
  OWNER TO arc_energo;
