-- Function: devmod.dev_param_id_by_i(integer, integer, integer)

-- DROP FUNCTION devmod.dev_param_id_by_i(integer, integer, integer);

CREATE OR REPLACE FUNCTION devmod.dev_param_id_by_i(
    inp_dev_id integer,
    inp_dev_param_i integer,
    inp_version_num integer)
  RETURNS integer AS
$BODY$ DECLARE
  ret_dev_param_id INTEGER;
BEGIN
  SELECT dev_param_id INTO ret_dev_param_id
  FROM devmod.dev_param
  WHERE dev_id=inp_dev_id
  AND version_num=inp_version_num
  ORDER BY dev_param_sort_order OFFSET inp_dev_param_i-1 LIMIT 1;

  RETURN ret_dev_param_id;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION devmod.dev_param_id_by_i(integer, integer, integer)
  OWNER TO arc_energo;
