CREATE user edwudl_prod 
    NOCREATEDB NOCREATEUSER 
  password 'edwudlInttra1';

CREATE SCHEMA  IF NOT EXISTS  udl  AUTHORIZATION edwudl_prod;

CREATE user inttraro 
    NOCREATEDB NOCREATEUSER 
  password 'InttraRO1';


-- Table: udl.udl_si_clause

-- Table: udl.udl_si_clause
DROP TABLE IF Exists udl.udl_si_clause;

CREATE TABLE udl.udl_si_clause
(
  udl_si_clause_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  source_clause_id bigint NOT NULL,
  clause_type_id integer NOT NULL,
  clause_type_desc character varying(200),
  description character varying(512),
  non_inttra_clause_code character varying(10),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
DISTKEY(udl_si_clause_id)
;
ALTER TABLE udl.udl_si_clause
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_clause TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_clause TO inttraro;


DROP TABLE IF EXISTS udl.udl_company_role;

CREATE TABLE udl.udl_company_role
(
  udl_company_role_id bigint NOT NULL,
  security_id bigint NOT NULL,
  company_id integer NOT NULL,
  company_role character varying(100) NOT NULL,
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
distkey(udl_company_role_id)
;
ALTER TABLE udl.udl_company_role
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_company_role TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_company_role TO inttraro;


DROP TABLE IF EXISTS udl.udl_si_container;

CREATE TABLE udl.udl_si_container
(
  udl_si_container_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_container_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  teu_count numeric(38,4),
  container_profile_code character varying(4),
  container_type character varying(50),
  container_number character varying(25),
  reefer_comments character varying(65000),  -- max length allowed 65535 changed from 100000 to 65000 
  container_supplier_type_id integer,
  container_supplier_type_desc character varying(50),
  container_comments character varying(3000),
  sequence_nbr bigint,
  reefer_ind character varying(3),
  non_inttra_profile_code character varying(4),
  weight numeric(38,4),
  weight_uom_id integer,
  weight_uom_desc character varying(100),
  gross_volume numeric(38,4),
  gross_volume_uom_id integer,
  gross_volume_uom_desc character varying(100),
  air_flow numeric(38,4),
  air_flow_uom_id integer,
  air_flow_uom_desc character varying(100),
  transport_temp numeric(38,4),
  transport_temp_uom_id integer,
  transport_temp_uom_desc character varying(100),
  gross_weight numeric(38,4),
  gross_weight_uom_id integer,
  gross_weight_uom_desc character varying(100),
  humidity numeric(38,4),
  humidity_uom_id integer,
  humidity_uom_desc character varying(100),
  tare_weight numeric(38,4),
  tare_weight_uom_id integer,
  tare_weight_uom_desc character varying(100),
  carrier_seal_list character varying(400),
  customs_seal_list character varying(400),
  shipper_seal_list character varying(400),
  terminal_operator_seal_list character varying(400),
  veterinary_seal_list character varying(400),
  unknown_seal_list character varying(400),
  cont_stuff_city_geo_id integer,
  cont_stuff_city_name character varying(256),
  cont_stuff_country_geo_id integer,
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
DISTKEY(udl_si_container_id);
ALTER TABLE udl.udl_si_container
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_container TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_container TO inttraro;

-- Table: udl.udl_si_container_line_item

 DROP TABLE IF EXISTS udl.udl_si_container_line_item;

CREATE TABLE udl.udl_si_container_line_item
(
  udl_si_container_line_item_id bigint NOT NULL,
  udl_si_line_item_id bigint NOT NULL,
  udl_container_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_container_line_item_id bigint NOT NULL,
  source_line_item_id bigint NOT NULL,
  source_container_id bigint NOT NULL,
  package_type_id integer,
  package_type_desc character varying(50),
  package_count integer,
  weight numeric(38,4),
  weight_uom_id integer,
  weight_uom_desc character varying(100),
  gross_volume numeric(38,4),
  gross_volume_uom_id integer,
  gross_volume_uom_desc character varying(100),
  gross_weight numeric(38,4),
  gross_weight_uom_id integer,
  gross_weight_uom_desc character varying(100),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
distkey(udl_si_container_line_item_id)
;
ALTER TABLE udl.udl_si_container_line_item
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_container_line_item TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_container_line_item TO inttraro;

-- Table: udl.udl_si_current
DROP TABLE IF EXISTS udl.udl_si_current;

CREATE TABLE udl.udl_si_current
(
  original_si_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  first_udl_si_id bigint NOT NULL,
  last_udl_si_id bigint NOT NULL,
  last_shipment_id character varying(35),
  last_customer_date_of_issue timestamp without time zone,
  creation_date timestamp without time zone,
  purged_flag smallint,
  deleted_flag smallint,
  total_revisions integer NOT NULL,
  last_security_id bigint,
  first_revision_date timestamp without time zone NOT NULL,
  last_revision_date timestamp without time zone NOT NULL,
  last_status character varying(100),
  last_carrier_company_id bigint,
  last_requester_company_id bigint NOT NULL,
  first_amended_revision_id bigint,
  last_amended_revision_id bigint,
  last_amended_revision_date timestamp without time zone,
  last_amended_security_id bigint,
  last_main_pol_geo_id integer,
  last_main_pod_geo_id integer,
  last_main_plor_geo_id integer,
  last_main_plod_geo_id integer,
  total_container_count integer,
  single_carrier_reference character varying(50),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
DISTKEY(original_si_id)
;
ALTER TABLE udl.udl_si_current
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_current TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_current TO inttraro;

DROP TABLE IF EXISTS udl.udl_si_document;

CREATE TABLE udl.udl_si_document
(
  udl_si_document_id bigint NOT NULL,
  udl_si_company_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_document_id integer NOT NULL,
  source_company_id integer NOT NULL,
  document_type_id integer,
  document_type_desc character varying(100),
  number_of_documents integer,
  document_status_id integer,
  document_status_desc character varying(100),
  master_number character varying(30),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
DISTKEY(udl_si_document_id);
ALTER TABLE udl.udl_si_document
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_document TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_document TO inttraro;

-- Table: udl.udl_si_hazmat_communication

 DROP TABLE IF EXISTS udl.udl_si_hazmat_communication;

CREATE TABLE udl.udl_si_hazmat_communication
(
  udl_si_hazmat_communication_id bigint NOT NULL,
  udl_si_hazmat_contact_id bigint NOT NULL,
  udl_si_id bigint,
  source_si_hazmat_communication_id bigint,
  source_si_hazmat_contact_id bigint,
  communication_type_id integer,
  communication_type_desc character varying(200),
  communication_value character varying(512),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
DISTKEY(udl_si_hazmat_communication_id);
ALTER TABLE udl.udl_si_hazmat_communication
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_hazmat_communication TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_hazmat_communication TO inttraro;

-- Table: udl.udl_si_hazmat_contact

 DROP TABLE IF EXISTS udl.udl_si_hazmat_contact;

CREATE TABLE udl.udl_si_hazmat_contact
(
  udl_si_hazmat_contact_id bigint NOT NULL,
  udl_si_hazmat_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_hazmat_contact_id bigint,
  source_hazmat_id bigint,
  hazmat_contact_type_id integer,
  hazmat_contact_type_desc character varying(100),
  contact_name character varying(100),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
DISTKEY(udl_si_hazmat_contact_id);
ALTER TABLE udl.udl_si_hazmat_contact
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_hazmat_contact TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_hazmat_contact TO inttraro;


DROP TABLE IF EXISTS udl.udl_si_hazmat;

CREATE TABLE udl.udl_si_hazmat
(
  udl_si_hazmat_id bigint NOT NULL,
  udl_si_line_item_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_hazmat_id integer NOT NULL,
  source_line_item_id integer NOT NULL,
  un_number character varying(80),
  imo_class_id character varying(20),
  imo_class_desc character varying(100),
  page_number character varying(7),
  proper_shipping_name character varying(512),
  packing_group character varying(35),
  flash_point numeric(15,4),
  flash_point_uom_id integer,
  flash_point_uom_desc character varying(100),
  placard character varying(512),
  ems_number character varying(10),
  comments character varying(65000), -- changed 100000 to 65000 
  packing_details character varying(1200),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
DISTKEY(udl_si_hazmat_id);
ALTER TABLE udl.udl_si_hazmat
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_hazmat TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_hazmat TO inttraro;



DROP TABLE if exists udl.udl_si;

CREATE TABLE udl.udl_si
(
  udl_si_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  original_si_id bigint,
  si_source character varying(100) NOT NULL,
  sequence integer NOT NULL,
  status_id integer,
  status_desc character varying(100),
  message_function_code character varying(3),
  data_source character varying(50) NOT NULL,
  transaction_version_id integer,
  transaction_version_id_desc character varying(50),
  channel character varying(20) NOT NULL,
  source_creation_date timestamp without time zone NOT NULL,
  creation_method_id integer,
  creation_method_id_desc character varying(50),
  channel_version character varying(10) NOT NULL,
  format character varying(20) NOT NULL,
  format_version character varying(15) NOT NULL,
  security_id bigint NOT NULL,
  subscription_transpoter_id integer,
  sender_company_id integer,
  sender_company_name character varying(80),
  sender_detail character varying(200),
  carrier_company_id integer,
  carrier_company_name character varying(80),
  carrier_geo_area_id integer,
  requester_company_id integer NOT NULL,
  requester_company_name character varying(80),
  requester_geo_area_id integer,
  shipment_revision character varying(6),
  master_bill_number character varying(30),
  shipment_id character varying(35),
  si_name character varying(60) NOT NULL,
  last_modified_by_company_id integer,
  source_revision_date timestamp without time zone NOT NULL,
  move_type_id integer,
  move_type_desc character varying(50),
  summary_id integer,
  summary_container_count integer,
  summary_weight bigint,
  summary_weight_uom_id smallint,
  summary_weight_uom_desc character varying(100),
  summary_volume numeric(38,4),
  summary_volume_uom_id integer,
  summary_volume_uom_desc character varying(100),
  summary_package_count integer,
  total_container_count integer,
  comments character varying(65000),
  routing_instructions character varying(65000),
  transport_remarks character varying(65000),
  bl_remarks character varying(65000),
  uom_classification_id integer,
  uom_classification_id_desc character varying(80),
  source_access_key_id bigint,
  source_creator_user_id integer,
  source_last_modified_by_user_id integer,
  ams_filing_flag smallint,
  date_of_issue timestamp without time zone,
  date_of_issue_format_id smallint,
  date_of_issue_format character varying(30),
  declared_value numeric(38,2),
  currency_type_id integer,
  declared_value_currency character varying(100),
  service_type_id integer,
  service_type_desc character varying(50),
  bl_issue_geo_id integer,
  bl_issue_date timestamp without time zone,
  bl_issue_date_format_id smallint,
  bl_issue_date_format character varying(30),
  payable_at_geo_id integer,
  payable_at_city character varying(256),
  payable_at_country character varying(25),
  main_pol_geo_id integer,
  main_pod_geo_id integer,
  main_plor_geo_id integer,
  main_plod_geo_id integer,
  main_country_of_origin_geo_id integer,
  main_conveyance_number character varying(50),
  main_transport_name character varying(50),
  source_transportation_id integer,
  transport_code character varying(9),
  transportation_means_type_id integer,
  transportation_means_desc character varying(17),
  carrier_scac_code character varying(17),
  vessel_country_code character varying(3),
  transportation_service_id integer,
  transportation_service character varying(35),
  channel_minor_version character varying(10),
  message_type_value character varying(100),
  carrier_type_value character varying(100),
  link_sender_edi_id character varying(200),
  compliance_version character varying(100),
  flow_type_id character varying(100),
  in_gentran_log_id character varying(38),
  in_receiver_id character varying(35),
  in_message_counter integer,
  out_processed_date_time timestamp without time zone,
  in_message_contact character varying(60),
  in_message_contact_phone character varying(80),
  in_message_email character varying(80),
  processed_status character varying(35),
  out_gentran_log_id character varying(38),
  out_sender_id character varying(35),
  out_receiver_id character varying(35),
  out_message_type character varying(8),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
DISTKEY (UDL_SI_ID)
;
ALTER TABLE udl.udl_si
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si TO inttraro;
--GRANT SELECT ON TABLE udl.udl_si TO billing_prod;
--GRANT SELECT ON TABLE udl.udl_si TO edw_prod;

 DROP TABLE if exists udl.udl_si_line_item_attribute;

CREATE TABLE udl.udl_si_line_item_attribute
(
  udl_si_line_item_attribute_id bigint NOT NULL,
  udl_si_line_item_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_line_item_attribute_id bigint,
  source_line_item_id bigint NOT NULL,
  line_item_attribute_type_id integer NOT NULL,
  line_item_attribute_type_desc character varying(50),
  sequence_nbr bigint,
  value character varying(1000),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
DISTKEY(udl_si_line_item_attribute_id);
ALTER TABLE udl.udl_si_line_item_attribute
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_line_item_attribute TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_line_item_attribute TO inttraro;









