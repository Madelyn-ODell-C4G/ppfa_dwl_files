%dw 2.0
output application/json
---
payload map (item,index) -> ({
    transaction_id: item.transaction_id default (correlationId ++ "_" ++ item.file_name ++ "_" ++ item.rownumber),
    rownumber: item.rownumber default null,
    status: "Data parsed into Staging Table",
    last_modified_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
    upload_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
    file_name: item.file_name default null,
    batch_upload_campaign_matched: item.batch_upload_campaign_matched default null,
    contact_1_title: item.contact_1_title default null,
    contact_1_first_name: item.contact_1_first_name default null,
    contact_1_middle_name: item.custom_middle_name1 default null,
    contact_1_last_name: item.contact_1_last_name default null,
    contact_1_suffix: item.contact_1_suffix default null,
    contact_2_title: item.contact_2_title default null,
    contact_2_first_name: item.contact_2_first_name default null,
    contact_2_middle_name: item.custom_middle_name2 default null,
    contact_2_last_name: item.contact_2_last_name default null,
    contact_2_suffix: item.contact_2_suffix default null,
    contact_1_name_change: if(lower(item.contact_name_change) == "y") true else false,
    contact_1_address_street_line_1: item.address_street_line_1 default null,
    contact_1_address_street_line_2: item.address_street_line_2 default null,
    contact_1_city: item.address_city default null,
    contact_1_state_province: item.address_state_province default null,
    contact_1_zip: item.address_zip default null,
    contact_1_zip_plus_4: item.address_zip_plus_4 default null,
    contact_1_country: item.address_country default 
        (if(item.address_street_line_1 != null and item.address_street_line_1 != '') 'USA' else null),
    anonymous_donor: if(lower(item.custom_anonymous) == "y") true else false,
    pledge: if(item.giving_giving_frequency == "Monthly") null else if(item.giving_giving_frequency == "One Payment" and item.payment_method_payment_type == "Credit Card") false else if(item.giving_giving_frequency == "One Payment" and item.payment_method_payment_type == "Cash/Check") true  else null,
    recurring_donation_installment_period: if(item.giving_giving_frequency == "Monthly") item.giving_giving_frequency else null,
    recurring_donation_installment_frequency: if(item.giving_giving_frequency == "Monthly") 1 else null,
    
    giving_recurring_amount: if(item.giving_giving_frequency == "Monthly") item.giving_giving_amount as Number else null,

    //recurring_donation_amount: if(item.giving_giving_frequency == "Monthly") item.giving_giving_amount else null,
    donation_name: if(item.giving_giving_frequency == "One Payment") "Direct TV One-Time Gift" else null,
    recurring_donation_name: if(item.giving_giving_frequency == "Monthly") "Direct TV Sustaining Gift" else null,
    recurring_donation_recurring_type: if(item.giving_giving_frequency == "Monthly") "Open" else null,
    recurring_donation_status: if(item.giving_giving_frequency == "Monthly") "Active" else null,
    donation_stage: if(item.payment_method_payment_type == "Cash/Check") "Active" else null,
    recurring_donation_payment_method: if(item.giving_giving_frequency == "Monthly") (item.payment_method_payment_type match {
           case "Charge Card" -> "Credit Card"
        case "EFT" -> "ACH"
        else -> item.payment_method_payment_type
    }) else null,

    //payment_method: item.payment_method_payment_type default null,
    giving_comments: if(item.giving_giving_frequency == "One Payment") item.giving_comments else null,
    recurring_donation_comments: if(item.giving_giving_frequency == "Monthly") item.giving_comments else null,
    donation_date: if(item.giving_giving_frequency == "One Payment") item.giving_close_date else null,
    recurring_donation_effective_date: if(item.giving_giving_frequency == "Monthly") item.giving_close_date else null, 
    recurring_donation_date_established: if(item.giving_giving_frequency == "Monthly") item.giving_close_date else null,

    giving_recurring_day_of_month: if(item.giving_giving_frequency == "Monthly" and item.giving_close_date != null and item.giving_close_date != '') 1 as Number else null,


    opportunity_vendor_pledge_number: if(item.giving_giving_frequency == "One Payment") item.giving_new_giving else null,
    recurring_donation_vendor_pledge_number: if(item.giving_giving_frequency == "Monthly") item.giving_new_giving else null,
       giving_tax_entity:
        (item.file_name) match {
            case file if upper(file) contains 'C3' -> 'C3'
            case file if upper(file) contains 'C4' -> 'C4'
            case file if upper(file) contains 'PAC' -> 'PAC'
            else -> null
        },
    giving_gau_debit_code: 
        (item.file_name) match {
            case file if((upper(file) contains 'C3')) -> 'C312800'
            case file if((upper(file) contains 'C4')) -> 'C412800'
            case file if((upper(file) contains 'PAC')) -> 'PC12800'
            else -> null
    },
    address_type: if(item.address_street_line_1 != null and item.address_street_line_1 != '') (item.address_type match {
        case "Work" -> "Business"
        case "Home" -> "Home"
        case null -> "Home"
        case "" -> "Home"
        else -> "Other"
    }) else null,
    contact_1_phone: item.contact_1_phone_1 default null,
    contact_1_phone_type: if(!isEmpty(item.contact_1_phone_type))  item.contact_1_phone_type else "Home",
    contact_1_email: item.contact_1_email default null,
    contact_1_email_type: if(!isEmpty(item.contact_1_email_type))  item.contact_1_email_type else "Home",
    // contact_2_email: item.contact_2_email default null,
    // contact_2_email_type: item.contact_2_email_type default null,
    giving_close_date: item.giving_close_date default null,
    payment_deposit_date: item.custom__deposit_date default null,
    giving_new_giving_number: item.giving_new_giving default null,
    giving_number: item.giving_giving default null,
    giving_primary_campaign_source: item.giving_primary_campaign_source default null,
    giving_amount: item.giving_giving_amount default null,
    payment_method: item.payment_method_payment_type match {
        case "Charge Card" -> "Credit Card"
        case "EFT" -> "ACH"
        else -> item.payment_method_payment_type
    }, 
    payment_method_card_issuer: item.payment_method_card_issuer default null,
    payment_method_card_last_four_digits: item.payment_method_card_last_four_digits default null,
    payment_method_card_expiration_month: item.payment_method_card_expiration_month default null,
    payment_method_card_expiration_year: item.payment_method_card_expiration_year default null,
    payment_method_card_token: item.payment_method_card_guid default null,
    payment_method_card_holder_name: item.payment_method_card_holder_name default null,
    payment_method_account_number: item.payment_method_account_number default null,
    payment_method_routing_number: item.payment_method_routing_number default null,
    payment_paid: if(item.payment_method_payment_type == "Cash/Check") false else true,
    preference_1_code_value: item.preferences_1_code_value default null,
    preference_1_start_date: item.preferences_1_start_date default null,
    preference_1_end_date: item.preferences_1_end_date default null,
    preference_2_code_value: item.preferences_2_code_value default null,
    preference_2_start_date: item.preferences_2_start_date default null,
    preference_2_end_date: item.preferences_2_end_date default null,
    preference_3_code_value: item.preferences_3_code_value default null,
    preference_3_start_date: item.preferences_3_start_date default null,
    preference_3_end_date: item.preferences_3_end_date default null,
    giving_frequency_period: item.giving_giving_frequency default null, 
    response_category: "DRTV",
    response_type: item.response_type default null,
    response_date: item.response_date default null,
    canvasser: item.giving_uii default null,
    giving_unique_id: item.giving_unique_id default null,
    giving_name: item.file_name ++ ":" ++ (item.rownumber default (index + 1)),
    vendor_source_giving: "DRTV",
    response_vendor_source: "DRTV",
    response_source_code:  item.giving_primary_campaign_source default null, 
    vendor_type: "DRTV",
    vendor_name: "DRTV"
})