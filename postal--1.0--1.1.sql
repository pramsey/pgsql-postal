-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION postal" to load this file. \quit

-- should this return a single json array object instead?
CREATE OR REPLACE FUNCTION postal_parse(addresses text[])
    RETURNS jsonb[] 
    LANGUAGE 'plpgsql' AS $$
DECLARE
  addrs jsonb[];
  address text;
  n int := 0;
BEGIN
  FOREACH address  IN ARRAY addresses LOOP
    addrs[n] := postal_parse(address);
    n := n + 1;
  END LOOP;
  return addrs;
END;
$$ IMMUTABLE STRICT;
