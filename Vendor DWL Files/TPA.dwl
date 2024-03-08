output application/json
---
payload map (item,index) -> ({
	//transaction_id: item.transaction_id default (correlationId ++ "_" ++ item.file_name ++ "_" ++ item.rownumber),
	transaction_id: item.transaction_id default (correlationId ++ "_" ++ item.file_name ++ "_" ++ (item.rownumber default (index + 1))),
	rownumber: item.rownumber default null,
	status: "Data parsed into Staging Table",
	last_modified_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	upload_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	file_name: item.file_name default null,
	account_1_name: item.employertpaname default null,
	payment_id: item.opportunityguid default null,
	credit_soft_credit_type: item.softcredittype default null,

	address_type: if(item.employeeaddressline1 != '') (item.employeemailingaddresstype match {
        case "Work" -> "Business"
		case "Home" -> "Home"
		case null -> "Home"
        case "" -> "Home"
        else -> "Other"
    }) else null,


	contact_1_address_street_line_1: item.employeeaddressline1 default null,
	contact_1_address_street_line_2: item.employeeaddressline2 default null,
	contact_1_city: item.employeecity default null,
	contact_1_state_province: item.employeestate default null,
	contact_1_zip: item.employeezip default null,
	contact_1_country: item.employeecountry default 'USA',
	contact_1_first_name: item.employeefirstname default null,
	contact_1_last_name: item.employeelastname default null,
	contact_1_phone: item.employeephonenumber default null,
	contact_1_phone_type: if(item.employeephonenumber != null and item.employeephonenumber != '')  
							if(item.employeeemailaddress != null and item.employeeemailaddress != '') (lower(item.employeemailaddresstype) match {
								case "work" -> "Business"
								case "home" -> "Home"
								case null -> "Home"
								case "" -> "Home"
								else -> item.employeeemailaddresstype default "Home"
							})
							else if(item.employeemailingaddresstype != null and item.employeemailingaddresstype != '') (lower(item.employeemailingaddresstype) match {
								case "work" -> "Business"
								case "home" -> "Home"
								case null -> "Home"
								case "" -> "Home"
								else -> item.employeemailingaddresstype default "Home"
							})
						  else null
	contact_1_email: item.employeeemailaddress default null,
	contact_1_email_type: if(item.employeeemailaddress != null and item.employeeemailaddress != '') (lower(item.employeeemailaddresstype) match {
							case "work" -> "Business"
							case "home" "Home"
							case null -> "Home"
							case "" -> "Home"
							else -> item.employeeemailaddresstype
 						  }) else null,
	contact_1_employer_name: item.employertpaname default null,
	giving_name: (item.file_name default '') ++ ":" ++ (item.rownumber default (index + 1)),
	giving_tax_entity:
        (item.file_name) match {
            case file if upper(file) contains 'C3' -> 'C3'
            case file if upper(file) contains 'C4' -> 'C4'
            case file if upper(file) contains 'PAC' -> 'PAC'
            else -> null
        },
	credit_amount: item.giftamount default null,
	affiliate_name: (((item.file_name) splitBy "_") filter ( $ contains 'PP'))[0] default 'PPFA',
	vendor_name: ((item.file_name) splitBy "_")[0],
	vendor_type: "TPA"
})