-- Function: devmod.par_order(integer, integer, integer, integer)

-- DROP FUNCTION devmod.par_order(integer, integer, integer, integer);

CREATE OR REPLACE FUNCTION devmod.par_order(
    inp_dev_id integer,
    inp_dev_param_id integer,
    inp_param_id integer,
    inp_version_num integer)
  RETURNS integer AS
$BODY$DECLARE
  cnt INTEGER;
BEGIN
    SELECT COUNT(*) INTO cnt FROM devmod.param 
    WHERE dev_id = inp_dev_id
    AND dev_param_id = inp_dev_param_id
    AND version_num = inp_version_num
    AND param_sort_order <= (SELECT param_sort_order FROM devmod.param 
                                                    WHERE dev_id = inp_dev_id 
                                                    AND version_num = inp_version_num
                                                    AND dev_param_id = inp_dev_param_id
                                                    AND param_id = inp_param_id
                           );
    RETURN cnt;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION devmod.par_order(integer, integer, integer, integer)
  OWNER TO arc_energo;
