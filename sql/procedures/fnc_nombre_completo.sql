DROP FUNCTION IF EXISTS tdb_autos.fnc_nombre_completo;

DELIMITER //

CREATE FUNCTION tdb_autos.fnc_nombre_completo (i_cli_id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	
	DECLARE w_nombre VARCHAR(255) DEFAULT "";
	
	SELECT CASE cli_formato_nombre WHEN 1 THEN CONCAT(            -- Formato simple, nombre y apellido
	                                                  cli_p_nombre,
	                                                  " ",
	                                                  cli_s_nombre,
	                                                  " ",
	                                                  cli_p_apellido,
	                                                  " ",
	                                                  cli_s_apellido)
	                               WHEN 2 THEN cli_empresa_nombre -- Empresa
	                               WHEN 3 THEN CONCAT(            -- Formato casada
	                                                  cli_p_nombre,
	                                                  " ",
	                                                  cli_s_nombre,
	                                                  " ",
	                                                  cli_p_apellido,
	                                                  " ",
	                                                  cli_s_apellido,
	                                                  " de ",
	                                                  cli_apellido_casada)
	                               WHEN 4 THEN CONCAT(            -- Formato viuda
	                                                  cli_p_nombre,
	                                                  " ",
	                                                  cli_s_nombre,
	                                                  " ",
	                                                  cli_p_apellido,
	                                                  " ",
	                                                  cli_s_apellido,
	                                                  " Vda. de ",
	                                                  cli_apellido_casada)
	                               ELSE COALESCE(cli_p_nombre, cli_empresa_nombre)
	      END AS nombre
	INTO w_nombre
	FROM tdb_autos.au_clientes 
	WHERE cli_id = i_cli_id;

	RETURN w_nombre;
	
END; //
DELIMITER ;