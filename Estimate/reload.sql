% Usage:	isql read reload.sql
%
% This command file reloads a database that was unloaded using "dbunload".
%
% (version:  5.5.01 Build #1333)
%

SET OPTION Statistics = 3
go
SET OPTION Date_order = 'YMD'
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Create userids and grant user permissions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

GRANT CONNECT TO "DBA" IDENTIFIED BY "SQL"
go
GRANT RESOURCE, DBA, SCHEDULE TO "DBA"
go
GRANT CONNECT TO "sysadm" IDENTIFIED BY "sysadm"
go
GRANT DBA TO "sysadm"
go
commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Create user-defined types
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Create tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CREATE TABLE "DBA"."pbcattbl"
(
	"pbt_tnam"      		char(129) NULL,
	"pbt_tid"       		integer NULL,
	"pbt_ownr"      		char(129) NULL,
	"pbd_fhgt"      		smallint NULL,
	"pbd_fwgt"      		smallint NULL,
	"pbd_fitl"      		char(1) NULL,
	"pbd_funl"      		char(1) NULL,
	"pbd_fchr"      		smallint NULL,
	"pbd_fptc"      		smallint NULL,
	"pbd_ffce"      		char(18) NULL,
	"pbh_fhgt"      		smallint NULL,
	"pbh_fwgt"      		smallint NULL,
	"pbh_fitl"      		char(1) NULL,
	"pbh_funl"      		char(1) NULL,
	"pbh_fchr"      		smallint NULL,
	"pbh_fptc"      		smallint NULL,
	"pbh_ffce"      		char(18) NULL,
	"pbl_fhgt"      		smallint NULL,
	"pbl_fwgt"      		smallint NULL,
	"pbl_fitl"      		char(1) NULL,
	"pbl_funl"      		char(1) NULL,
	"pbl_fchr"      		smallint NULL,
	"pbl_fptc"      		smallint NULL,
	"pbl_ffce"      		char(18) NULL,
	"pbt_cmnt"      		varchar(254) NULL
)
go
CONNECT "DBA" IDENTIFIED BY "SQL"
go
CONNECT "sysadm"
go
GRANT SELECT, INSERT, DELETE, UPDATE, ALTER, REFERENCES ON "DBA"."pbcattbl" TO "PUBLIC"
go
CONNECT "DBA" IDENTIFIED BY "SQL"
go
CREATE TABLE "DBA"."pbcatcol"
(
	"pbc_tnam"      		char(129) NULL,
	"pbc_tid"       		integer NULL,
	"pbc_ownr"      		char(129) NULL,
	"pbc_cnam"      		char(129) NULL,
	"pbc_cid"       		smallint NULL,
	"pbc_labl"      		varchar(254) NULL,
	"pbc_lpos"      		smallint NULL,
	"pbc_hdr"       		varchar(254) NULL,
	"pbc_hpos"      		smallint NULL,
	"pbc_jtfy"      		smallint NULL,
	"pbc_mask"      		varchar(31) NULL,
	"pbc_case"      		smallint NULL,
	"pbc_hght"      		smallint NULL,
	"pbc_wdth"      		smallint NULL,
	"pbc_ptrn"      		varchar(31) NULL,
	"pbc_bmap"      		char(1) NULL,
	"pbc_init"      		varchar(254) NULL,
	"pbc_cmnt"      		varchar(254) NULL,
	"pbc_edit"      		varchar(31) NULL,
	"pbc_tag"       		varchar(254) NULL
)
go
CONNECT "DBA" IDENTIFIED BY "SQL"
go
CONNECT "sysadm"
go
GRANT SELECT, INSERT, DELETE, UPDATE, ALTER, REFERENCES ON "DBA"."pbcatcol" TO "PUBLIC"
go
CONNECT "DBA" IDENTIFIED BY "SQL"
go
CREATE TABLE "DBA"."pbcatfmt"
(
	"pbf_name"      		varchar(30) NULL,
	"pbf_frmt"      		varchar(254) NULL,
	"pbf_type"      		smallint NULL,
	"pbf_cntr"      		integer NULL
)
go
CONNECT "DBA" IDENTIFIED BY "SQL"
go
CONNECT "sysadm"
go
GRANT SELECT, INSERT, DELETE, UPDATE, ALTER, REFERENCES ON "DBA"."pbcatfmt" TO "PUBLIC"
go
CONNECT "DBA" IDENTIFIED BY "SQL"
go
CREATE TABLE "DBA"."pbcatvld"
(
	"pbv_name"      		varchar(30) NULL,
	"pbv_vald"      		varchar(254) NULL,
	"pbv_type"      		smallint NULL,
	"pbv_cntr"      		integer NULL,
	"pbv_msg"       		varchar(254) NULL
)
go
CONNECT "DBA" IDENTIFIED BY "SQL"
go
CONNECT "sysadm"
go
GRANT SELECT, INSERT, DELETE, UPDATE, ALTER, REFERENCES ON "DBA"."pbcatvld" TO "PUBLIC"
go
CONNECT "DBA" IDENTIFIED BY "SQL"
go
CREATE TABLE "DBA"."pbcatedt"
(
	"pbe_name"      		varchar(30) NULL,
	"pbe_edit"      		varchar(254) NULL,
	"pbe_type"      		smallint NULL,
	"pbe_cntr"      		integer NULL,
	"pbe_seqn"      		smallint NULL,
	"pbe_flag"      		integer NULL,
	"pbe_work"      		char(32) NULL
)
go
CONNECT "DBA" IDENTIFIED BY "SQL"
go
CONNECT "sysadm"
go
GRANT SELECT, INSERT, DELETE, UPDATE, ALTER, REFERENCES ON "DBA"."pbcatedt" TO "PUBLIC"
go
CONNECT "DBA" IDENTIFIED BY "SQL"
go
CREATE TABLE "DBA"."custtab"
(
	"account"       		varchar(10) NOT NULL,
	"company"       		varchar(30) NULL,
	"address1"      		varchar(30) NULL,
	"address2"      		varchar(30) NULL,
	"city"  			varchar(20) NULL,
	"state" 			varchar(2) NULL,
	"phone" 			varchar(17) NULL,
	"zip"   			smallint NULL,
	PRIMARY KEY ("account")
)
go
CREATE TABLE "DBA"."jobs"
(
	"estimate_no"   		integer NOT NULL,
	"account"       		varchar(10) NULL,
	"date"  			timestamp NULL,
	"description"   		varchar(100) NULL,
	"title" 			varchar(100) NULL,
	"press_work"    		varchar(255) NULL,
	"size_flat"     		varchar(255) NULL,
	"finishing"     		varchar(340) NULL,
	"color" 			varchar(255) NULL,
	"folded"        		varchar(255) NULL,
	"cover" 			varchar(255) NULL,
	"art_work"      		varchar(340) NULL,
	"msheets_1"     		numeric(18,4) NULL,
	"length_1"      		integer NULL,
	"width_1"       		integer NULL,
	"mweight_1"     		integer NULL,
	"price_1"       		numeric(18,4) NULL,
	"prep"  			varchar(255) NULL,
	"printing"      		varchar(255) NULL,
	"bind"  			varchar(255) NULL,
	"miscy" 			varchar(255) NULL,
	"msheets_2"     		numeric(18,4) NULL,
	"msheets_3"     		numeric(18,4) NULL,
	"msheets_4"     		numeric(18,4) NULL,
	"length_2"      		integer NULL,
	"length_3"      		integer NULL,
	"length_4"      		integer NULL,
	"width_2"       		integer NULL,
	"width_3"       		integer NULL,
	"width_4"       		integer NULL,
	"mweight_2"     		integer NULL,
	"mweight_3"     		integer NULL,
	"mweight_4"     		integer NULL,
	"price_2"       		numeric(18,4) NULL,
	"price_3"       		numeric(18,4) NULL,
	"price_4"       		numeric(18,4) NULL,
	"total_1"       		numeric(18,4) NULL,
	"total_2"       		numeric(18,4) NULL,
	"total_3"       		numeric(18,4) NULL,
	"total_4"       		numeric(18,4) NULL,
	"supplier_stock"        	varchar(30) NULL,
	"supplier_prep" 		varchar(30) NULL,
	"supplier_printing"     	varchar(30) NULL,
	"supplier_bind" 		varchar(30) NULL,
	"supplier_misc" 		varchar(30) NULL,
	"q1s"   			numeric(18,4) NULL,
	"q2s"   			numeric(18,4) NULL,
	"q3s"   			numeric(18,4) NULL,
	"q4s"   			numeric(18,4) NULL,
	"q5s"   			numeric(18,4) NULL,
	"q1pre" 			numeric(18,4) NULL,
	"q2pre" 			numeric(18,4) NULL,
	"q3pre" 			numeric(18,4) NULL,
	"q4pre" 			numeric(18,4) NULL,
	"q5pre" 			numeric(18,4) NULL,
	"q1pri" 			numeric(18,4) NULL,
	"q2pri" 			numeric(18,4) NULL,
	"q3pri" 			numeric(18,4) NULL,
	"q4pri" 			numeric(18,4) NULL,
	"q5pri" 			numeric(18,4) NULL,
	"q1b"   			numeric(18,4) NULL,
	"q2b"   			numeric(18,4) NULL,
	"q3b"   			numeric(18,4) NULL,
	"q4b"   			numeric(18,4) NULL,
	"q5b"   			numeric(18,4) NULL,
	"q1m"   			numeric(18,4) NULL,
	"q2m"   			numeric(18,4) NULL,
	"q3m"   			numeric(18,4) NULL,
	"q4m"   			numeric(18,4) NULL,
	"q5m"   			numeric(18,4) NULL,
	"q1pro" 			numeric(18,4) NULL,
	"q2pro" 			numeric(18,4) NULL,
	"q3pro" 			numeric(18,4) NULL,
	"q4pro" 			numeric(18,4) NULL,
	"q5pro" 			numeric(18,4) NULL,
	"final_quantity"        	integer NULL,
	"final_cost"    		numeric(18,4) NULL,
	"final_tax"     		numeric(18,4) NULL,
	"final_invoice_no"      	integer NULL,
	"final_po"      		integer NULL,
	"final_date"    		timestamp NULL,
	"final_feight"  		numeric(18,4) NULL,
	"contact"       		varchar(60) NULL,
	"job_no"        		integer NULL,
	"copy_estimate_no"      	integer NULL,
	"pages" 			varchar(30) NULL,
	"qty_1" 			varchar(10) NULL,
	"qty_2" 			varchar(10) NULL,
	"qty_3" 			varchar(10) NULL,
	"qty_4" 			varchar(10) NULL,
	"qty_5" 			varchar(10) NULL,
	"msheets_5"     		numeric(18,4) NULL,
	"length_5"      		integer NULL,
	"width_5"       		integer NULL,
	"mweight_5"     		integer NULL,
	"price_5"       		numeric(18,4) NULL,
	"q1pre2"        		numeric(18,4) NULL,
	"q2pre2"        		numeric(18,4) NULL,
	"q3pre2"        		numeric(18,4) NULL,
	"q4pre2"        		numeric(18,4) NULL,
	"q5pre2"        		numeric(18,4) NULL,
	"q1pri2"        		numeric(18,4) NULL,
	"q2pri2"        		numeric(18,4) NULL,
	"q3pri2"        		numeric(18,4) NULL,
	"q4pri2"        		numeric(18,4) NULL,
	"q5pri2"        		numeric(18,4) NULL,
	"q1b2"  			numeric(18,4) NULL,
	"q2b2"  			numeric(18,4) NULL,
	"q3b2"  			numeric(18,4) NULL,
	"q4b2"  			numeric(18,4) NULL,
	"q5b2"  			numeric(18,4) NULL,
	"q1m2"  			numeric(18,4) NULL,
	"q2m2"  			numeric(18,4) NULL,
	"q3m2"  			numeric(18,4) NULL,
	"q4m2"  			numeric(18,4) NULL,
	"q5m2"  			numeric(18,4) NULL,
	"q1per" 			numeric(18,4) NULL,
	"q2per" 			numeric(18,4) NULL,
	"q3per" 			numeric(18,4) NULL,
	"q4per" 			numeric(18,4) NULL,
	"q5per" 			numeric(18,4) NULL,
	"q1con" 			numeric(18,4) NULL,
	"q2con" 			numeric(18,4) NULL,
	"q3con" 			numeric(18,4) NULL,
	"q4con" 			numeric(18,4) NULL,
	"q5con" 			numeric(18,4) NULL,
	"q1com" 			numeric(18,4) NULL,
	"q2com" 			numeric(18,4) NULL,
	"q3com" 			numeric(18,4) NULL,
	"q4com" 			numeric(18,4) NULL,
	"q5com" 			numeric(18,4) NULL,
	"notes" 			varchar(255) NULL,
	"r1c1"  			numeric(18,4) NULL,
	"r1c2"  			numeric(18,4) NULL,
	"r1c3"  			numeric(18,4) NULL,
	"r1c4"  			numeric(18,4) NULL,
	"r1c5"  			numeric(18,4) NULL,
	"r2c1"  			numeric(18,4) NULL,
	"r2c2"  			numeric(18,4) NULL,
	"r2c3"  			numeric(18,4) NULL,
	"r2c4"  			numeric(18,4) NULL,
	"r2c5"  			numeric(18,4) NULL,
	"r3c1"  			numeric(18,4) NULL,
	"r3c2"  			numeric(18,4) NULL,
	"r3c3"  			numeric(18,4) NULL,
	"r3c4"  			numeric(18,4) NULL,
	"r3c5"  			numeric(18,4) NULL,
	"r4c1"  			numeric(18,4) NULL,
	"r4c2"  			numeric(18,4) NULL,
	"r4c3"  			numeric(18,4) NULL,
	"r4c4"  			numeric(18,4) NULL,
	"r4c5"  			numeric(18,4) NULL,
	"r5c1"  			numeric(18,4) NULL,
	"r5c2"  			numeric(18,4) NULL,
	"r5c3"  			numeric(18,4) NULL,
	"r5c4"  			numeric(18,4) NULL,
	"r5c5"  			numeric(18,4) NULL,
	"final_price"   		numeric(18,4) NULL,
	"price_addl"    		varchar(200) NULL,
	"final_description"     	varchar(255) NULL,
	"profit_per"    		numeric(18,4) NULL,
	"stock" 			varchar(255) NULL,
	"supplier_stock2"       	varchar(30) NULL,
	"supplier_stock3"       	varchar(30) NULL,
	"supplier_stock4"       	varchar(30) NULL,
	"supplier_stock5"       	varchar(30) NULL,
	"supplier_prep2"        	varchar(30) NULL,
	"supplier_printing2"    	varchar(30) NULL,
	"supplier_bind2"        	varchar(30) NULL,
	"supplier_misc2"        	varchar(30) NULL,
	"final_notes"   		varchar(255) NULL,
	"msheets_6"     		integer NULL,
	"length_6"      		integer NULL,
	"width_6"       		integer NULL,
	"mweight_6"     		integer NULL,
	"price_6"       		numeric(18,4) NULL,
	"stock_6"       		char(30) NULL,
	"q6s"   			numeric(18,4) NULL,
	"r6c1"  			numeric(18,4) NULL,
	"r6c2"  			numeric(18,4) NULL,
	"r6c3"  			numeric(18,4) NULL,
	"r6c4"  			numeric(18,4) NULL,
	"r6c5"  			numeric(18,4) NULL,
	"r1c6"  			numeric(18,4) NULL,
	"r2c6"  			numeric(18,4) NULL,
	"r3c6"  			numeric(18,4) NULL,
	"r4c6"  			numeric(18,4) NULL,
	"r5c6"  			numeric(18,4) NULL,
	"r6c6"  			numeric(18,4) NULL,
	"q6pre" 			numeric(18,4) NULL,
	"q6pre2"        		numeric(18,4) NULL,
	"q6pri" 			numeric(18,4) NULL,
	"q6pri2"        		numeric(18,4) NULL,
	"q6b"   			numeric(18,4) NULL,
	"q6b2"  			numeric(18,4) NULL,
	"q6m"   			numeric(18,4) NULL,
	"q6m2"  			numeric(18,4) NULL,
	"q6com" 			numeric(18,4) NULL,
	"q6con" 			numeric(18,4) NULL,
	"supplier_prep3"        	char(30) NULL,
	"q1pre3"        		numeric(18,4) NULL,
	"q2pre3"        		numeric(18,4) NULL,
	"q3pre3"        		numeric(18,4) NULL,
	"q4pre3"        		numeric(18,4) NULL,
	"q5pre3"        		numeric(18,4) NULL,
	"q6pre3"        		numeric(18,4) NULL,
	"supplier_printing3"    	char(30) NULL,
	"q1pri3"        		numeric(18,4) NULL,
	"q2pri3"        		numeric(18,4) NULL,
	"q3pri3"        		numeric(18,4) NULL,
	"q4pri3"        		numeric(18,4) NULL,
	"q5pri3"        		numeric(18,4) NULL,
	"q6pri3"        		numeric(18,4) NULL,
	"supplier_bind3"        	char(30) NULL,
	"q1b3"  			numeric(18,4) NULL,
	"q2b3"  			numeric(18,4) NULL,
	"q3b3"  			numeric(18,4) NULL,
	"q4b3"  			numeric(18,4) NULL,
	"q5b3"  			numeric(18,4) NULL,
	"q6b3"  			numeric(18,4) NULL,
	"supplier_misc3"        	char(30) NULL,
	"q1m3"  			numeric(18,4) NULL,
	"q2m3"  			numeric(18,4) NULL,
	"q3m3"  			numeric(18,4) NULL,
	"q4m3"  			numeric(18,4) NULL,
	"q5m3"  			numeric(18,4) NULL,
	"q6m3"  			numeric(18,4) NULL,
	"qty_6" 			varchar(10) NULL,
	PRIMARY KEY ("estimate_no")
)
go
commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Reload data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

LOAD TABLE "DBA"."pbcattbl"
	FROM 'c:\\estimate\\43.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pbcatcol"
	FROM 'c:\\estimate\\44.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pbcatfmt"
	FROM 'c:\\estimate\\45.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pbcatvld"
	FROM 'c:\\estimate\\46.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pbcatedt"
	FROM 'c:\\estimate\\47.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."custtab"
	FROM 'c:\\estimate\\48.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."jobs"
	FROM 'c:\\estimate\\49.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	DELIMITED BY ','
go
commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Add foreign key definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CREATE UNIQUE INDEX "pbcatt_x" ON "DBA"."pbcattbl"
(
	"pbt_tnam" ASC,
	"pbt_ownr" ASC
)
go
CREATE UNIQUE INDEX "pbcatc_x" ON "DBA"."pbcatcol"
(
	"pbc_tnam" ASC,
	"pbc_ownr" ASC,
	"pbc_cnam" ASC
)
go
CREATE UNIQUE INDEX "pbcatf_x" ON "DBA"."pbcatfmt"
(
	"pbf_name" ASC
)
go
CREATE UNIQUE INDEX "pbcatv_x" ON "DBA"."pbcatvld"
(
	"pbv_name" ASC
)
go
CREATE UNIQUE INDEX "pbcate_x" ON "DBA"."pbcatedt"
(
	"pbe_name" ASC,
	"pbe_seqn" ASC
)
go
commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Create functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Create views
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Set option values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


SET OPTION Statistics =
go
SET OPTION Date_order =
go


%
%SQL Option Statements for user 
%

SET OPTION "DBA"."Isolation_level" = '0'
go


%
%SQL Option Statements for user 
%

SET OPTION "PUBLIC"."Blocking" = 'On'
go
SET OPTION "PUBLIC"."Checkpoint_time" = '60'
go
SET OPTION "PUBLIC"."Conversion_error" = 'On'
go
SET OPTION "PUBLIC"."Timestamp_format" = 'YYYY-MM-DD HH:NN:SS.SSS'
go
SET OPTION "PUBLIC"."Time_format" = 'HH:NN:SS.SSS'
go
SET OPTION "PUBLIC"."Date_format" = 'YYYY-MM-DD'
go
SET OPTION "PUBLIC"."Date_order" = 'YMD'
go
SET OPTION "PUBLIC"."Isolation_level" = '0'
go
SET OPTION "PUBLIC"."Precision" = '30'
go
SET OPTION "PUBLIC"."Recovery_time" = '2'
go
SET OPTION "PUBLIC"."Row_counts" = 'Off'
go
SET OPTION "PUBLIC"."Scale" = '6'
go
SET OPTION "PUBLIC"."Thread_count" = '0'
go
SET OPTION "PUBLIC"."Wait_for_commit" = 'Off'
go
SET OPTION "PUBLIC"."Auto_commit" = 'Off'
go
SET OPTION "PUBLIC"."Auto_refetch" = 'On'
go
SET OPTION "PUBLIC"."Bell" = 'On'
go
SET OPTION "PUBLIC"."Commit_on_exit" = 'On'
go
SET OPTION "PUBLIC"."Echo" = 'On'
go
SET OPTION "PUBLIC"."Headings" = 'On'
go
SET OPTION "PUBLIC"."Input_format" = 'ASCII'
go
SET OPTION "PUBLIC"."ISQL_log" = ''
go
SET OPTION "PUBLIC"."NULLS" = '(NULL)'
go
SET OPTION "PUBLIC"."On_error" = 'Prompt'
go
SET OPTION "PUBLIC"."Output_format" = 'ASCII'
go
SET OPTION "PUBLIC"."Output_length" = '0'
go
SET OPTION "PUBLIC"."Screen_format" = 'Text'
go
SET OPTION "PUBLIC"."Statistics" = '3'
go
SET OPTION "PUBLIC"."Truncation_length" = '30'
go
commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Create user messages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Create procedures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Create triggers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Create SQL remote definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

commit work
go


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Check view definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

GRANT CONNECT TO "DBA" IDENTIFIED BY "SQL"
go
commit work
go

