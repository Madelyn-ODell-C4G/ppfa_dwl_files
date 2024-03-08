output application/json
---
payload map (item,index) -> ({
    transaction_id: item.transaction_id default (correlationId ++ "_" ++ item.file_name ++ "_" ++ item.rownumber),
    rownumber: item.rownumber default null,
    status: "Data parsed into Staging Table",
    last_modified_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
    upload_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
    file_name: item.file_name default null,
    batch_upload_account_matched:  if( !isEmpty(item.account_record_type) and  !isEmpty(item.batch_upload_account_matched)) item.batch_upload_account_matched else null,
    batch_upload_household_account_matched: if( isEmpty(item.account_record_type) and !isEmpty(item.batch_upload_account_matched)) item.batch_upload_account_matched else null,
    batch_upload_campaign_matched: item.batch_upload_campaign_matched default null,
    batch_upload_contact_1_matched: item.batch_upload_contact_1_matched default null,
    batch_upload_contact_2_matched: item.batch_upload_contact_2_matched default null,
    batch_upload_giving_matched: item.batch_upload_giving_matched default null,
    //  account_1_ext_id: item.account_account default null,
    // account_1_name: item.custom_employer_name_1 default null,
    account_1_category: item.custom_account_category default null,
    address_type: if(item.address_street_line_1 != null and item.address_street_line_1 != '') (item.address_type match {
        case "Work" -> "Business"
        case "Home" -> "Home"
        case null -> "Home"
        case "" -> "Home"
        else -> "Other"
    }) else null,
    account_1_record_type: item.account_record_type default null,
    contact_1_address_street_line_1: if(lower(item.account_record_type) !="organization") item.address_street_line_1 default null else null,
    contact_1_address_street_line_2: if(lower(item.account_record_type) !="organization") item.address_street_line_2 default null else null,
    contact_1_city: if(lower(item.account_record_type) !="organization") item.address_city default null else null,
    contact_1_state_province: if(lower(item.account_record_type) !="organization") item.address_state_province default null else null,
    contact_1_zip: if(lower(item.account_record_type) !="organization") item.address_zip default null else null,
    contact_1_zip_plus_4: if(lower(item.account_record_type) !="organization") item.address_zip_plus_4 default null else null,
    contact_1_country: if(lower(item.account_record_type) !="organization") (item.address_country default 
        (if(item.address_street_line_1 != null and item.address_street_line_1 != '') 'USA' else null)) else null,


    account_1_address_street_line_1: if(lower(item.account_record_type) =="organization")  (item.address_street_line_1 default null) else null,
    account_1_address_street_line_2: if(lower(item.account_record_type) =="organization")  (item.address_street_line_2 default null) else null,
    account_1_city: if(lower(item.account_record_type) =="organization")  (item.address_city default null) else null,
    account_1_state_province: if(lower(item.account_record_type) =="organization") (item.address_state_province default null) else null,
    account_1_zip: if(lower(item.account_record_type) =="organization")  (item.address_zip default null) else null,
    account_1_zip_plus_4: if(lower(item.account_record_type) =="organization") (item.address_zip_plus_4 default null) else null,
    account_1_country: if(lower(item.account_record_type) =="organization") (item.address_country default 
        (if(item.address_street_line_1 != null and item.address_street_line_1 != '') 'USA' else null)) else null,


    contact_1_title: item.contact_1_title default null,
    contact_1_first_name: if(lower(item.account_record_type) !="organization") item.contact_1_first_name else null,
    account_1_name: if(lower(item.account_record_type) =="organization") item.contact_1_first_name else null,
    
    contact_1_last_name: if(lower(item.account_record_type) =="organization") null else item.contact_1_last_name,
    //contact_1_last_name: item.contact_1_last_name default null,
    contact_1_middle_name: item.custom_middle_name1 default null,
    contact_1_suffix: item.contact_1_suffix default null,
    contact_1_phone: item.contact_1_phone_1 default null,
    contact_1_phone_type: if(!isEmpty(item.contact_1_phone_type))  item.contact_1_phone_type else "Home",
    contact_1_email: item.contact_1_email default null,
    contact_1_email_type: if(!isEmpty(item.contact_1_email_type))  item.contact_1_email_type else "Home",
    contact_1_occupation: item.custom_occupation_1 default null,
    contact_1_name_change: if(lower(item.contact_name_change) == "y") true else false,
    contact_1_employer_name: item.custom_employer_name_1 default null,
    contact_1_deceased_flag: item.custom_deceased_flag_1 default false,
    contact_1_deceased_date: item.custom_deceased_date_1 default null,
    contact_2_title: item.contact_2_title default null,
    contact_2_first_name: item.contact_2_first_name default null,
    contact_2_last_name: item.contact_2_last_name default null,
    contact_2_middle_name: item.custom_middle_name2 default null,
    contact_2_suffix: item.contact_2_suffix default null,
    //contact_2_email: item.contact_2_email default null,
    //contact_2_email_type: item.contact_2_email_type default null,
    contact_2_occupation: item.custom_occupation_2 default null,
    contact_2_employer_name: item.custom_employer_name_2 default null,
    contact_2_deceased_flag: item.custom_deceased_flag_2 default false,
    contact_2_deceased_date: item.custom_deceased_date_2 default null,
    
    anonymous_donor:if(lower(item.custom_anonymous) == "y") true else false,
    giving_name: if((lower(item.giving_giving_frequency) == "one payment") and (lower(item.giving_record_type) =="pl")) "Telemarketing One Time Gift" else null ,
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
    giving_updated_source_code: item.giving_updated_source_code default null,
    giving_number: item.giving_giving_number default null,
    giving_primary_campaign_source: item.giving_primary_campaign_source default null,
    giving_frequency: if(item.giving_giving_frequency != 'One Payment') 1 else null, 
    //giving_frequency_period: if(item.giving_giving_frequency != 'One Payment') item.giving_giving_frequency else null,
    giving_frequency_period: item.giving_giving_frequency default null,
    giving_close_date: item.giving_close_date default null,

    payment_method_account_number: if(item.payment_method_account_number != null) item.payment_method_account_number else item.payment_method_account default null,
    payment_method_routing_number: if(item.payment_method_routing_number != null) item.payment_method_routing_number else item.payment_method_routing default null,
    payment_method_card_token: item.payment_method_card_guid default null,
    payment_method_card_issuer: item.payment_method_card_issuer default null,
    payment_method_card_holder_name: item.payment_method_card_holder_name default null,
    payment_method_card_last_four_digits: item.payment_method_card_last_four_digits default null,
    payment_method_card_expiration_month: item.payment_method_card_expiration_month default null,
    payment_method_card_expiration_year: item.payment_method_card_expiration_year default null,
    payment_deposit_date: item.custom__deposit_date default null, //has two underscores in db
    preference_1_code_value: item.preferences_1_code_value default null,
    preference_1_end_date: item.preferences_1_end_date default null,
    preference_1_start_date: item.preferences_1_start_date default null,
    preference_2_code_value: item.preferences_2_code_value default null,
    preference_2_end_date: item.preferences_2_end_date default null,
    preference_2_start_date: item.preferences_2_start_date default null,
    preference_3_code_value: item.preferences_3_code_value default null,
    preference_3_end_date: item.preferences_3_end_date default null,
    preference_3_start_date: item.preferences_3_start_date default null,
    response_category: "Telemarketing", 
    response_type: item.response_type default null,
    response_date: item.response_date default null,
    response_source_code:  item.giving_primary_campaign_source default null, 
    response_status : "responded",  
    response_vendor_source: "Telemarketing", 
    tribute_flag: item.tribute default false,
    tribute_name: item.tribute_name default null,
    tribute_description: item.tribute_description default null,
    tribute_notification_recipient: if(item.tribute_notification_recipiant == null)((item.tribute_notification_recipient) default null) else (item.tribute_notification_recipiant default null),
    tribute_notification_info: 
        (
           (if(item.tribute_notify_address_line != null and item.tribute_notify_address_line != '') (item.tribute_notify_address_line) else "")
        ++ (if(item.tribute_notify_city != null and item.tribute_notify_city != '') (" " ++ item.tribute_notify_city) else "") 
        ++ (if(item.tribute_notify_state != null and item.tribute_notify_state != '') (" " ++ item.tribute_notify_state) else "") 
        ++ (if(item.tribute_notify_zip != null and item.tribute_notify_zip != '') (" " ++ item.tribute_notify_zip) else "") 
        ++ (if(item.tribute_notify_country != null and item.tribute_notify_country != '') (" " ++ (item.tribute_notify_country
            match {
                case "AFG" -> "Afghanistan"
                case "ALA" -> "Aland Islands"
                case "ALB" -> "Albania"
                case "DZA" -> "Algeria"
                case "AND" -> "Andorra"
                case "AGO" -> "Angola"
                case "AIA" -> "Anguilla"
                case "ATG" -> "Antigua and Barbuda"
                case "ARG" -> "Argentina"
                case "ARM" -> "Armenia"
                case "ABW" -> "Aruba"
                case "AUS" -> "Australia"
                case "AUT" -> "Austria"
                case "AZE" -> "Azerbaijan"
                case "BHS" -> "Bahamas"
                case "BHR" -> "Bahrain"
                case "BGD" -> "Bangladesh"
                case "BRB" -> "Barbados"
                case "BLR" -> "Belarus"
                case "BEL" -> "Belgium"
                case "BLZ" -> "Belize"
                case "BEN" -> "Benin"
                case "BMU" -> "Bermuda"
                case "BTN" -> "Bhutan"
                case "BOL" -> "Bolivia"
                case "BIH" -> "Bosnia and Herzegovina"
                case "BWA" -> "Botswana"
                case "BVT" -> "Bouvet Island"
                case "BRA" -> "Brazil"
                case "IOT" -> "British Indian Ocean Territory"
                case "VGB" -> "British Virgin Islands"
                case "BRN" -> "Brunei Darussalam"
                case "BGR" -> "Bulgaria"
                case "BFA" -> "Burkina Faso"
                case "BDI" -> "Burundi"
                case "CPV" -> "Cabo Verde"
                case "KHM" -> "Cambodia"
                case "CMR" -> "Cameroon"
                case "CAN" -> "Canada"
                case "CNZ" -> "Canal Zone"
                case "CNI" -> "Canary Islands"
                case "CYM" -> "Cayman Islands"
                case "CAF" -> "Central African Republic"
                case "TCD" -> "Chad"
                case "CHA" -> "Channel Islands"
                case "CHL" -> "Chile"
                case "CHN" -> "China"
                case "CXR" -> "Christmas Island"
                case "CCK" -> "Cocos (Keeling) Islands"
                case "COL" -> "Colombia"
                case "COM" -> "Comoros"
                case "COG" -> "Congo"
                case "COD" -> "Congo, Democratic Republic"
                case "COK" -> "Cook Islands"
                case "CRI" -> "Costa Rica"
                case "CIV" -> "Cote D'Ivoire"
                case "HRV" -> "Croatia"
                case "CUB" -> "Cuba"
                case "CYP" -> "Cyprus"
                case "CZE" -> "Czechia"
                case "DNK" -> "Denmark"
                case "DJI" -> "Djibouti"
                case "DMA" -> "Dominica"
                case "DOM" -> "Dominican Republic"
                case "ECU" -> "Ecuador"
                case "EGY" -> "Egypt"
                case "SLV" -> "El Salvador"
                case "ENG" -> "England"
                case "GNQ" -> "Equatorial Guinea"
                case "ERI" -> "Eritrea"
                case "EST" -> "Estonia"
                case "ETH" -> "Ethiopia"
                case "FLK" -> "Falkland Islands (Malvinas)"
                case "FRO" -> "Faroe Islands"
                case "FJI" -> "Fiji"
                case "FIN" -> "Finland"
                case "FRA" -> "France"
                case "GUF" -> "French Guiana"
                case "PYF" -> "French Polynesia"
                case "ATF" -> "French Southern Territories"
                case "GAB" -> "Gabon"
                case "GMB" -> "Gambia"
                case "GEO" -> "Georgia"
                case "DEU" -> "Germany"
                case "GHA" -> "Ghana"
                case "GIB" -> "Gibraltar"
                case "GRC" -> "Greece"
                case "GRL" -> "Greenland"
                case "GRD" -> "Grenada"
                case "GLP" -> "Guadeloupe"
                case "GTM" -> "Guatemala"
                case "GGY" -> "Guernsey"
                case "GIN" -> "Guinea"
                case "GNB" -> "Guinea-Bissau"
                case "GUY" -> "Guyana"
                case "HTI" -> "Haiti"
                case "HMD" -> "Heard and McDonald Islands"
                case "VAT" -> "Holy See"
                case "HND" -> "Honduras"
                case "HKG" -> "Hong Kong"
                case "HUN" -> "Hungary"
                case "ISL" -> "Iceland"
                case "IND" -> "India"
                case "IDN" -> "Indonesia"
                case "IRN" -> "Iran, Islamic Republic of"
                case "IRQ" -> "Iraq"
                case "IRL" -> "Ireland"
                case "IMN" -> "Isle of Man"
                case "ISR" -> "Israel"
                case "ITA" -> "Italy"
                case "JAM" -> "Jamaica"
                case "JPN" -> "Japan"
                case "JEY" -> "Jersey"
                case "JOR" -> "Jordan"
                case "KAM" -> "Kampuchea"
                case "KAZ" -> "Kazakhstan"
                case "KEN" -> "Kenya"
                case "KIR" -> "Kiribati"
                case "PRK" -> "Korea, Democratic People's Republic"
                case "KOR" -> "Korea, Republic of (South Korea)"
                case "KOS" -> "Kosovo"
                case "KWT" -> "Kuwait"
                case "KGZ" -> "Kyrgyzstan"
                case "LAO" -> "Lao People's Democratic Republic"
                case "LVA" -> "Latvia"
                case "LBN" -> "Lebanon"
                case "LSO" -> "Lesotho"
                case "LBR" -> "Liberia"
                case "LBY" -> "Libya"
                case "LIE" -> "Liechtenstein"
                case "LTU" -> "Lithuania"
                case "LUX" -> "Luxembourg"
                case "MAC" -> "Macau"
                case "MKD" -> "Macedonia, Republic of"
                case "MDG" -> "Madagascar"
                case "MWI" -> "Malawi"
                case "MYS" -> "Malaysia"
                case "MDV" -> "Maldives"
                case "MLI" -> "Mali"
                case "MLT" -> "Malta"
                case "MHL" -> "Marshall Islands"
                case "MTQ" -> "Martinique"
                case "MRT" -> "Mauritania"
                case "MUS" -> "Mauritius"
                case "MYT" -> "Mayotte"
                case "MEX" -> "Mexico"
                case "FSM" -> "Micronesia"
                case "MDA" -> "Moldova"
                case "MCO" -> "Monaco"
                case "MNG" -> "Mongolia"
                case "MNE" -> "Montenegro"
                case "MSR" -> "Montserrat"
                case "MAR" -> "Morocco"
                case "MOZ" -> "Mozambique"
                case "MMR" -> "Myanmar"
                case "NAM" -> "Namibia"
                case "NRU" -> "Nauru"
                case "NPL" -> "Nepal"
                case "NLD" -> "Netherlands"
                case "NTA" -> "Netherlands Antilles"
                case "NCL" -> "New Caledonia"
                case "NZL" -> "New Zealand"
                case "NIC" -> "Nicaragua"
                case "NER" -> "Niger"
                case "NGA" -> "Nigeria"
                case "NIU" -> "Niue"
                case "NFK" -> "Norfolk Island"
                case "NIR" -> "Northern Ireland, UK"
                case "MNP" -> "Northern Mariana Islands"
                case "NOR" -> "Norway"
                case "OMN" -> "Oman"
                case "PAC" -> "Pacific Islands"
                case "PAK" -> "Pakistan"
                case "PLW" -> "Palau"
                case "PSE" -> "Palestine, State of"
                case "PAN" -> "Panama"
                case "PNG" -> "Papua New Guinea"
                case "PRY" -> "Paraguay"
                case "YNS" -> "People's Democratic Republic of Yemen"
                case "PER" -> "Peru"
                case "PHL" -> "Philippines"
                case "PCN" -> "Pitcairn"
                case "POL" -> "Poland"
                case "PRT" -> "Portugal"
                case "QAT" -> "Qatar"
                case "REU" -> "Reunion"
                case "ROU" -> "Romania"
                case "RUS" -> "Russian Federation"
                case "RWA" -> "Rwanda"
                case "SGS" -> "S. Georgia and S. Sandwich Isls."
                case "KNA" -> "Saint Kitts and Nevis"
                case "LCA" -> "Saint Lucia"
                case "SPM" -> "Saint Pierre and Miquelon"
                case "VCT" -> "Saint Vincent &amp; the Grenadines"
                case "WSM" -> "Samoa"
                case "SMR" -> "San Marino"
                case "STP" -> "Sao Tome and Principe"
                case "SAU" -> "Saudi Arabia"
                case "SCO" -> "Scotland"
                case "SEN" -> "Senegal"
                case "SRB" -> "Serbia"
                case "SYC" -> "Seychelles"
                case "SIC" -> "Sicily"
                case "SLE" -> "Sierra Leone"
                case "SGP" -> "Singapore"
                case "SVK" -> "Slovakia"
                case "SVN" -> "Slovenia"
                case "SLB" -> "Solomon Islands"
                case "SOM" -> "Somalia"
                case "ZAF" -> "South Africa"
                case "SSD" -> "South Sudan"
                case "ESP" -> "Spain"
                case "LKA" -> "Sri Lanka"
                case "SHN" -> "St Helena, Ascension and Tristan da C"
                case "SDN" -> "Sudan"
                case "SUR" -> "Suriname"
                case "SJM" -> "Svalbard &amp; Jan Mayen Islands"
                case "SWA" -> "Swaziland"
                case "SWE" -> "Sweden"
                case "CHE" -> "Switzerland"
                case "SYR" -> "Syrian Arab Republic"
                case "TWN" -> "Taiwan"
                case "TJK" -> "Tajikistan"
                case "TZA" -> "Tanzania, United Republic of"
                case "THA" -> "Thailand"
                case "TIB" -> "Tibet"
                case "TLS" -> "Timor-Leste"
                case "TGO" -> "Togo"
                case "TKL" -> "Tokelau"
                case "TON" -> "Tonga"
                case "TTO" -> "Trinidad and Tobago"
                case "TUN" -> "Tunisia"
                case "TUR" -> "Turkey"
                case "TKM" -> "Turkmenistan"
                case "TCA" -> "Turks and Caicos Islands"
                case "TUV" -> "Tuvalu"
                case "UGA" -> "Uganda"
                case "UKR" -> "Ukraine"
                case "ARE" -> "United Arab Emirates"
                case "GBR" -> "United Kingdom of Great Britain and Northern Ireland"
                case "USA" -> "United States of America"
                case "URY" -> "Uruguay"
                case "UZB" -> "Uzbekistan"
                case "VUT" -> "Vanuatu"
                case "VAT" -> "Vatican City"
                case "VEN" -> "Venezuela"
                case "VNM" -> "Viet Nam"
                case "WAL" -> "Wales"
                case "WLF" -> "Wallis and Futuna Islands"
                case "ESH" -> "Western Sahara"
                case "YEM" -> "Yemen"
                case "YUG" -> "Yugoslavia"
                case "ZAI" -> "Zaire"
                case "ZMB" -> "Zambia"
                case "ZWE" -> "Zimbabwe" 
                else -> null
                }    
        
         )) else "")
        ),
    tribute_type: item.tribute_type default null,
    affiliate_name: (((item.file_name) splitBy "_") filter ( $ contains 'PP'))[0] default null,
    donation_date: if((lower(item.giving_giving_frequency) == "one payment") and (lower(item.giving_record_type) =="pl") ) item.giving_close_date else null,
    recurring_donation_date_established:  
        if((item.giving_new_giving_number != null or item.giving_new_giving != null) and (lower(item.giving_giving_frequency) == "monthly") and (lower(item.giving_record_type) =="pl" )) item.giving_close_date else null,
    recurring_donation_effective_date:    
        if((item.giving_new_giving_number != null or item.giving_new_giving != null) and (lower(item.giving_giving_frequency) == "monthly") and (lower(item.giving_record_type) =="pl" )) item.giving_close_date else null,
    giving_recurring_day_of_month:     
        if((item.giving_new_giving_number != null or item.giving_new_giving != null) and (lower(item.giving_giving_frequency) == "monthly") and (lower(item.giving_record_type) =="pl") ) 1 else null,
    
   

    opportunity_vendor_pledge_number: 
    if ((lower(item.giving_giving_frequency) == "one payment") and (lower(item.giving_record_type) == "pl")) 
        (item.giving_new_giving_number default null) default null
    else 
        null,


    recurring_donation_vendor_pledge_number: if(lower(item.giving_giving_frequency) == "monthly") item.giving_new_giving_number default null else null,


    recurring_donation_installment_frequency:  if( (item.giving_new_giving_number != null) and (lower(item.giving_giving_frequency) == "monthly") and (lower(item.giving_record_type) =="pl") ) 1 else null,
    
    recurring_donation_installment_period:  if((item.giving_new_giving_number != null) and (lower(item.giving_giving_frequency) == "monthly") and (lower(item.giving_record_type) =="pl") ) "Monthly" else null,
    pledge: if((lower(item.giving_giving_frequency) == "one payment") and (lower(item.giving_record_type) == "pl"))  true else false,

    giving_amount: if(item.giving_giving_amount == null or item.giving_giving_amount == '') null else item.giving_giving_amount as Number default null,
    
    //recurring_donation_amount: if((lower(item.giving_giving_frequency) == "one payment") and (lower(item.giving_record_type) =="pl") ) item.giving_giving_amount else null,     
    giving_recurring_amount:if((lower(item.giving_giving_frequency) == "monthly") and (lower(item.giving_record_type) =="pl") ) item.giving_giving_amount else null, 
    donation_name:  if((lower(item.giving_giving_frequency) == "one payment") and (lower(item.giving_record_type) =="pl") ) "Telemarketing One Time Gift" else null, 
    recurring_donation_name:  if((item.giving_new_giving_number != null) and (lower(item.giving_giving_frequency) == "monthly") and (lower(item.giving_record_type) =="pl") ) "Telemarketing Sustaining Gift" else null, 
    payment_method:  item.payment_method_payment_type match {
        case "Charge Card" -> "Credit Card"
        case "EFT" -> "ACH"
        else -> item.payment_method_payment_type
    }, 
    recurring_donation_payment_method: if(lower(item.giving_giving_frequency) == "monthly" and lower(item.giving_record_type) =="pl" ) (item.payment_method_payment_type match {
        case "Charge Card" -> "Credit Card"
        case "EFT" -> "ACH"
        else -> item.payment_method_payment_type
    }) else null,


    recurring_donation_recurring_type:  if((item.giving_new_giving_number != null) and (lower(item.giving_giving_frequency) == "monthly") and (lower(item.giving_record_type) =="pl") ) "Open" else null,
    recurring_donation_status:  if((item.giving_new_giving_number != null) and (lower(item.giving_giving_frequency) == "monthly") and (lower(item.giving_record_type) =="pl" )) "Active" else null,
    donation_stage: "Active",
    payment_paid: false,
    vendor_name:  ((item.file_name) splitBy "_")[0],
    vendor_type: "Telemarketing",
    vendor_source_giving:  ((item.file_name) splitBy "_")[0]

})