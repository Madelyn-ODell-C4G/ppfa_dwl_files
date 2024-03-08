%dw 2.0
import * from dw::core::Strings
fun countryCodeLookup(field) = ((field) match {
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
                })

 fun getStateName(countryCode, stateCode) = (
     (countryCode) match {
        case "USA" -> (
            (stateCode) match {
             case   "AK" -> "Alaska"
             case   "AL" -> "Alabama"
             case   "AP" -> "Armed Forces Pacific"
             case   "AR" -> "Arkansas"
             case   "AZ" -> "Arizona"
             case   "CA" -> "California"
             case   "CO" -> "Colorado"
             case   "CT" -> "Connecticut"
             case   "DC" -> "District of Columbia"
             case   "DE" -> "Delaware"
             case   "FL" -> "Florida"
             case   "GA" -> "Georgia"
             case   "GU" -> "Guam"
             case   "HI" -> "Hawaii"
             case   "IA" -> "Iowa"
             case   "ID" -> "Idaho"
             case   "IL" -> "Illinois"
             case   "IN" -> "Indiana"
             case   "KE" -> "Kentucky"
             case   "KS" -> "Kansas"
             case   "LA" -> "Louisiana"
             case   "MA" -> "Massachusetts"
             case   "MD" -> "Maryland"
             case   "ME" -> "Maine"
             case   "MI" -> "Michigan"
             case   "MN" -> "Minnesota"
             case   "MO" -> "Missouri"
             case   "MS" -> "Mississippi"
             case   "MT" -> "Montana"
             case   "NC" -> "North Carolina"
             case   "ND" -> "North Dakota"
             case   "NE" -> "Nebraska"
             case   "NH" -> "New Hampshire"
             case   "NJ" -> "New Jersey"
             case   "NM" -> "New Mexico"
             case   "NV" -> "Nevada"
             case   "NY" -> "New York"
             case   "OH" -> "Ohio"
             case   "OK" -> "Oklahoma"
             case   "OR" -> "Oregon"
             case   "PA" -> "Pennsylvania"
             case   "PR" -> "Puerto Rico"
             case   "RI" -> "Rhode Island"
             case   "SC" -> "South Carolina"
             case   "SD" -> "South Dakota"
             case   "TN" -> "Tennessee"
             case   "TX" -> "Texas"
             case   "UT" -> "Utah"
             case   "VA" -> "Virginia"
             case   "VI" -> "Virgin Islands"
             case   "VT" -> "Vermont"
             case   "WA" -> "Washington"
             case   "WI" -> "Wisconsin"
             case   "WV" -> "West Virginia"
             case   "WY" -> "Wyoming"
                else -> ""
            }
        )
        case "CAN" -> (
            (stateCode) match  {
                case "AB" -> "Alberta"
                case "BC" -> "British Columbia"
                case "MB" -> "Manitoba"
                case "NB" -> "New Brunswick"
                case "NL" -> "Newfoundland and Labrador"
                case "NS" -> "Nova Scotia"
                case "NT" -> "Northwest Territories"
                case "NU" -> "Nunavut"
                case "ON" -> "Ontario"
                case "PE" -> "Prince Edward Island"
                case "QC" -> "Quebec"
                case "SK" -> "Saskatchewan"
                case "YT" -> "Yukon"
                else -> ""
            }
        )
        case "AUS" -> (
            (stateCode) match  {
                case "ACT" -> "Australian Capital Territory"
                case "NSW" -> "New South Wales"
                case "NT" -> "Northern Territory"
                case "QLD" -> "Queensland"
                case "SA" -> "South Australia"
                case "TAS" -> "Tasmania"
                case "VIC" -> "Victoria"
                case "WA" -> "Western Australia"
                else -> ""
            }
        )
        else -> "Outside US"
    }
)               
output application/json
---
(payload map(item,index) -> ({
        "npsp__Account1Imported__c": item.batch_upload_account_matched default null,
        "npsp__HouseholdAccountImported__c": item.batch_upload_household_account_matched default null,
        "npsp__Account1_City__c": item.account_1_city default null,
        "npsp__Account1_Country__c": item.account_1_country default null,
        "npsp__Account1_Name__c": item.account_1_name default null,
        //"Account_Record_Type_Name__c": item.account_1_record_type default null,
        "Account_Record_Type_Name__c": if(item.account_1_name  != null and item.account_1_name !='')  "0123t00000118hoAAA" else null,
        "npsp__Account1_State_Province__c": item.account_1_state_province default null,
        "npsp__Account1_Street__c": (item.account_1_address_street_line_1 default '') ++ if(item.account_1_address_street_line_2 != null and item.account_1_address_street_line_2 != "")(" " ++ (item.account_1_address_street_line_2 default '')) else "",
        "npsp__Account1_Zip_Postal_Code__c":
                if(item.account_1_zip != null) 
                        ((item.account_1_zip default '') ++ if(item.account_1_zip_plus_4 != null and item.account_1_zip_plus_4 != "") ("-" ++ (item.account_1_zip_plus_4 default '')) else "") else null,
        "Account_Organization_Type__c": item.account_1_category default null,
        "npsp__Contact1Imported__c": item.batch_upload_contact_1_matched default null,
        "npsp__Contact1_Firstname__c": item.contact_1_first_name default null,
        "npsp__Contact1_Lastname__c": item.contact_1_last_name default null,
        "npsp__Contact1_Salutation__c": item.contact_1_title default null,
        //"npsp__Contact1_Title__c": item.contact_1_title default null,
        "npsp__Contact2Imported__c": item.batch_upload_contact_2_matched default null,
        "npsp__Contact2_Firstname__c": item.contact_2_first_name default null,
        "npsp__Contact2_Lastname__c": item.contact_2_last_name default null,
        "npsp__Contact2_Salutation__c": item.contact_2_title default null,
        // "npsp__Contact2_Title__c": item.contact_2_title default null,
        ("npsp__DonationCampaignImported__r.Unique_Source_Code__c": item.batch_upload_campaign_matched default null) if(item.file_name contains 'ea_'),
        ("npsp__DonationCampaignImported__c": item.batch_upload_campaign_matched default null) if(!(item.file_name contains 'ea_')),

        //removed 2024/4/12
        // "npsp__RecurringDonationImported__c": if (
                                                   //  lower(item.vendor_type) == "everyaction" or
                                                   //  (
                                                   //     (lower(item.vendor_type) == "moore" or lower(item.vendor_type) == "telemarketing") and
                                                   //     (lower(item.giving_frequency_period) == "monthly" or lower(item.giving_record_type) == "pledge" or lower(item.giving_record_type) == "pl")
                                                   // )
                                                   // ) item.batch_upload_giving_matched else null,
        "npsp__RecurringDonationImported__c": if (
                                                    lower(item.vendor_type) == "everyaction"
                                                    ) 
                                                    item.batch_upload_giving_matched
                                                    else if (
                                                    lower(item.vendor_type) == "moore" and
                                                    lower(item.giving_record_type) == "pl" and
                                                    item.giving_giving != null and
                                                    item.giving_giving != ''
                                                    ) 
                                                    item.batch_upload_giving_matched
                                                    else if (
                                                    lower(item.vendor_type) == "telemarketing" and
                                                    lower(item.giving_frequency_period) == "monthly" and
                                                    item.giving_giving != null and
                                                    item.giving_giving != ''
                                                    ) 
                                                    item.batch_upload_giving_matched
                                                    else 
                                                    null,


            
      
        "npsp__DonationImported__c":  if (
                                            (lower(item.vendor_type) == "moore" and
                                            lower(item.giving_record_type) == "gf" and
                                            item.giving_giving != null and
                                            item.giving_giving != '')
                                            ) 
                                            item.batch_upload_giving_matched
                                            else if (
                                            lower(item.vendor_type) == "telemarketing" and
                                            lower(item.giving_frequency_period) == "one payment" and
                                            item.giving_giving != null and
                                            item.giving_giving != ''
                                            ) 
                                            item.batch_upload_giving_matched
                                            else if(item.vendor_name == 'AFFILIATE-SUST') item.batch_upload_giving_matched default null
                                            else null,




        "npsp__Donation_Amount__c": item.giving_amount default null,
         // exclude giving
        "npsp__Donation_Date__c":   if(item.giving_amount != null and item.giving_amount != '')  (item.giving_close_date default null) else null, 
        "npsp__Donation_Stage__c":  if(item.vendor_name == 'ActBlue' or item.vendor_name == 'AFFILIATE-SUST') 'Closed/Won'
                                    else if(item.giving_amount != null and item.giving_amount != '')  (item.donation_stage default null) 
                                    else null,
        "Batch_Item_Name__c":  item.giving_name default null ,
        "npsp__Donation_Name__c":   if(item.vendor_name == 'ActBlue') item.donation_name default null
                                    else if(item.batch_upload_giving_matched != null) null 
                                    else (item.donation_name default null),
        "npsp__Donation_Notification_Recipient_Info__c": item.tribute_notification_info default null,
        "npsp__Donation_Notification_Recipient_Name__c": item.tribute_notification_recipient default null,
        "Tribute_E_card_Sent_Date__c": item.etribute_sent_date default null,
        "npsp__Payment_Check_Reference_Number__c": item.payment_check_number default null,
        "Check_Date__c": item.payment_check_date default null,
        "Custom_Anonymous__c": item.anonymous_donor default null,
        "npsp__Opportunity_Contact_Role_1_Role__c": item.opportunity_contact_role_1 default null,
        "npsp__Donation_Tribute_Type__c": item.tribute_type default null,
        "npsp__NPSP_Data_Import_Batch__c": item.batch_upload_batch_matched default null,

       
       

        "npsp__PaymentImported__c": (
                (item.vendor_name) match {
                        case file if (lower(file) contains 'actblue') -> item.batch_upload_giving_matched
                        case file if (lower(file) contains 'tpa') -> item.payment_id 
                        else -> null
                }
        ),


        //exclude giving  
        "npsp__Payment_Paid__c": 
                if(item.vendor_name == 'ActBlue' and item.credit_1_amount == null) true 
                else if(item.vendor_name == 'AFFILIATE-SUST') true
                else if(item.giving_amount != null and item.giving_amount != '') (item.payment_paid default false) 
                else null,
        "npsp__Payment_Type__c": item.payment_type default null, 
        //"npsp__Payment_Method__c": item.payment_method default null,
        "npsp__Payment_Method__c": if(item.alternate_id != null and item.alternate_id != '') "External Processor" else item.payment_method default null,
        "External_Processor_Name__c": if(item.alternate_id != null and item.alternate_id != '') "EveryAction" else null,

        "Processor_Payment_Identifier__c": item.giving_unique_id default null,

        "Contact1_Employer__c": item.contact_1_employer_name default null,
        "Contact1_Middle_Name__c": item.contact_1_middle_name default null,
        "Contact1_Occupation__c": item.contact_1_occupation default null,
        "Contact1_Suffix__c": item.contact_1_suffix default null,
        "Address_Type__c": item.address_type default null,
        "npsp__Home_Street__c": if(item.contact_1_address_street_line_1 != null)
        ((item.contact_1_address_street_line_1 default '')  ++ (if(item.contact_1_address_street_line_2 != null and item.contact_1_address_street_line_2 != '') (" " ++ item.contact_1_address_street_line_2) else "")) else null,
        "npsp__Home_City__c": item.contact_1_city default null,
        "npsp__Home_State_Province__c": item.contact_1_state_province default null,
        "npsp__Home_Country__c": item.contact_1_country,
        "npsp__Home_Zip_Postal_Code__c": if(item.contact_1_zip != null and item.contact_1_zip != '') ((item.contact_1_zip default '') ++ (if(item.contact_1_zip_plus_4 != null and item.contact_1_zip_plus_4 != '') ("-" ++ item.contact_1_zip_plus_4) else "")) else null,
        "Donation_Canvasser__c": item.canvasser default null,
        "Donation_Tribute_Description__c": item.tribute_description default null,
        "Donation_Tribute_Name__c": item.tribute_name default null,
        "Donation_Matching_Gift__c": item.giving_id default null,

        Recurring_Donation_External_ID__c: (
                (item.file_name) match {
                        case file if (lower(file) contains 'ea_') -> (if(item.batch_upload_giving_matched != null) null else item.giving_recurring_id)
                        else -> null
                }
        ),
       // "Debit_Code_Text__c": if(item.file_name contains 'ea') item.payment_deposit_ref_number else item.giving_gau_credit_code,
        "GAU_Credit_Code__c": if(item.file_name contains 'ea') item.giving_gau_credit_code else null,
        "Debit_Code__r.GAU_External_Id__c": item.giving_gau_debit_code default null,
        "Entity__c": item.giving_tax_entity default null,
        "Vendor_Giving_Number__c": if(item.giving_number != null and item.giving_number != '') item.giving_number 
                                   else if(item.giving_giving_number != null and item.giving_giving_number != '') item.giving_giving_number 
                                   else if (item.giving_new_giving_number != null and item.giving_new_giving_number != '') item.giving_new_giving_number 
                                   else null,
        "Vendor_Source__c": item.vendor_name default null,
        "Vendor_Source_Giving__c": item.vendor_name default null,
        "Vendor_Source_Contact__c": item.vendor_name default null, 
        "Opportunity_Affiliate_Name__c": item.affiliate_name default null,
        "Opportunity_Affiliate_Number__c": item.affiliate_number default (item.affiliate_name default null),
        "Opportunity_Affiliate_Number_Override__c": item.opportunity_affiliate_number_override default null,
        "Opportunity_Vendor_Pledge_Number__c": item.opportunity_vendor_pledge_number default null,
       // "Updated_Giving_Number__c": item.giving_updated_source_code default null,
        "Payment_Comments__c": if(item.vendor_type != "Telemarketing") item.giving_comments else null,
        "Payment_Source_Code__c": item.giving_primary_campaign_source default null,
        "Contact1_Deceased_Flag__c": item.contact_1_deceased_flag default null,
        "Contact1_Deceased_Day__c": if(item.contact_1_deceased_date != null) (substringBefore(item.contact_1_deceased_date,"T") splitBy "-")[2] else null,
        "Contact1_Deceased_Month__c": if(item.contact_1_deceased_date != null) (substringBefore(item.contact_1_deceased_date,"T") splitBy "-")[1] else null,
        "Contact1_Deceased_Year__c": if(item.contact_1_deceased_date != null) (substringBefore(item.contact_1_deceased_date,"T") splitBy "-")[0] else null,
        "Contact2_Deceased_Flag__c": item.contact_2_deceased_flag default null,
        "Contact2_Deceased_Day__c": if(item.contact_2_deceased_date != null) (substringBefore(item.contact_1_deceased_date,"T") splitBy "-")[2] else null,
        "Contact2_Deceased_Month__c": if(item.contact_2_deceased_date != null) (substringBefore(item.contact_1_deceased_date,"T") splitBy "-")[1] else null,
        "Contact2_Deceased_Year__c": if(item.contact_2_deceased_date != null) (substringBefore(item.contact_1_deceased_date,"T") splitBy "-")[0] else null,
        "Contact2_Employer__c": item.contact_2_employer_name default null,
        "Contact2_Occupation__c": item.contact_2_occupation default null,
        "Contact_2_Suffix__c": item.contact_2_suffix default null,
        //"Contact_Name_Change__c": if(lower(item.contact_1_name_change) == 'y') 'Y' else 'N',
         "Contact_Name_Change__c": if(item.contact_1_name_change is true) 'Y' else 'N',

        //"Credit_1_Amount__c": item.credit_amount default null,
        "Credit_1_Amount__c":  if(isEmpty(item.credit_1_amount)) (item.credit_amount default null) else item.credit_1_amount,
        "Credit_1_Soft_Credit_Type__c": item.credit_soft_credit_type default null,
        "Credit_Imported__c": item.credit_id default null,
        "Opportunity_Deposit_Ref_Number__c": item.payment_deposit_ref_number default null,
        "Payment_Deposit_Reference_Number__c": item.payment_deposit_ref_number default null,
        "Deposit_Date__c": item.payment_deposit_date default null,
        "Vanid__c": item.alternate_id default null,
        "Contact2_Middle_Name__c": item.contact_2_middle_name default null,
        "Chargent_Card_Expiration_Month__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) item.payment_method_card_expiration_month else null,
        "Chargent_Card_Expiration_Year__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) item.payment_method_card_expiration_year else null,
        "Chargent_Card_Last_4__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) item.payment_method_card_last_four_digits else null,
        "Chargent_Bank_Account_Number__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card"))  item.payment_method_account_number else null,
        "Chargent_Routing_Number__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) item.payment_method_routing_number else null,

        "Chargent_Card_Type__c": 
           if((item.payment_method == "ACH" or  item.payment_method == "Credit Card"))  
               item.payment_method_card_issuer 
           else if((item.payment_method == 'Visa' or item.payment_method == 'MasterCard' or item.payment_method == 'American Express' or item.payment_method == 'Discover')) capitalize(lower(item.payment_method))
               else null,
        "Credit_Card_Issuer__c": 
           if((item.payment_method == "ACH" or  item.payment_method == "Credit Card"))  
               item.payment_method_card_issuer 
           else if((item.payment_method == 'Visa' or item.payment_method == 'MasterCard' or item.payment_method == 'American Express' or item.payment_method == 'Discover')) capitalize(lower(item.payment_method))
               else null,
        "Chargent_Tokenization__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) item.payment_method_card_token else null,
        "Chargent_Billing_First_Name__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) (item.payment_method_card_holder_name default " " splitBy " ")[0] else null,
        "Chargent_Billing_Last_Name__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) (item.payment_method_card_holder_name default " " splitBy " ")[1 to -1] joinBy " " else null,    
        "Chargent_Billing_Phone__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) item.contact_1_phone else null,
        "Chargent_Billing_Email__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) item.contact_1_email else null,
        "Chargent_Billing_Address__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card"))  item.contact_1_address_street_line_1 else null,
        "Chargent_Billing_Address_Line_2__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card"))  item.contact_1_address_street_line_2 else null,
        "Chargent_Billing_City__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card"))  item.contact_1_city else null,
        "Chargent_Billing_State_Province__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) item.contact_1_state_province else null,
        "Chargent_Billing_State__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) getStateName(upper(item.contact_1_country),upper(item.contact_1_state_province)) else null,
        "Chargent_Billing_Zip_Postal__c": if((item.payment_method == "ACH" or  item.payment_method == "Credit Card")) (if(item.contact_1_zip != null) 
                                        
                                                (
                                                        (item.contact_1_zip) ++ (
                                                        if(item.contact_1_zip_plus_4 != null) ("-" ++ (item.contact_1_zip_plus_4 default '')) else "")
                                                ) 
                                                else '') 
                                        else null,
        "Chargent_Billing_Country__c": if(!((item.payment_method == "ACH" or item.payment_method == "Credit Card") )) null else
        countryCodeLookup((item.contact_1_country)),
        "Vendor_Code_1_End_Date__c": item.preference_1_end_date default null,
        "Vendor_Code_1_Start_Date__c": item.preference_1_start_date default null,
        "Vendor_Code_1_Value__c": item.preference_1_code_value default null,
        "Vendor_Code_2_End_Date__c": item.preference_2_end_date default null,
        "Vendor_Code_2_Start_Date__c": item.preference_2_start_date default null,
        "Vendor_Code_2_Value__c": item.preference_2_code_value default null,
        "Vendor_Code_3_End_Date__c": item.preference_3_end_date default null,
        "Vendor_Code_3_Start_Date__c": item.preference_3_start_date default null,
        "Vendor_Code_3_Value__c": item.preference_3_code_value default null,
        "Contact_Detail_Email_Type__c": item.contact_1_email_type default null,
        "Contact_Detail_Email__c": item.contact_1_email default null,
        "Contact_Detail_Phone__c": item.contact_1_phone default null,
        "Contact_Detail_Phone_Confidence_Level__c": item.telematch_confidence_level default null,
        "Contact_Detail_Phone_Duplicate__c": item.telematch_dup_code default false,
        "Contact_Detail_Phone_Match_Level__c": item.telematch_match_level default null,
        "Contact_Detail_Phone_Match__c": item.telematch_match_code default null,
        "Contact_Detail_Phone_Type__c": item.contact_1_phone_type default (item.telematch_phone_type default null),
        "Online_Event_ID__c": item.event_id default null,
        ("Event__c": item.credit_event_campaign_id) if(item.credit_event_campaign_id != null and item.credit_event_campaign_id != ''),
        "Payment_ID__c": if(lower(item.vendor_name) != "tpa") (item.payment_id default null) else null,
        "Recipient_ID__c": item.giving_recipient_id default null,
        "Response_Category__c": item.response_category default null,
        "Response_Date__c": item.response_date default null,
        "Response_Type__c": item.response_type default 'Responded',
        "Response_Source_Code__c": item.response_source_code,
        "Response_Status__c": item.response_status,S
        "Response_Vendor_Source__c": item.response_vendor_source,
        "Vendor_Type__c": item.vendor_type default null,
        "Alt_ID_Email__c": item.alt_id_email default null,
        "Recurring_Donation_Vendor_Pledge_Number__c": if(item.batch_upload_giving_matched != null) null else item.recurring_donation_vendor_pledge_number default null,
        "npsp__Recurring_Donation_Amount__c":  (if(item.batch_upload_giving_matched != null) null else item.recurring_donation_amount default null),
 
        "npsp__Recurring_Donation_Name__c": if(item.batch_upload_giving_matched != null) null else (item.recurring_donation_name default null),
        "npsp__Recurring_Donation_Recurring_Type__c": if(item.batch_upload_giving_matched != null) null else item.recurring_donation_recurring_type default null,
        "npsp__Recurring_Donation_Installment_Period__c": if(item.batch_upload_giving_matched != null) null else item.recurring_donation_installment_period default null,
        "npsp__Recurring_Donation_Installment_Frequency__c": if(item.batch_upload_giving_matched != null) null else item.recurring_donation_installment_frequency default null,
        "npsp__Recurring_Donation_Day_of_Month__c": if(item.batch_upload_giving_matched != null) else item.giving_recurring_day_of_month default null,
       
        "npsp__Recurring_Donation_Planned_Installments__c": item.recurring_donation_planned_installments default null,
        "npsp__Recurring_Donation_Date_Established__c": if(item.batch_upload_giving_matched != null) null else item.recurring_donation_date_established default null,
        "npsp__Recurring_Donation_Effective_Date__c": if(item.batch_upload_giving_matched != null) null else item.recurring_donation_effective_date default null,
        "npsp__Recurring_Donation_End_Date__c": item.recurring_donation_end_date default null,
        "npsp__Recurring_Donation_Status__c": if(item.batch_upload_giving_matched != null) item.recurring_donation_status else null,
        "npsp__Recurring_Donation_Status_Reason__c": item.recurring_donation_status_reason default null,

        "npsp__Recurring_Donation_Payment_Method__c": if(item.batch_upload_giving_matched != null) null else item.recurring_payment_method default null
        
        "Recurring_Donation_Comments__c": if(item.batch_upload_giving_matched != null and item.vendor_type == 'EveryAction') null else item.recurring_donation_comments
                                          else if(item.vendor_type != "Telemarketing") item.recurring_donation_comments 
                                          else null,
        "Acquired_Batch_Number__c": item.acquired_batch_number default null,
        "Acquired_Batch_Sequence__c": item.acquired_batch_sequence default null,
        "Online_Gift__c": item.online_gift default null,
        "Modified_by_Integration_Date__c" : now() as Date ,
        "Modified_by_Integration_Reason__c" : "Updated information provided by the Vendor",
        "Modified_by_Integration_Name__c": item.transaction_id default (correlationId ++ "_" ++ (item.file_name default '')  ++ "_" ++ (item.rownumber as String default ((index + 1) as String default ""))),
        "Pledge__c": item.pledge default null,
        "npsp__Donation_Donor__c": if(item.vendor_name == 'ActBlue' and item.file_name contains 'wire') "Account1"
                                   else if (item.vendor_name == 'ActBlue' and !(item.file_name contains 'wire')) "Contact1"
                                   else if (item.vendor_type == 'TPA') "Contact1"
                                   else if (item.vendor_name contains 'AFFILIATE') "Contact1"
                                   else if (item.vendor_name == 'EveryAction') "Contact1"
                                   else if(item.giving_amount != null and item.giving_amount != '') (if(isEmpty(item.account_1_record_type)) "Contact1" else "Account1") else null
                                   else null,
        "Row_Number__c":  item.rownumber  default null,
        "Exclude_Giving__c":   if(item.giving_amount != null and item.giving_amount != '') false else true,
        "Line_Item_ID__c": item.lineitem_id default null,
        "Credit_1_External_ID__c" : item.credit_1_external_id default null,
        "Wire_Number__c": item.payment_wire default null,
        "Wire_Refunds__c": item.payment_refunds default null,
        "Wire_Net_Giving_Amount__c": item.payment_net_giving_amount default null,
        "npsp_PaymentImported__c": (
            (item.vendor_name) match {
                case file if (lower(file) contains 'actblue') -> item.batch_upload_giving_matched
                case file if (lower(file) contains 'tpa') -> item.payment_id 
                else -> null
            }
        ),
        "Credit_Comments__c" : if(item.credit_comments != null and item.credit_comments != '') item.credit_comments
                               else if(item.payment_id != null and item.payment_id != '') ("Payment_ID - " ++ item.payment_id) 
                               else null,
        "Credit_Acknowledged__c": item.credit_acknowledged default null,
        "Credit_Ack_Code__c": item.credit_ack_code default null,
        "Credit_No_Acknowledgment__c": item.credit_no_ack default null,
        "Credit_Acknowledgment_Date__c": item.credit_ack_date default null,
        "Credit_Acknowledgment_Status__c": if(item.credit_acknowledged != false) "Acknowledged" else if(item.credit_no_ack != false) "Do Not Acknowledge" else null,
        


}))