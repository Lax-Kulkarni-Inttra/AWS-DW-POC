DROP SEQUENCE IF EXISTS edw_audit.gp_elt_execution_log_seq;
CREATE SEQUENCE edw_audit.gp_elt_execution_log_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 60
  CACHE 1;
ALTER TABLE edw_audit.gp_elt_execution_log_seq
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.gp_elt_execution_log_seq TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.gp_elt_execution_log_seq TO edwstg_prod;



DROP SEQUENCE IF EXISTS edw_audit.process_id_seq;
CREATE SEQUENCE edw_audit.process_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 6359
  CACHE 1;
ALTER TABLE edw_audit.process_id_seq
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.process_id_seq TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.process_id_seq TO edwstg_prod;

-- Table: edw_audit.gp_elt_execution_log

DROP TABLE IF EXISTS edw_audit.gp_elt_execution_log;

CREATE TABLE edw_audit.gp_elt_execution_log
(
  id integer NOT NULL,
  batch_name character varying(30) NOT NULL,
  batch_id integer NOT NULL,
  load_type character varying(100) NOT NULL,
  ready_to_run character varying(1) NOT NULL,
  inserted_time timestamp without time zone NOT NULL,
  updated_time timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE edw_audit.gp_elt_execution_log
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.gp_elt_execution_log TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.gp_elt_execution_log TO edwstg_prod;
GRANT SELECT ON TABLE edw_audit.gp_elt_execution_log TO inttraro;

-- Table: edw_audit.gp_elt_batch_control

DROP TABLE IF EXISTS  edw_audit.gp_elt_batch_control;

CREATE TABLE edw_audit.gp_elt_batch_control
(
  id integer NOT NULL,
  batch_name character varying(30) NOT NULL,
  active_ind character varying(1) NOT NULL,
  stg_days_to_retain integer,
  deletion_required character varying(1)
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE edw_audit.gp_elt_batch_control
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.gp_elt_batch_control TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.gp_elt_batch_control TO edwstg_prod;
GRANT SELECT ON TABLE edw_audit.gp_elt_batch_control TO inttraro;



-- Table: edw_audit.gp_elt_batch_grouping

 DROP TABLE IF EXISTS  edw_audit.gp_elt_batch_grouping;

CREATE TABLE edw_audit.gp_elt_batch_grouping
(
  id integer NOT NULL,
  batch_name character varying(30) NOT NULL,
  group_number integer NOT NULL
)
WITH (
  OIDS=FALSE
);


GRANT ALL ON TABLE edw_audit.gp_elt_batch_grouping TO edwstg_prod;
GRANT ALL ON TABLE edw_audit.gp_elt_batch_grouping TO edwudl_prod;


-- Table: edw_audit.gp_elt_process_control

DROP TABLE IF EXISTS  edw_audit.gp_elt_process_control;

CREATE TABLE edw_audit.gp_elt_process_control
(
  id integer NOT NULL,
  process_name character varying(50) NOT NULL,
  batch_name character varying(30) NOT NULL,
  primary_source_name character varying(30) NOT NULL,
  target_table_name character varying(50) NOT NULL,
  function_name character varying(50) NOT NULL,
  group_number smallint NOT NULL,
  active_ind character varying(1) NOT NULL,
  prev_exec_success_ind character varying(1) NOT NULL,
  load_type character varying(100) NOT NULL,
  full_table_name character varying(50)
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE edw_audit.gp_elt_process_control
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.gp_elt_process_control TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.gp_elt_process_control TO edwstg_prod;
GRANT SELECT ON TABLE edw_audit.gp_elt_process_control TO inttraro;

-- Table: edw_audit.gp_elt_stg_process_control

 DROP TABLE IF EXISTS  edw_audit.gp_elt_stg_process_control;

CREATE TABLE edw_audit.gp_elt_stg_process_control
(
  id integer NOT NULL,
  process_name character varying(50) NOT NULL,
  batch_name character varying(50) NOT NULL,
  table_name character varying(50) NOT NULL,
  ext_table_name character varying(50) NOT NULL,
  file_name character varying(50) NOT NULL,
  load_approach character varying(30) NOT NULL,
  group_number smallint NOT NULL,
  active_ind character varying(1) NOT NULL,
  prev_exec_success_ind character varying(1) NOT NULL,
  exec_query character varying(4000),
  full_table_name character varying(50)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE edw_audit.gp_elt_stg_process_control
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.gp_elt_stg_process_control TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.gp_elt_stg_process_control TO edwstg_prod;
GRANT SELECT ON TABLE edw_audit.gp_elt_stg_process_control TO inttraro;

-- Table: edw_audit.elt_batch_audit
DROP TABLE edw_audit.elt_batch_audit;

CREATE TABLE edw_audit.elt_batch_audit
(
 batch_id integer NOT NULL,
 batch_name character varying(30) NOT NULL,
 STG_load_end_datetime timestamp without time zone,
 UDL_load_start_datetime timestamp without time zone NOT NULL,
 UDL_load_end_datetime timestamp without time zone,
 RS_load_start_datetime timestamp without time zone NOT NULL,
 RS_load_end_datetime timestamp without time zone,
 BATCH_load_status character varying(50) NOT NULL
)
WITH (
 OIDS=FALSE
);
ALTER TABLE edw_audit.elt_batch_audit
 OWNER TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.elt_batch_audit TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.elt_batch_audit TO edwstg_prod;
GRANT SELECT ON TABLE edw_audit.elt_batch_audit TO inttraro;
 
-- Table: edw_audit.elt_process_audit

 DROP TABLE IF EXISTS  edw_audit.elt_process_audit;

CREATE TABLE edw_audit.elt_process_audit
(
  process_id integer,
  batch_id integer,
  process_name character varying(100),
  status character varying(20),
  start_datetime timestamp without time zone,
  end_datetime timestamp without time zone,
  primary_source_name character varying(100),
  target_name character varying(100),
  inserted_record_count bigint,
  updated_record_count bigint,
  deleted_record_count bigint,
  error_text character varying(4000),
  load_type character varying(100)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE edw_audit.elt_process_audit
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.elt_process_audit TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.elt_process_audit TO edwstg_prod;
GRANT SELECT ON TABLE edw_audit.elt_process_audit TO inttraro;

-- Table: edw_audit.elt_stg_process_audit

DROP TABLE IF EXISTS  edw_audit.elt_stg_process_audit;

CREATE TABLE edw_audit.elt_stg_process_audit
(
  process_id integer NOT NULL,
  batch_id integer NOT NULL,
  process_name character varying(50) NOT NULL,
  file_number integer NOT NULL,
  file_name character varying(200) NOT NULL,
  status character varying(20) NOT NULL,
  start_datetime timestamp without time zone NOT NULL,
  end_datetime timestamp without time zone,
  table_name character varying(50) NOT NULL,
  source_record_count bigint,
  target_record_count bigint,
  error_text character varying(4000),
  load_type character varying(100) NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE edw_audit.elt_stg_process_audit
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.elt_stg_process_audit TO edwudl_prod;
GRANT ALL ON TABLE edw_audit.elt_stg_process_audit TO edwstg_prod;
GRANT SELECT ON TABLE edw_audit.elt_stg_process_audit TO inttraro;

 