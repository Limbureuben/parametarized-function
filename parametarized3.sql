/*-----return movies table --*/

CREATE OR REPLACE FUNCTION movies_category(catname VARCHAR)
RETURNS TABLE(
sn BIGINT,
category_name VARCHAR(25),
title VARCHAR(255),
description VARCHAR(255)
)
LANGUAGE plpgsql
AS
$$
	BEGIN 
	RETURN QUERY
		SELECT ROW_NUMBER() OVER() AS sn, ca.name,
		fi.title,fi.description::VARCHAR(255)
		FROM film_category
		JOIN category ca USING(category_id)
		JOIN film fi USING(film_id)
		WHERE ca.name=catname;
		---####### function call
		---####### SELECT * FROM movies_category('Action');
	END;
$$;
