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
WITH (
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_si_clause
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_clause TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_clause TO inttraro;

-- Table: udl.udl_company_role

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
WITH (
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_company_role
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_company_role TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_company_role TO inttraro;

-- Table: udl.udl_si_container

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
  reefer_comments character varying(100000),
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
WITH ( 
  OIDS=FALSE
);
ALTER TABLE udl.udl_si_container
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_container TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_container TO inttraro;
--GRANT SELECT ON TABLE udl.udl_si_container TO billing_prod;
--GRANT SELECT ON TABLE udl.udl_si_container TO edw_prod;

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
WITH ( 
  OIDS=FALSE
)
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
WITH (
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_si_current
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_current TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_current TO inttraro;

-- Table: udl.udl_si_document

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
WITH ( 
  OIDS=FALSE
);
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
WITH (
  OIDS=FALSE
);
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
WITH (
  OIDS=FALSE
);
ALTER TABLE udl.udl_si_hazmat_contact
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_hazmat_contact TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_hazmat_contact TO inttraro;

-- Table: udl.udl_si_hazmat

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
  comments character varying(100000),
  packing_details character varying(1200),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE udl.udl_si_hazmat
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_hazmat TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_hazmat TO inttraro;

-- Table: udl.udl_si

 DROP TABLE if exists udl.udl_si;

CREATE TABLE udl.udl_si
(
  udl_si_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  original_si_id bigint,
  si_source character varying(100) NOT NULL,
  sequence1 integer NOT NULL,
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
  comments character varying(100000),
  routing_instructions character varying(100000),
  transport_remarks character varying(100000),
  bl_remarks character varying(100000),
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
WITH ( 
  OIDS=FALSE
)
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
WITH ( 
  OIDS=FALSE
);
ALTER TABLE udl.udl_si_line_item_attribute
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_line_item_attribute TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_line_item_attribute TO inttraro;


DROP TABLE if exists udl.udl_si_line_item_classification;

CREATE TABLE udl.udl_si_line_item_classification
(
  code character varying(10) NOT NULL,
  description character varying(1000),
  concatinating_desc character varying(4000),
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE udl.udl_si_line_item_classification
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_line_item_classification TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_line_item_classification TO inttraro;


DROP TABLE if exists udl.udl_si_line_item;

CREATE TABLE udl.udl_si_line_item
(
  udl_si_line_item_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  source_line_item_id bigint NOT NULL,
  sequence integer,
  package_level_type_id integer NOT NULL,
  package_level_type_desc character varying(50),
  package_count integer,
  overall_line_item_id bigint,
  parent_line_item_id bigint,
  package_type_id integer,
  package_type_description character varying(35),
  cargo_description character varying(100000),
  cargo_description_hashcode integer,
  marks_and_numbers character varying(500000),
  export_declaration_type character varying(3),
  gross_weight numeric(38,4),
  gross_weight_uom_id integer,
  gross_weight_uom_desc character varying(100),
  gross_volume numeric(38,4),
  gross_volume_uom_id integer,
  gross_volume_uom_desc character varying(100),
  gross_weight_bl numeric(38,4),
  gross_weight_bl_uom_id integer,
  gross_weight_bl_uom_desc character varying(100),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_si_line_item
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_line_item TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_line_item TO inttraro;


-- Table: udl.udl_si_message

DROP TABLE if exists udl.udl_si_message;

CREATE TABLE udl.udl_si_message
(
  udl_si_message_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_message_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  status character varying(50) NOT NULL,
  direction character varying(3),
  received_datetime timestamp without time zone,
  receiver_id character varying(35),
  comments character varying(500),
  processed_datetime timestamp without time zone,
  data character varying(100000),
  message_type character varying(10),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_si_message
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_message TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_message TO inttraro;


-- Table: udl.udl_si_party_communication

 DROP TABLE if exists udl.udl_si_party_communication;

CREATE TABLE udl.udl_si_party_communication
(
  udl_si_party_communication_id bigint NOT NULL,
  udl_si_party_contact_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_si_party_communication_id bigint,
  source_si_party_contact_id bigint,
  communication_type_id integer,
  communication_type_desc character varying(100),
  communication_value character varying(512),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_si_party_communication
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_party_communication TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_party_communication TO inttraro;

-- Table: udl.udl_si_party_contact

 DROP TABLE if exists udl.udl_si_party_contact;

CREATE TABLE udl.udl_si_party_contact
(
  udl_si_party_contact_id bigint NOT NULL,
  udl_si_party_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_company_contact_id bigint,
  source_company_id bigint,
  company_contact_type_id integer,
  company_contact_type_desc character varying(100),
  contact_name character varying(100),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE udl.udl_si_party_contact
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_party_contact TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_party_contact TO inttraro;

-- Table: udl.udl_si_party
 DROP TABLE if exists udl.udl_si_party;

CREATE TABLE udl.udl_si_party
(
  udl_si_party_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  source_company_id bigint NOT NULL,
  source_es_company_id integer,
  company_name character varying(80),
  company_type_id integer,
  company_type_desc character varying(50),
  address character varying(330),
  street_name character varying(150),
  city_name character varying(70),
  state_name character varying(70),
  postal_code character varying(17),
  country_geo_id integer,
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH ( 
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_si_party
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_party TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_party TO inttraro;
--GRANT SELECT ON TABLE udl.udl_si_party TO billing_prod;

-- Table: udl.udl_si_party_reference

DROP TABLE if exists udl.udl_si_party_reference;

CREATE TABLE udl.udl_si_party_reference
(
  udl_si_party_reference_id bigint NOT NULL,
  udl_si_party_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_company_reference_id bigint,
  source_company_id bigint,
  reference_type_id integer,
  reference_type_desc character varying(100),
  company_reference_value character varying(100),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_si_party_reference
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_party_reference TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_party_reference TO inttraro;


-- Table: udl.udl_si_payment_instruction

DROP TABLE if exists udl.udl_si_payment_instruction;

CREATE TABLE udl.udl_si_payment_instruction
(
  udl_si_payment_instruction_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_payment_instruction_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  freight_term_type_id integer NOT NULL,
  freight_term_type_desc character varying(200),
  charge_type_id integer,
  charge_type_desc character varying(100),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH ( 
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_si_payment_instruction
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_payment_instruction TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_payment_instruction TO inttraro;

-- Table: udl.udl_si_reference

DROP TABLE if exists udl.udl_si_reference;

CREATE TABLE udl.udl_si_reference
(
  udl_si_reference_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_reference_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  reference_type_id smallint,
  reference_qualifier character varying(3),
  reference_type_desc character varying(200),
  value character varying(50),
  issuance_date timestamp without time zone,
  expiration_date timestamp without time zone,
  ftx_issuance_date character varying(512),
  ftx_expiration_date character varying(512),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_si_reference
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_reference TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_reference TO inttraro;
--GRANT SELECT ON TABLE udl.udl_si_reference TO billing_prod;


-- Table: udl.udl_security_detail

DROP TABLE if exists udl.udl_security_detail;

CREATE TABLE udl.udl_security_detail
(
  security_detail_id bigint,
  security_id bigint,
  company_id integer,
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer,
  inserted_date timestamp without time zone,
  updated_process_id integer,
  updated_date timestamp without time zone
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_security_detail
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_security_detail TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_security_detail TO inttraro;


DROP TABLE if exists udl.udl_security;

CREATE TABLE udl.udl_security
(
  security_id bigint NOT NULL,
  security_code character varying(400) NOT NULL,
  security_role_code character varying(1000) NOT NULL,
  company_count integer NOT NULL,
  security_code_hash text NOT NULL,
  security_role_code_hash text NOT NULL,
  source_creation_date timestamp without time zone NOT NULL,
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE udl.udl_security
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_security TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_security TO inttraro;

DROP TABLE if exists udl.udl_si_line_item_classification;

CREATE TABLE udl.udl_si_line_item_classification
(
  code character varying(10) NOT NULL,
  description character varying(1000),
  concatinating_desc character varying(4000),
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
;
ALTER TABLE udl.udl_si_line_item_classification
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_line_item_classification TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_line_item_classification TO inttraro;


DROP TABLE if exists udl.udl_si_line_item;

CREATE TABLE udl.udl_si_line_item
(
  udl_si_line_item_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  source_line_item_id bigint NOT NULL,
  sequence integer,
  package_level_type_id integer NOT NULL,
  package_level_type_desc character varying(50),
  package_count integer,
  overall_line_item_id bigint,
  parent_line_item_id bigint,
  package_type_id integer,
  package_type_description character varying(35),
  cargo_description character varying(65000),
  cargo_description_hashcode integer,
  marks_and_numbers character varying(65000),
  export_declaration_type character varying(3),
  gross_weight numeric(38,4),
  gross_weight_uom_id integer,
  gross_weight_uom_desc character varying(100),
  gross_volume numeric(38,4),
  gross_volume_uom_id integer,
  gross_volume_uom_desc character varying(100),
  gross_weight_bl numeric(38,4),
  gross_weight_bl_uom_id integer,
  gross_weight_bl_uom_desc character varying(100),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)

;
ALTER TABLE udl.udl_si_line_item
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_line_item TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_line_item TO inttraro;


-- Table: udl.udl_si_message

DROP TABLE if exists udl.udl_si_message;

CREATE TABLE udl.udl_si_message
(
  udl_si_message_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_message_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  status character varying(50) NOT NULL,
  direction character varying(3),
  received_datetime timestamp without time zone,
  receiver_id character varying(35),
  comments character varying(500),
  processed_datetime timestamp without time zone,
  data character varying(65000),
  message_type character varying(10),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)

;
ALTER TABLE udl.udl_si_message
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_message TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_message TO inttraro;


-- Table: udl.udl_si_party_communication

 DROP TABLE if exists udl.udl_si_party_communication;

CREATE TABLE udl.udl_si_party_communication
(
  udl_si_party_communication_id bigint NOT NULL,
  udl_si_party_contact_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_si_party_communication_id bigint,
  source_si_party_contact_id bigint,
  communication_type_id integer,
  communication_type_desc character varying(100),
  communication_value character varying(512),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)

;
ALTER TABLE udl.udl_si_party_communication
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_party_communication TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_party_communication TO inttraro;

-- Table: udl.udl_si_party_contact

 DROP TABLE if exists udl.udl_si_party_contact;

CREATE TABLE udl.udl_si_party_contact
(
  udl_si_party_contact_id bigint NOT NULL,
  udl_si_party_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_company_contact_id bigint,
  source_company_id bigint,
  company_contact_type_id integer,
  company_contact_type_desc character varying(100),
  contact_name character varying(100),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
;
ALTER TABLE udl.udl_si_party_contact
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_party_contact TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_party_contact TO inttraro;

-- Table: udl.udl_si_party
 DROP TABLE if exists udl.udl_si_party;

CREATE TABLE udl.udl_si_party
(
  udl_si_party_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  source_company_id bigint NOT NULL,
  source_es_company_id integer,
  company_name character varying(80),
  company_type_id integer,
  company_type_desc character varying(50),
  address character varying(330),
  street_name character varying(150),
  city_name character varying(70),
  state_name character varying(70),
  postal_code character varying(17),
  country_geo_id integer,
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)

;
ALTER TABLE udl.udl_si_party
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_party TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_party TO inttraro;
--GRANT SELECT ON TABLE udl.udl_si_party TO billing_prod;

-- Table: udl.udl_si_party_reference

DROP TABLE if exists udl.udl_si_party_reference;

CREATE TABLE udl.udl_si_party_reference
(
  udl_si_party_reference_id bigint NOT NULL,
  udl_si_party_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_company_reference_id bigint,
  source_company_id bigint,
  reference_type_id integer,
  reference_type_desc character varying(100),
  company_reference_value character varying(100),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)

;
ALTER TABLE udl.udl_si_party_reference
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_party_reference TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_party_reference TO inttraro;


-- Table: udl.udl_si_payment_instruction

DROP TABLE if exists udl.udl_si_payment_instruction;

CREATE TABLE udl.udl_si_payment_instruction
(
  udl_si_payment_instruction_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_payment_instruction_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  freight_term_type_id integer NOT NULL,
  freight_term_type_desc character varying(200),
  charge_type_id integer,
  charge_type_desc character varying(100),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)

;
ALTER TABLE udl.udl_si_payment_instruction
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_payment_instruction TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_payment_instruction TO inttraro;

-- Table: udl.udl_si_reference

DROP TABLE if exists udl.udl_si_reference;

CREATE TABLE udl.udl_si_reference
(
  udl_si_reference_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_reference_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  reference_type_id smallint,
  reference_qualifier character varying(3),
  reference_type_desc character varying(200),
  value character varying(50),
  issuance_date timestamp without time zone,
  expiration_date timestamp without time zone,
  ftx_issuance_date character varying(512),
  ftx_expiration_date character varying(512),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)

;
ALTER TABLE udl.udl_si_reference
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_reference TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_reference TO inttraro;
--GRANT SELECT ON TABLE udl.udl_si_reference TO billing_prod;


-- Table: udl.udl_security_detail

DROP TABLE if exists udl.udl_security_detail;

CREATE TABLE udl.udl_security_detail
(
  security_detail_id bigint,
  security_id bigint,
  company_id integer,
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer,
  inserted_date timestamp without time zone,
  updated_process_id integer,
  updated_date timestamp without time zone
)

;
ALTER TABLE udl.udl_security_detail
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_security_detail TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_security_detail TO inttraro;


DROP TABLE if exists udl.udl_security;

CREATE TABLE udl.udl_security
(
  security_id bigint NOT NULL,
  security_code character varying(400) NOT NULL,
  security_role_code character varying(1000) NOT NULL,
  company_count integer NOT NULL,
  security_code_hash text NOT NULL,
  security_role_code_hash text NOT NULL,
  source_creation_date timestamp without time zone NOT NULL,
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)

;
ALTER TABLE udl.udl_security
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_security TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_security TO inttraro;


CREATE TABLE udl.udl_si_reference
(
  udl_si_reference_id bigint NOT NULL,
  udl_si_id bigint NOT NULL,
  source_reference_id bigint NOT NULL,
  source_si_id bigint NOT NULL,
  reference_type_id smallint,
  reference_qualifier character varying(3),
  reference_type_desc character varying(200),
  value character varying(50),
  issuance_date timestamp without time zone,
  expiration_date timestamp without time zone,
  ftx_issuance_date character varying(512),
  ftx_expiration_date character varying(512),
  partition_date timestamp without time zone NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
;
ALTER TABLE udl.udl_si_reference
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_reference TO edwudl_prod;

ALTER TABLE udl.udl_si_reference
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_reference TO edwudl_prod;


CREATE SEQUENCE udl.udl_si_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 38179
  CACHE 1;
ALTER TABLE udl.udl_si_seq
  OWNER TO edwudl_prod;
  
  CREATE SEQUENCE udl.udl_si_clause_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_clause_seq
  OWNER TO edwudl_prod;


CREATE SEQUENCE udl.udl_si_container_line_item_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE udl.udl_si_container_line_item_seq
  OWNER TO edwudl_prod;
  
  
  
CREATE SEQUENCE udl.udl_si_container_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_container_seq
  OWNER TO edwudl_prod;
  
  
  CREATE SEQUENCE udl.udl_si_document_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_document_seq
  OWNER TO edwudl_prod;
  
CREATE SEQUENCE udl.udl_si_hazmat_communication_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_hazmat_communication_seq
  OWNER TO edwudl_prod;
  
  
  CREATE SEQUENCE udl.udl_si_hazmat_contact_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_hazmat_contact_seq
  OWNER TO edwudl_prod;
  
  
CREATE SEQUENCE udl.udl_si_hazmat_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_hazmat_seq
  OWNER TO edwudl_prod;


CREATE SEQUENCE udl.udl_si_line_item_attribute_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_line_item_attribute_seq
  OWNER TO edwudl_prod;
  
  CREATE SEQUENCE udl.udl_si_line_item_reference_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_line_item_reference_seq
  OWNER TO edwudl_prod;


CREATE SEQUENCE udl.udl_si_line_item_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_line_item_seq
  OWNER TO edwudl_prod;
  
  CREATE SEQUENCE udl.udl_si_party_communication_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_party_communication_seq
  OWNER TO edwudl_prod;

CREATE SEQUENCE udl.udl_si_party_contact_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_party_contact_seq
  OWNER TO edwudl_prod;
  
  CREATE SEQUENCE udl.udl_si_party_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_party_seq
  OWNER TO edwudl_prod;
  
  CREATE SEQUENCE udl.udl_si_payment_instruction_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_payment_instruction_seq
  OWNER TO edwudl_prod;
  
  CREATE SEQUENCE udl.udl_si_reference_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_reference_seq
  OWNER TO edwudl_prod;

  CREATE SEQUENCE udl.udl_si_message_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_message_seq
  OWNER TO edwudl_prod;


  CREATE SEQUENCE udl.udl_si_party_reference_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_si_party_reference_seq
  OWNER TO edwudl_prod;


CREATE TABLE udl.udl_si_line_item_reference
(
 udl_si_line_item_reference_id bigint NOT NULL,
 udl_si_line_item_id bigint NOT NULL,
 udl_si_id bigint NOT NULL,
 source_line_item_reference_id bigint,
 source_line_item_id bigint,
 line_item_reference_type_id integer,
 line_item_reference_type_desc character varying(50),
 value character varying(100),
 issuance_date timestamp without time zone,
 expiration_date timestamp without time zone,
 partition_date timestamp without time zone NOT NULL,
 inserted_process_id integer NOT NULL,
 inserted_date timestamp without time zone NOT NULL,
 updated_process_id integer NOT NULL,
 updated_date timestamp without time zone NOT NULL
)
;
ALTER TABLE udl.udl_si_line_item_reference
 OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_si_line_item_reference TO edwudl_prod;
GRANT SELECT ON TABLE udl.udl_si_line_item_reference TO inttraro;


CREATE SEQUENCE udl.udl_company_role_seq
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 20010
 CACHE 1;
ALTER TABLE udl.udl_company_role_seq
 OWNER TO edwudl_prod;

CREATE TABLE udl.udl_company_location
(
  udl_company_location_id bigint NOT NULL,
  udl_company_id bigint,
  udl_account_owner_user_id bigint,
  address_id integer,
  address_type_id integer,
  company_location_type_id integer,
  source_company_location_id integer,
  company_location_name character varying(255) NOT NULL,
  company_location_sfdc_id character varying(40),
  billing_region character varying(30),
  managed_region character varying(10),
  security_key integer,
  registration_id integer,
  tender_admin_user_id integer,
  tender_admin_user_group_id integer,
  company_comments character varying(1000),
  industry_id integer,
  alliance_partner_id integer,
  sfdc_parent_account_id character varying(40),
  primary_phone_number character varying(40),
  fax_number character varying(40),
  billing_street text,
  billing_city text,
  billing_state text,
  billing_postal_code text,
  billing_country text,
  alliance_partner_from_registration character varying(100),
  other_alliance_partner character varying(255),
  record_type_name character varying(255),
  alliance_partner_stage character varying(30),
  alliance_partner_status character varying(100),
  industry_type character varying(50),
  last_activity_date timestamp without time zone,
  is_deleted_in_salesforce character(5),
  sfdc_record_type_id character varying(40),
  sfdc_record_type_desc character varying(50),
  company_description text,
  company_site character varying(80),
  is_customer_portal character(5),
  data_quality_description text,
  dsi_flag character(5),
  bulk_registration_id integer,
  sfdc_segment character varying(20),
  is_carrier_shareholder character(5),
  company_location_primary_role character varying(40),
  multi_location_presence_flag character(5),
  is_carrier_mapping_qualification_required character(5),
  exclude_from_poc_approval character(5),
  is_loa_required character(5),
  nsh_2_inttra_region_not_supported text,
  company_location_registration_date timestamp without time zone,
  alliance_type character varying(80),
  nsh_does_not_have_direct_connection character(5),
  sfdc_territory character varying(255),
  nsh_hq_approval_required character(5),
  need_pc_software_solution_i_desktop character(5),
  marketing_source_code character varying(255),
  opt_out_case_surveys character(5),
  sales_segment character varying(30),
  inttra_booking character varying(30),
  inttra_shipping_instructions character varying(30),
  inttra_track_trace character varying(30),
  inttra_einvoice character varying(30),
  inttra_ocean_schedules character varying(30),
  inttra_advertising character varying(30),
  geographic_coverage text,
  edi_id_info character varying(255),
  alliance_partner_identificator character varying(30),
  alliance_partner_name character varying(255),
  registration_contact character varying(40),
  alliance_software_type character varying(10),
  alliance_focus_market character varying(30),
  test_account character(5),
  read_and_accept_the_terms_and_conditions character(5),
  inttra_exclusive character(5),
  activity_desc character varying(50),
  government_id character varying(63),
  initial_source character varying(5) NOT NULL,
  updated_source character varying(5) NOT NULL,
  creation_date timestamp without time zone NOT NULL,
  deactivation_date timestamp without time zone,
  approval_status character varying(50),
  approval_status_date timestamp without time zone,
  sub_region character varying(100),
  udl_global_account_flag character varying(40),
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
);
ALTER TABLE udl.udl_company_location
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_company_location TO edwudl_prod;

-- Table: udl.udl_address

-- DROP TABLE udl.udl_address;

CREATE TABLE udl.udl_address
(
  address_id integer NOT NULL,
  address_type_id integer,
  geography_area_id integer,
  closest_registered_geo_area_id integer,
  validated_flag smallint,
  address_line_1 character varying(80),
  address_line_2 character varying(80),
  address_line_3 character varying(80),
  city_code character varying(20),
  state_code character varying(20),
  country_code character varying(20),
  zip_code character varying(18),
  roadway_type_code character varying(15),
  postal_code character varying(40),
  time_zone character(4),
  address_description text,
  comments text,
  usage_id smallint,
  security_key integer NOT NULL,
  inserted_process_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_process_id integer NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
;
ALTER TABLE udl.udl_address
  OWNER TO edwudl_prod;
GRANT ALL ON TABLE udl.udl_address TO edwudl_prod;


CREATE SEQUENCE udl.udl_security_detail_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_security_detail_seq
  OWNER TO edwudl_prod;


CREATE SEQUENCE udl.udl_security_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE udl.udl_security_seq
  OWNER TO edwudl_prod;