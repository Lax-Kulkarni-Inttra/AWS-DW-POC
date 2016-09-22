-- Table: stg_inttra.stg_shipping_instruction

 DROP TABLE IF EXISTS stg_inttra.stg_shipping_instruction;

CREATE TABLE stg_inttra.stg_shipping_instruction
(
  shipping_instruction_id bigint NOT NULL,
  carrier_id bigint,
  status_id bigint NOT NULL,
  move_type_id bigint,
  creator_user_id bigint NOT NULL,
  creator_company_id bigint NOT NULL,
  creation_date timestamp(0) without time zone NOT NULL,
  last_modified_date timestamp(0) without time zone NOT NULL,
  last_modified_by_user_id bigint NOT NULL,
  last_modified_by_company_id bigint NOT NULL,
  main_vessel character varying(50),
  main_voyage character varying(50),
  routing_instructions character varying(200),
  uom_classification_id bigint NOT NULL,
  creation_method_id bigint NOT NULL,
  si_name character varying(60) NOT NULL,
  shipment_id character varying(38),
  transaction_version_id bigint,
  service_type_id bigint NOT NULL,
  client_release_version character varying(10),
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stg_inttra.stg_shipping_instruction
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_shipping_instruction TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_shipping_instruction TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_shipping_instruction TO inttraro;


-- Table: stg_inttra.stg_si_container

DROP TABLE IF EXISTS stg_inttra.stg_si_container;

CREATE TABLE stg_inttra.stg_si_container
(
  container_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  container_profile_code character varying(4) NOT NULL,
  container_number character varying(16),
  gross_weight numeric(38,4),
  gross_weight_uom_id bigint,
  volume numeric(38,4),
  volume_uom_id bigint,
  reefer_unactive_flag smallint,
  container_initial character varying(4),
  reefer_temp numeric(38,4),
  reefer_temp_uom_id bigint,
  tare_weight numeric(38,4),
  tare_weight_uom_id bigint,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
);

ALTER TABLE stg_inttra.stg_si_container
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_container TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_container TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_container TO inttraro;


-- Table: stg_inttra.stg_si_financial_info

DROP TABLE IF EXISTS stg_inttra.stg_si_financial_info;

CREATE TABLE stg_inttra.stg_si_financial_info
(
  financial_info_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  freight_term_type_id bigint,
  freight_payable_at character varying(50) NOT NULL,
  declared_value numeric(22,2),
  currency_type_id bigint,
  date_of_issue timestamp(0) without time zone,
  comments character varying(550),
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
);

ALTER TABLE stg_inttra.stg_si_financial_info
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_financial_info TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_financial_info TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_financial_info TO inttraro;

-- Table: stg_inttra.stg_uom_classification

DROP TABLE IF EXISTS stg_inttra.stg_uom_classification;

CREATE TABLE stg_inttra.stg_uom_classification
(
  uom_classification_id bigint NOT NULL,
  description character varying(80) NOT NULL,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stg_inttra.stg_uom_classification
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_uom_classification TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_uom_classification TO edwudl_prod;

-- Table: stg_inttra.stg_si_location

DROP TABLE IF EXISTS stg_inttra.stg_si_location;

CREATE TABLE  stg_inttra.stg_si_location
(
  location_id bigint NOT NULL,
  location_type_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  geography_area_id bigint NOT NULL,
  loc_description character varying(256),
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stg_inttra.stg_si_location
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_location TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_location TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_location TO inttraro;


-- Table: stg_inttra.stg_si_reference

 DROP TABLE IF EXISTS stg_inttra.stg_si_reference;

CREATE TABLE stg_inttra.stg_si_reference
(
  reference_id bigint NOT NULL,
  reference_type_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  value character varying(50) NOT NULL,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stg_inttra.stg_si_reference
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_reference TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_reference TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_reference TO inttraro;

-- Table: stg_inttra.stg_si_company_contact

DROP TABLE IF EXISTS stg_inttra.stg_si_company_contact;

CREATE TABLE stg_inttra.stg_si_company_contact
(
  company_contact_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  si_company_id bigint NOT NULL,
  contact_name character varying(100) NOT NULL,
  phone character varying(40),
  fax character varying(40),
  email_address character varying(80),
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stg_inttra.stg_si_company_contact
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_company_contact TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_company_contact TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_company_contact TO inttraro;

-- Table: stg_inttra.stg_si_clause

 DROP TABLE IF EXISTS stg_inttra.stg_si_clause;

CREATE TABLE stg_inttra.stg_si_clause
(
  clause_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  clause_type_id bigint NOT NULL,
  description character varying(255),
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE stg_inttra.stg_si_clause
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_clause TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_clause TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_clause TO inttraro;

-- Table: stg_inttra.stg_si_container_seal

 DROP TABLE IF EXISTS stg_inttra.stg_si_container_seal;

CREATE TABLE stg_inttra.stg_si_container_seal
(
  container_seal_id bigint NOT NULL,
  container_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  seal_number character varying(80) NOT NULL,
  seal_issuer_type_id bigint NOT NULL,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
)

;
ALTER TABLE IF EXISTS stg_inttra.stg_si_container_seal
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_container_seal TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_container_seal TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_container_seal TO inttraro;

-- Table: stg_inttra.stg_si_commodity

DROP TABLE IF EXISTS stg_inttra.stg_si_commodity;

CREATE TABLE stg_inttra.stg_si_commodity
(
  commodity_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  cargo_description character varying(2000) NOT NULL,
  marks_and_numbers character varying(2000),
  tli_number character varying(30),
  hs_code character varying(100000),
  ncm_code_list character varying(100000),
  export_registry_number character varying(100),
  house_broker_reference character varying(100),
  export_declaration_type character varying(3),
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE stg_inttra.stg_si_commodity
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_commodity TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_commodity TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_commodity TO inttraro;


-- Table: stg_inttra.stg_si_container_commodity_map

 DROP TABLE IF EXISTS stg_inttra.stg_si_container_commodity_map;

CREATE TABLE stg_inttra.stg_si_container_commodity_map
(
  container_commodity_map_id bigint NOT NULL,
  commodity_id bigint NOT NULL,
  container_id bigint NOT NULL,
  gross_weight numeric(38,4),
  gross_weight_uom_id bigint,
  volume numeric(38,4),
  volume_uom_id bigint,
  package_type_id bigint,
  package_count bigint,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE stg_inttra.stg_si_container_commodity_map
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_container_commodity_map TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_container_commodity_map TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_container_commodity_map TO inttraro;


-- Table: stg_inttra.stg_si_document

DROP TABLE IF EXISTS stg_inttra.stg_si_document;

CREATE TABLE stg_inttra.stg_si_document
(
  document_id bigint NOT NULL,
  document_type_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  number_of_documents bigint NOT NULL,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE stg_inttra.stg_si_document
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_document TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_document TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_document TO inttraro;

-- Table: stg_inttra.stg_si_hazmat

 DROP TABLE IF EXISTS stg_inttra.stg_si_hazmat;

CREATE TABLE  stg_inttra.stg_si_hazmat
(
  hazmat_id bigint NOT NULL,
  commodity_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  imo_class_id character varying(20) NOT NULL,
  un_number character varying(80) NOT NULL,
  proper_shipping_name character varying(90),
  packing_group character varying(35),
  flash_point numeric(15,4),
  flash_point_uom_id bigint,
  emergency_contact_name character varying(100),
  emergency_contact_phone character varying(30),
  packing_details character varying(1200),
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE stg_inttra.stg_si_hazmat
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_hazmat TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_hazmat TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_hazmat TO inttraro;


-- Table: stg_inttra.stg_si_location_type

 DROP TABLE IF EXISTS stg_inttra.stg_si_location_type;

CREATE TABLE  stg_inttra.stg_si_location_type
(
  location_type_id bigint NOT NULL,
  description character varying(50) NOT NULL,
  edi_code character varying(20),
  edifact_code character varying(3),
  ansi_code character varying(3),
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE stg_inttra.stg_si_location_type
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_location_type TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_location_type TO edwudl_prod;


-- Table: stg_inttra.stg_si_payment_instruction

 DROP TABLE IF EXISTS stg_inttra.stg_si_payment_instruction;

CREATE TABLE stg_inttra.stg_si_payment_instruction
(
  payment_instruction_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  freight_term_type_id bigint NOT NULL,
  charge_type_id bigint NOT NULL,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE stg_inttra.stg_si_payment_instruction
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_payment_instruction TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_payment_instruction TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_payment_instruction TO inttraro;


-- Table: stg_inttra.stg_si_message

 DROP TABLE IF EXISTS stg_inttra.stg_si_message;

CREATE TABLE stg_inttra.stg_si_message
(
  message_id bigint NOT NULL,
  status character varying(50) NOT NULL,
  direction character varying(3) NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  received_datetime timestamp(0) without time zone NOT NULL,
  receiver_id character varying(35) NOT NULL,
  comments character varying(500),
  processed_datetime timestamp(0) without time zone,
  data character varying(100000),
  message_type character varying(10) NOT NULL,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE stg_inttra.stg_si_message
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_message TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_message TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_message TO inttraro;

-- Table: stg_inttra.stg_charge_type

 DROP TABLE IF EXISTS stg_inttra.stg_charge_type;

CREATE TABLE stg_inttra.stg_charge_type
(
  charge_type_id bigint NOT NULL,
  description character varying(50) NOT NULL,
  ansi_code character varying(20),
  edifact_code character varying(20),
  si_bl_ind_id smallint NOT NULL DEFAULT 0,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE stg_inttra.stg_charge_type
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_charge_type TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_charge_type TO edwudl_prod;

-- Table: stg_inttra.stg_etl_data_map

DROP TABLE IF EXISTS stg_inttra.stg_etl_data_map;

CREATE TABLE stg_inttra.stg_etl_data_map
(
  data_map_id bigint NOT NULL,
  table_name character varying(30) NOT NULL,
  value character varying(200) NOT NULL,
  mapped_value character varying(200) NOT NULL,
  etl_domain_id bigint NOT NULL,
  category_value character varying(200)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stg_inttra.stg_etl_data_map
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_etl_data_map TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_etl_data_map TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_etl_data_map TO inttraro;

-- Table: stg_inttra.stg_etl_data_map

 DROP TABLE IF EXISTS stg_inttra.stg_etl_data_map;

CREATE TABLE stg_inttra.stg_etl_data_map
(
  data_map_id bigint NOT NULL,
  table_name character varying(30) NOT NULL,
  value character varying(200) NOT NULL,
  mapped_value character varying(200) NOT NULL,
  etl_domain_id bigint NOT NULL,
  category_value character varying(200)
)
WITH (
  OIDS=FALSE
)
;
ALTER TABLE stg_inttra.stg_etl_data_map
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_etl_data_map TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_etl_data_map TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_etl_data_map TO inttraro;

-- Table: stg_inttra.stg_ts_container_profile

DROP TABLE IF EXISTS stg_inttra.stg_ts_container_profile;

CREATE TABLE stg_inttra.stg_ts_container_profile
(
  container_profile_code character varying(4) NOT NULL,
  container_length smallint,
  container_height numeric(4,2),
  container_type character varying(50) NOT NULL,
  gooseneck_flag character(1),
  tunnel_without_flag character(1),
  other_characteristics character varying(100),
  numeric_code_flag character(1),
  reefer_flag smallint,
  equivalent_to_code character varying(4) NOT NULL,
  ts_container_profile_id bigint,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stg_inttra.stg_ts_container_profile
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_ts_container_profile TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_ts_container_profile TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_ts_container_profile TO inttraro;

-- Table: stg_inttra.stg_company

DROP TABLE IF EXISTS stg_inttra.stg_company;

CREATE TABLE stg_inttra.stg_company
(
  company_id integer NOT NULL,
  activity_desc character varying(32),
  security_key integer NOT NULL,
  company_name character varying(80) NOT NULL,
  company_abbreviation character varying(80),
  address_id integer,
  carrier_data_id integer,
  creation_date timestamp without time zone NOT NULL,
  sector_id character varying(15),
  delete_date timestamp without time zone,
  credit_term_id integer,
  status character varying(18) NOT NULL,
  status_date timestamp without time zone NOT NULL,
  registration_id integer,
  revenue character varying(80),
  web_page character varying(80),
  listed_in_directory character(1),
  payment_cycle character varying(20),
  employees real,
  just_in_time character(1),
  iso_certified character(1),
  customers character varying(180),
  federations character varying(180),
  invoice_periodicity smallint,
  invoice_period_unit character varying(20),
  tender_admin_user_id integer,
  tender_admin_user_group_id integer,
  rate_admin_user_id integer,
  payment_method_id integer,
  receive_edi_315 character varying(1),
  edi_receipt_id character varying(35),
  company_comments character varying(800),
  pending_registration smallint,
  duns character varying(50),
  insta_book_flag integer,
  global_company_id integer,
  global_company_name character varying(80),
  approved_by_id integer,
  last_modified_by_id integer,
  industry_id integer,
  global_account_association character varying(250),
  alliance_partner_id integer,
  cuit character varying(20),
  cnpj character varying(20),
  government_id character varying(20),
  integrate_third_party_sw smallint,
  other_sw_provider character varying(50),
  external_reference_id character varying(30),
  batch_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stg_inttra.stg_company
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_company TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_company TO edwudl_prod;

-- Table: stg_inttra.stg_address

 DROP TABLE IF EXISTS stg_inttra.stg_address;

CREATE TABLE stg_inttra.stg_address
(
  address_id integer NOT NULL,
  address_type_code character varying(20),
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
  address_description character varying(200),
  comments character varying(800),
  security_key integer NOT NULL,
  usage_id smallint,
  batch_id integer NOT NULL,
  inserted_date timestamp without time zone NOT NULL,
  updated_date timestamp without time zone NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stg_inttra.stg_address
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_address TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_address TO edwudl_prod;




-- Table: stg_inttra.stg_si_company

 DROP TABLE IF EXISTS stg_inttra.stg_si_company;

CREATE TABLE stg_inttra.stg_si_company
(
  si_company_id bigint NOT NULL,
  shipping_instruction_id bigint NOT NULL,
  activity_type_id bigint NOT NULL,
  company_name character varying(80),
  company_id bigint,
  address character varying(330),
  govt_reference_number character varying(35),
  country_geo_id bigint,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stg_inttra.stg_si_company
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_company TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_company TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_company TO inttraro;


-- Table: stg_inttra.stg_subscription_transporter

-- DROP TABLE stg_inttra.stg_subscription_transporter;

CREATE TABLE stg_inttra.stg_subscription_transporter
(
  subscription_transporter_id bigint NOT NULL,
  subscription_interface_id bigint NOT NULL,
  created_by_user_id bigint NOT NULL,
  created_date timestamp(0) without time zone NOT NULL,
  modified_by_user_id bigint NOT NULL,
  modified_date timestamp(0) without time zone NOT NULL,
  detail character varying(200) NOT NULL,
  company_name character varying(80) NOT NULL,
  active bigint NOT NULL,
  path character varying(200),
  company_id bigint,
  subscription_format_id bigint,
  business_partner_service_id bigint,
  batch_id integer,
  inserted_date timestamp(0) without time zone,
  updated_date timestamp(0) without time zone
);
ALTER TABLE stg_inttra.stg_subscription_transporter
  OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_subscription_transporter TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_subscription_transporter TO edwudl_prod;



-- DROP TABLE stg_inttra.stg_si_activity_type;

CREATE TABLE stg_inttra.stg_si_activity_type
(
 activity_type_id bigint NOT NULL,
 description character varying(50) NOT NULL,
 edi_code character varying(20),
 edifact_code character varying(3),
 ansi_code character varying(3),
 batch_id integer,
 inserted_date timestamp(0) without time zone,
 updated_date timestamp(0) without time zone
)
;
ALTER TABLE stg_inttra.stg_si_activity_type
 OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_si_activity_type TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_si_activity_type TO edwudl_prod;

-- DROP TABLE stg_inttra.stg_bk_container_type;

CREATE TABLE stg_inttra.stg_bk_container_type
(
 container_type_id smallint NOT NULL,
 container_type_code character varying(4) NOT NULL,
 container_type_group_code character varying(4) NOT NULL,
 container_type_category_id smallint NOT NULL,
 description character varying(125) NOT NULL,
 non_standard_type_flag smallint NOT NULL,
 container_spare_indicator smallint,
 non_standard_supp_company_id bigint,
 container_list_height character varying(10),
 container_list_length character varying(10),
 container_list_width character varying(10),
 container_list_form character varying(35),
 display_on_ui smallint NOT NULL,
 ui_description character varying(100),
 oog_flag smallint NOT NULL,
 batch_id integer,
 inserted_date timestamp(0) without time zone,
 updated_date timestamp(0) without time zone
)
;
ALTER TABLE stg_inttra.stg_bk_container_type
 OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_bk_container_type TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_bk_container_type TO edwudl_prod;
GRANT SELECT ON TABLE stg_inttra.stg_bk_container_type TO inttraro;


CREATE TABLE stg_inttra.stg_es_imo_class
(
 imo_class_id character varying(20) NOT NULL,
 name character varying(80) NOT NULL,
 description character varying(255),
 name_resource_id character varying(32),
 description_resource_id character varying(32),
 batch_id integer,
 inserted_date timestamp(0) without time zone,
 updated_date timestamp(0) without time zone
)
;
ALTER TABLE stg_inttra.stg_es_imo_class
 OWNER TO edwstg_prod;
GRANT ALL ON TABLE stg_inttra.stg_es_imo_class TO edwstg_prod;
GRANT SELECT ON TABLE stg_inttra.stg_es_imo_class TO edwudl_prod;

