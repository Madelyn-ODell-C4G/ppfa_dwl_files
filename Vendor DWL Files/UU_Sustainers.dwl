output application/json
---
payload map (item,index) -> ({
	transaction_id: item.transaction_id default (correlationId ++ "_" ++ item.file_name ++ "_" ++ item.rownumber),
	rownumber: item.row_number default null,
	status: "Data parsed into Staging Table",
	last_modified_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	upload_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	file_name: item.file_name default null,

	batch_upload_household_account_matched: item.batch_upload_account_matched default null,

	account_1_name: item.account_name default null,

	giving_tax_entity:
        (item.file_name) match {
            case file if file contains 'C3' -> 'C3'
            case file if file contains 'C4' -> 'C4'
            case file if file contains 'PAC' -> 'PAC'
            else -> null
        },
	payment_deposit_date: item.custom_deposit_date default null,
	giving_number: item.giving_giving default null,
	payment_method: item.payment_method_payment_type default null, 
	payment_deposit_ref_number: item.custom_deposit_ref_number default null,
	giving_amount: if(item.giving_giving_amount == null or item.giving_giving_amount == '') null else item.giving_giving_amount as Number default null,
	giving_name: (item.file_name as String default '') ++ ":" ++ (item.rownumber default (index + 1)),
	giving_close_date: item.giving_close_date default null,
    batch_upload_giving_matched: item.batch_upload_giving_matched default null,
	vendor_name: "AFFILIATE-SUST",
    
	vendor_type: "User Upload"

})