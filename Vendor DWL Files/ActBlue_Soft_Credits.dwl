output application/json
---
payload map (item,index) -> ({
	transaction_id: item.transaction_id default (correlationId ++ "_" ++ item.file_name ++ "_" ++ (item.rownumber default (index + 1))),
	rownumber: item.rownumber default (index + 1),
	status: "Data parsed into Staging Table",
	last_modified_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	upload_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	file_name: item.file_name default null,
	credit_soft_credit_type: 'SC / Soft Credit',

	address_type: if(item.donor_addr1 != null) "Home" else null,

	contact_1_address_street_line_1: item.donor_addr1 default null,

	contact_1_address_street_line_2: item.donor_addr2 default null,

	contact_1_city: item.donor_city default null,

	contact_1_state_province: item.donor_state default null,

	contact_1_zip: item.donor_zip default null,

	contact_1_country: item.donor_country default 'USA',

	contact_1_first_name: item.donor_first_name default null,

	contact_1_last_name: item.donor_last_name default null,

	contact_1_phone: item.donor_phone default null,

	contact_1_phone_type: if(item.donor_phone != null) "Home" else null,

	contact_1_email: item.donor_email default null,

	contact_1_email_type: if(item.donor_email != null) "Home" else null,

	contact_1_occupation: item.donor_occupation default null,

	contact_1_employer_name: item.donor_employer default null,

	giving_tax_entity:
        (item.file_name) match {
            case file if file contains 'america-46954' -> 'C3'
            case file if file contains 'action-fund-28872' -> 'C4'
            else -> null
        },

	giving_number: ("AB" ++ item.check_number) default null, 


    giving_comments: " Payment_ID - " ++ item.payment_id default null,
	payment_reciept_id: item.receipt_id default null,

    payment_id: item.payment_id default null,

	vendor_name: "ActBlue",
	vendor_type: "TPA",
	credit_1_amount: item.amount default null,
	lineitem_id: item.lineitem_id,
	credit_1_external_id: if(item.receipt_id != null and item.lineitem_id != null)(item.receipt_id ++ "-" ++ item.lineitem_id) else null,
	giving_name: (item.file_name as String default '') ++ ":" ++ (item.receipt_id as String default '')
}) 