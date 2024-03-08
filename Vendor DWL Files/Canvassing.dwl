%dw 2.0
output application/json

fun formatCloseDate(data) = (
    if (data matches /\d{1,2}(\/|-)\d{1,2}(\/|-)\d{4}/) 
         data as Date {format: 'M/dd/yyyy'} as Date {format: 'yyyy-MM-dd'}
    else if (data matches /\d{1,2}(\/|-)\d{1,2}(\/|-)\d{2}/) 
         data as Date {format: 'M/dd/yy'} as Date {format: 'yyyy-MM-dd'}
    else if (data matches /\d{4}(\/|-)\d{1,2}(\/|-)\d{2,4}/) 
        data as Date {format: "yyyy-MM-dd"}
    else 
        data
)

---
payload map (item,index) -> ({
    transaction_id: item.transaction_id default (correlationId ++ "_" ++ item.file_name ++ "_" ++ item.rownumber),
    rownumber: item.rownumber default null,
    status: "Data parsed into Staging Table",
    last_modified_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
    upload_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
    file_name: item.file_name default null,
    batch_upload_campaign_matched: item.batch_upload_campaign_matched default null,

    //account_1_name: item.contact_1_employer_name default null,
    account_1_name: if(item.account_record_type != null and item.account_record_type != '') item.contact_1_last_name else null,
   
    account_1_category: item.custom_account_category default null,
    account_1_record_type: item.account_record_type default null,
    canvasser: item.canvasser default null,
    address_type: if(item.address_street_line_1 != null and item.address_street_line_1 != '') (item.address_type match {
        case "Work" -> "Business"
        case "Home" -> "Home"
        case null -> "Home"
        case "" -> "Home"
        else -> "Other"
    }) else null,

    contact_1_address_street_line_1: if(item.account_record_type == null or item.account_record_type == "") item.address_street_line_1 default null else null,
    contact_1_address_street_line_2: if(item.account_record_type == null or item.account_record_type == "")  item.address_street_line_2 default null else null,
    contact_1_city: if(item.account_record_type == null or item.account_record_type == "")  item.address_city default null else null,
    contact_1_state_province: if(item.account_record_type == null or item.account_record_type == "")  item.address_state_province default null else null,
    contact_1_zip: if(item.account_record_type == null or item.account_record_type == "")  item.address_zip default null else null,
    contact_1_zip_plus_4: if(item.account_record_type == null or item.account_record_type == "")  item.address_zip_plus_4 default null else null,
    contact_1_country: if(item.account_record_type == null or item.account_record_type == "") (item.address_country default 
        (if(item.address_street_line_1 != null and item.address_street_line_1 != '') 'USA' else null)) else null,


    account_1_address_street_line_1: if(item.account_record_type != null and item.account_record_type != '') (item.address_street_line_1 default null) else null,
    account_1_address_street_line_2: if(item.account_record_type != null and item.account_record_type != '')  (item.address_street_line_2 default null) else null,
    account_1_city: if(item.account_record_type != null and item.account_record_type != '') (item.address_city default null) else null,
    account_1_state_province: if(item.account_record_type != null and item.account_record_type != '') (item.address_state_province default null) else null,
    account_1_zip: if(item.account_record_type != null and item.account_record_type != '')  (item.address_zip default null) else null,
    account_1_zip_plus_4: if(item.account_record_type != null and item.account_record_type != '') (item.address_zip_plus_4 default null) else null,
    account_1_country: if(item.account_record_type != null and item.account_record_type != '') (item.address_country default 
        (if(item.address_street_line_1 != null and item.address_street_line_1 != '') 'USA' else null)) else null,


    contact_1_title: item.contact_1_title default null,
    contact_1_first_name: item.contact_1_first_name default null,

    //contact_1_last_name: item.contact_1_last_name //default null,
    contact_1_last_name: 
    if(
        lower(item.account_record_type) == "" or 
        lower(item.account_record_type) == null)              item.contact_1_last_name else null,

    contact_1_middle_name: item.custom_middle_name1 default null,
    contact_1_suffix: item.contact_1_suffix default null,
    contact_1_phone: item.contact_1_phone_1 default null,
    contact_1_phone_type: if(!isEmpty(item.contact_1_phone_type))  item.contact_1_phone_type else "Home",
    contact_1_email_type: if(!isEmpty(item.contact_1_email_type))  item.contact_1_email_type else "Home",
    contact_1_email: item.contact_1_email default null,
    contact_1_occupation: item.custom_occupation_1 default null,
    contact_1_name_change: item.contact_name_change default null,
    contact_1_employer_name: item.custom_employer_name_1 default null,
    
    anonymous_donor: if(lower(item.custom_anonymous) == "y") true else false,

    //Payment Paid is not true for all Canvassing files - only ACH/CC are true,
    //payment_paid: true,
    payment_paid: if(lower(item.payment_method_payment_type) == "Cash/Check") false else true,
    
    giving_name: (item.file_name default '') ++ ":" ++ (item.rownumber default (index + 1)),
    donation_name:
        if(item.giving_giving_frequency == "One Payment") "Canvassing One Time Gift" else null,
    giving_tax_entity:
        (item.file_name) match {
            case file if upper(file) contains 'C3' -> 'C3'
            case file if upper(file) contains 'C4' -> 'C4'
            else -> null
        },
    giving_gau_debit_code: 
        (item.file_name) match {
            case file if file contains 'C3' -> 'C312800'
            case file if file contains 'C4' -> 'C412800'
            else -> null
        },
    giving_record_type: "Pledge",

    giving_amount: item.giving_giving_amount default null,

    giving_primary_campaign_source: item.giving_primary_campaign_source default null,
    giving_frequency: if(item.giving_giving_frequency == 'One Payment') null else 1,
    giving_frequency_period: if(item.giving_giving_frequncy == 'One Payment') null else item.giving_giving_frequency default null,
    giving_comments: 
        if(item.giving_giving_frequency == "One Payment") item.giving_comments else null,

    giving_close_date: formatCloseDate(item.giving_close_date), 
    payment_method: item.payment_method_payment_type match {
        case "Charge Card" -> "Credit Card"
        case "EFT" -> "ACH"
        else -> item.payment_method_payment_type
    }, 
    payment_method_account_number: item.payment_method_account default null,
    payment_method_routing_number: item.payment_method_routing default null,
    payment_method_card_token: item.payment_method_card_guid default null,
    payment_method_card_issuer: item.payment_method_card_issuer default null,
    payment_method_card_holder_name: item.payment_method_card_holder_name default null,
    payment_method_card_last_four_digits: item.payment_method_card_last_four_digits default null,
    payment_method_card_expiration_month: item.payment_method_card_expiration_month default null,
    payment_method_card_expiration_year: item.payment_method_card_expiration_year default null,
    preference_1_code_value: item.preferences_1_code_value default null,
    preference_1_end_date: item.preferences_1_end_date default null,
    preference_1_start_date: item.preferences_1_start_date default null,
    preference_2_code_value: item.preferences_2_code_value default null,
    preference_2_end_date: item.preferences_2_end_date default null,
    preference_2_start_date: item.preferences_2_start_date default null,
    preference_3_code_value: item.preferences_3_code_value default null,
    preference_3_end_date: item.preferences_3_end_date default null,
    preference_3_start_date: item.preferences_3_start_date default null,
    affiliate_name: (((item.file_name) splitBy "_") filter ( $ contains 'PP'))[0] default 'PPFA',
    recurring_donation_date_established: 

        if(lower(item.giving_giving_frequency) == "monthly") 
        formatCloseDate(item.giving_close_date)
        else null,

    recurring_donation_effective_date:
        if(lower(item.giving_giving_frequency) == "monthly") formatCloseDate(item.giving_close_date) else null,
        
    recurring_donation_day_of_month:
        if(lower(item.giving_giving_frequency) == "monthly") "1" else null,
    recurring_donation_installment_frequency:
        if(lower(item.giving_giving_frequency) == "monthly") "1" else null,
    recurring_donation_installment_period:
        if(lower(item.giving_giving_frequency) == "monthly") "Monthly" else null,
    recurring_donation_amount:
        if(lower(item.giving_giving_frequency) == "monthly") item.giving_giving_amount else null,
    
    recurring_donation_name:
        if(lower(item.giving_giving_frequency) == "monthly") "Canvassing Sustaining Gift" else null,
   
    recurring_donation_status:
        if(lower(item.giving_giving_frequency) == "monthly") "Active" else null,
   
    recurring_donation_recurring_type:
        if(lower(item.giving_giving_frequency) == "monthly") "Open" else null,
   
    recurring_donation_payment_method: if(lower(item.giving_giving_frequency) == "monthly")  (item.payment_method_payment_type match {
        case "Charge Card" -> "Credit Card"
        case "EFT" -> "ACH"
        else -> item.payment_method_payment_type
    }) else null,
    donation_stage: if(lower(item.payment_method_payment_type) == 'cash/check') "Active" else "Closed/Won",
    recurring_donation_comments: 
        if(lower(item.giving_giving_frequency) == "monthly") item.giving_comments else null,
    vendor_name: 'Canvassing',
    vendor_source_giving: 'Canvassing',
    vendor_type: 'Canvassing',
    giving_unique_id: item.giving_unique_id default null,
    acquired_batch_sequence: item.giving_pledge_id default null

})