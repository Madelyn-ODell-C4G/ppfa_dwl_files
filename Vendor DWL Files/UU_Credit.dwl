output application/json
---
payload map (item,index) -> ({
	transaction_id: item.transaction_id default (correlationId ++ "_" ++ item.file_name ++ "_" ++ item.rownumber),
	rownumber: item.rownumber default (index + 1),
	status: "Data parsed into Staging Table",
	last_modified_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	upload_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	file_name: item.file_name default null,

	credit_opportunity_id: item.opportunity_id default null,
	credit_account_id: item.soft_credit_account_id default null,
	credit_amount: item.soft_credit_amount default null,
	credit_soft_credit_type: item.soft_credit_type  replace "/" with "\/" default null,
	credit_event_campaign_id: item.event_campaign default null,
	credit_comments: item.comments default null,
	credit_ack_code: item.acknowledgement_code default null,
	credit_ack_date: item.acknowledged_date default null,
	credit_acknowledged: item.acknowledged default false,
	credit_no_ack: item.no_acknowledgement default false,

	contact_1_address_street_line_1: item.address_line_1 default null,
	contact_1_address_street_line_2: item.address_line_2 default null,
	address_type: if(item.phone != null and item.phone != '') 
                        ((lower(item.phone_type)) match {
                             case 'work' -> 'Business'
                             else -> item.phone_type default 'Home'
                            }) 
				  else if(item.e_mail != null and item.e_mail != '') 
                            ((lower(item.e_mail_type)) match {
                             case 'work' -> 'Business'
                             else -> item.e_mail_type default 'Home'
                            }) 
                  else null,
	contact_1_city: item.address_city default null,
	contact_1_state_province: item.address_state default null,
	contact_1_zip: item.address_zip default null,
	contact_1_country: item.address_country default 'USA',
	contact_1_first_name: item.first_name default null,
	contact_1_last_name: item.last_name default null,
	contact_1_phone: item.phone default null,
	contact_1_phone_type: if(item.phone != null and item.phone != '') 
                            ((lower(item.phone_type)) match {
                             case 'work' -> 'Business'
                             else -> item.phone_type default 'Home'
                            }) 
                          else null,
	contact_1_email: item.e_mail default null,
	contact_1_email_type: if(item.e_mail != null and item.e_mail != '') 
                            ((lower(item.e_mail_type)) match {
                             case 'work' -> 'Business'
                             else -> item.e_mail_type default 'Home'
                            }) 
                          else null,
	giving_name: (item.file_name as String default '') ++ ":" ++ (item.rownumber default (index + 1)),
	vendor_name: "AFFILIATE-CRED",
	vendor_type: "User Upload"
})