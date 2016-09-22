insert into ext_inttra.wrt_ext_udl_address select * from udl.udl_address;
insert into ext_inttra.wrt_ext_udl_company_location  select * from udl.udl_company_location;
insert into ext_inttra.wrt_ext_udl_si_party_reference  select spr.* from udl.udl_si_party_reference spr inner join udl.udl_si s on s.udl_si_id = spr.udl_si_id where  s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_security select * from udl.udl_security;
insert into ext_inttra.wrt_ext_udl_company_role select * from udl.udl_company_role;
insert into ext_inttra.wrt_ext_udl_si_hazmat_contact select shc.* from udl.udl_si_hazmat_contact shc inner join udl.udl_si s on s.udl_si_id = shc.udl_si_id  where  s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_party_communication select spc.* from udl.udl_si_party_communication spc inner join udl.udl_si s on s.udl_si_id = spc.udl_si_id  where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_current select distinct sc.* from udl.udl_si_current sc inner join udl.udl_si s on s.original_si_id = sc.original_si_id where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_document select sd.* from udl.udl_si_document sd inner join udl.udl_si s on s.udl_si_id = sd.udl_si_id where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_clause select sc.* from udl.udl_si_clause sc inner join udl.udl_si s on s.udl_si_id = sc.udl_si_id  where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_hazmat_communication select shc.* from udl.udl_si_hazmat_communication shc inner join udl.udl_si s on s.udl_si_id = shc.udl_si_id  where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_line_item select sli.* from udl.udl_si_line_item sli inner join udl.udl_si s on s.udl_si_id = sli.udl_si_id where  s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_party_contact select spc.* from udl.udl_si_party_contact spc inner join udl.udl_si s on s.udl_si_id = spc.udl_si_id where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_hazmat select sh.* from udl.udl_si_hazmat sh inner join udl.udl_si s on s.udl_si_id = sh.udl_si_id 
where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_container select sc.* from udl.udl_si_container sc inner join udl.udl_si s on s.udl_si_id = sc.udl_si_id  
where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_security_detail select * from udl.udl_security_detail;
insert into ext_inttra.wrt_ext_udl_si_reference select sr.* from udl.udl_si_reference sr inner join udl.udl_si s on s.udl_si_id = sr.udl_si_id  where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si  select *  from udl.udl_si   where data_source= 'LEGACY' and partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_payment_instruction select spi.* from udl.udl_si_payment_instruction spi inner join udl.udl_si s on s.udl_si_id = spi.udl_si_id where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_container_line_item select scl.* from udl.udl_si_container_line_item scl inner join udl.udl_si s on s.udl_si_id = scl.udl_si_id where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_line_item_reference select slr.* from udl.udl_si_line_item_reference slr inner join udl.udl_si s on s.udl_si_id = slr.udl_si_id where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_party select sp.* from udl.udl_si_party sp inner join udl.udl_si s on s.udl_si_id = sp.udl_si_id  where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';
insert into ext_inttra.wrt_ext_udl_si_line_item_attribute select sla.* from udl.udl_si_line_item_attribute sla inner join udl.udl_si s on s.udl_si_id = sla.udl_si_id  where s.data_source= 'LEGACY' and s.partition_date >='2015/01/01';










