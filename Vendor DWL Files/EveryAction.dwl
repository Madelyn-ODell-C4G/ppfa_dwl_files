import * from dw::core::Strings
output application/json
---
payload map (item,index) -> ({
	transaction_id: item.transaction_id default (correlationId ++ "_" ++ item.file_name ++ "_" ++ (item.rownumber default (index + 1))),
	rownumber: item.rownumber default (index + 1),
	status: "Data parsed into Staging Table",
	last_modified_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	upload_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	file_name: item.file_name default null,
	alternate_id: item.alternateid default null,
	alt_id_email: item.email default null,

	address_type: if(item.addressstreetline1 != null and item.addressstreetline1 != '') (item.addresstype match {
        case "W" -> "Business"
		case "H" -> "Home"
        else -> "Home"
    }) else null,
	acquired_batch_sequence: item.batchuploadsequencenumber default null,
	payment_source_code: item.campaignsource default null,
	contact_1_address_street_line_1: item.addressstreetline1 default null,
	contact_1_address_street_line_2: item.addressstreetline2 default null,
	contact_1_city: item.addresscity default null,
	contact_1_state_province: item.addressstate default null,
	contact_1_zip: item.addresspostalcode default null,
	contact_1_zip_plus_4: item.addresszipplus4 default null,
	contact_1_country: if(item.addressstreetline1 != null and item.addressstreetline1 != '') (item.addresscountry default 'USA') else null,
	contact_1_salutation: item.salutation default null,
	contact_1_first_name: item.firstname default null,
	contact_1_last_name: item.lastname default null,
	contact_1_middle_name: item.middlename default null,
	contact_1_suffix: item.suffix default null,
	contact_1_phone: item.phone1 default null,
	contact_1_phone_type: if(item.phone1 != null and item.phone1 != '') (if(item.phonetype == "H") "Home" else if(item.phonetype == "W") "Business" else "Home") else null,
	contact_1_email: item.email default null,
	contact_1_email_type: if(item.email != null and item.email != '') (if(item.phonetype == "H") "Home" else if(item.phonetype == "W") "Business" else "Home") else null ,
	contact_1_occupation: item.occupation default null,
	contact_1_employer_name: item.employername default null,
	event_id: item.eventid default null, 

	giving_name: (item.file_name default '') ++ ":" ++ (item.alternateid default ''),
	donation_name: if(item.recurringid == null or item.recurringid == '') "EveryAction One Time Gift" else null,
 	giving_tax_entity:
        (item.file_name) match {
            case file if upper(file) contains 'C3' -> 'C3'
            case file if upper(file) contains 'C4' -> 'C4'
			case file if upper(file) contains 'VOTES' -> 'PP VOTES'
			case file if upper(file) contains 'PAC' -> 'PAC'
            else -> null
        },
	preference_1_code_value: item.prefcode1 default null,
	preference_2_code_value: item.prefcode2 default null,
	giving_comments: (if(item.comments == null or item.comments == '') (if(item.prefcode1 != null and item.prefcode2 != null) (item.prefcode1 ++ " " ++ item.prefcode2) else if(item.prefcode1 != null) item.prefcode1 else if(item.prefcode2 != null) item.prefcode2 else null) else item.comments),
	recurring_donation_comments: if(item.recurringid != null and item.recurringid != '') (if(item.comments == null or item.comments == '') (if(item.prefcode1 != null and item.prefcode2 != null) (item.prefcode1 ++ " " ++ item.prefcode2) else if(item.prefcode1 != null) item.prefcode1 else if(item.prefcode2 != null) item.prefcode2 else null) else item.comments) else null,

	giving_gau_credit_code: item.gaucreditcode default null,
	giving_recurring_day_of_month: if(item.recurringid != null and item.recurringid != '') ( if(item.closedate != "" and item.closedate != null) ((item.closedate last 2)  as Number) else null) else null,
	giving_amount: item.givingamount default null,
	recurring_donation_amount: if(item.recurringid != null and item.recurringid != '') item.givingamount else null,
	recurring_donation_installment_period: if(item.recurringid != null and item.recurringid != '') "Monthly" else null,
	recurring_donation_installment_frequency: if(item.recurringid != null and item.recurringid != '') 1 else null,
	recurring_donation_recurring_type: if(item.recurringid != null and item.recurringid != '') "Open" else null,
	recurring_donation_status: if(item.recurringid != null and item.recurringid != '') "Active" else null, 
	recurring_donation_name: if(item.recurringid != null and item.recurringid != '') "EveryAction Sustaining Gift" else null,
	giving_close_date: (if(item.closedate matches /\d{8}/) (item.closedate as Date{format: "yyyyMMdd"} as String{format : "MM-dd-yyyy"}) else item.closedate default null),
	recurring_donation_date_established: if(item.recurringid != null and item.recurringid != '') (if(item.closedate matches /\d{8}/) (item.closedate as Date{format: "yyyyMMdd"} as String{format : "MM-dd-yyyy"}) else null) else null,
	recurring_donation_effective_date: if(item.recurringid != null and item.recurringid != '') (if(item.closedate matches /\d{8}/) (item.closedate as Date{format: "yyyyMMdd"} as String{format : "MM-dd-yyyy"}) else null) else null,
	giving_recurring_id: item.recurringid default null,
	payment_deposit_date: item.closedate default null,
	donation_stage: null,
	payment_paid: true,
    online_gift: true, 
	payment_deposit_ref_number: 
		(item.file_name) match {
            case file if((upper(file) contains 'C3')) -> 'C312800'
            case file if((upper(file) contains 'C4')) -> 'C412800'
            case file if((upper(file) contains 'VOTES')) -> 'PV12800'
            case file if((upper(file) contains 'PAC')) -> 'PC12800'
            else -> null
		},
	giving_gau_debit_code: 
		(item.file_name) match {
            case file if((upper(file) contains 'C3')) -> 'C312800'
            case file if((upper(file) contains 'C4')) -> 'C412800'
            case file if((upper(file) contains 'VOTES')) -> 'PV12800'
            case file if((upper(file) contains 'PAC')) -> 'PC12800'
            else -> null
		},
	opportunity_affiliate_number_override: "TRUE",
	tribute_flag: if(item.tributename != null and item.tributename != "") true else false,
	tribute_name: item.tributename default null,
	tribute_description: item.tributedescription default null,
	tribute_notification_recipient: item.notifyfreename default null,
	tribute_notification_info:   (
           (if(item.notifyaddressline != null and item.notifyaddressline != '') (item.notifyaddressline) else "")
        ++ (if(item.notifycity != null and item.notifycity != '') (" " ++ item.notifycity) else "") 
        ++ (if(item.notifystate != null and item.notifystate != '') (" " ++ item.notifystate) else "") 
        ++ (if(item.notifyzip != null and item.notifyzip != '') (" " ++ item.notifyzip) else "") 
        ++ (if(item.notifycountry != null and item.notifycountry != '') (" " ++ item.notifycountry) else "")
        ),
	tribute_type: item.tributetype default null,
	etribute_sent_date: item.etributesentdate default null,
	affiliate_number: item.affiliatenumber default null,
	affiliate_name: (((item.file_name) splitBy "_") filter ( $ contains 'PP'))[0] default 'PPFA',
	vendor_name: "EveryAction",
	vendor_type: "EveryAction",
	payment_method_card_issuer: item.paymentmethod default null,
	recurring_donation_payment_method: "External Processor"


	
})