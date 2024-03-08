import * from dw::core::Strings 
output application/json 
--- 
(payload map (item,in) -> ( {
            npsp__Batch_Description__c: item.batch_description default null,
            npsp__Expected_Total_Batch_Amount__c: item.expected_total_amount default null, 
            npsp__Expected_Count_of_Gifts__c: item.expected_total_rows default null,
            transaction_id: item.transaction_id default null,
            File_Name__c: item.file_name default null,
            npsp__Process_Using_Scheduled_Job__c: true,
            Entity__c: (
                (item.file_name) match {
                    case file if upper(file) contains 'C3' -> 'C3'
                    case file if upper(file) contains 'C4' -> 'C4'
                    case file if upper(file) contains 'PAC' -> 'PAC'
                    case file if upper(file) contains 'VOTES' -> 'PP VOTES'
                    case file if file contains 'america-46954' -> 'C3'
                    case file if file contains 'action-fund-28872' -> 'C4'

                    else -> null
                }
            ) default (item.entity default null),
       
            npsp__Contact_Matching_Rule__c: "Contact Duplicate Rules",

            Deposit_Location_Description__c: ((item.file_name) match {
                case file if((lower(file) contains "moore") and (lower(file) contains "c3")) -> if(lower(item.payment_method) == "eft" or lower(item.payment_method) == "charge card") "C312800" else "C312615"
                case file if((lower(file) contains "moore") and (lower(file) contains "c4")) -> if(lower(item.payment_method) == "eft" or lower(item.payment_method) == "charge card") "C412800" else "C412625"
                case file if((lower(file) contains "moore") and (lower(file) contains "votes")) -> if(lower(item.payment_method) == "eft" or lower(item.payment_method) == "charge card") "PV12800" else "PV12640"
                case file if((lower(file) contains "moore") and (lower(file) contains "pac")) -> if(lower(item.payment_method) == "eft" or lower(item.payment_method) == "charge card") "PC12800" else "PC12630"
                case file if((lower(file) contains 'ea_') and (lower(file) contains 'c3')) -> 'C312800'
                case file if((lower(file) contains 'ea_') and (lower(file) contains 'c4')) -> 'C412800'
                case file if((lower(file) contains 'ea_') and (lower(file) contains 'votes')) -> 'PV12800'
                case file if((lower(file) contains 'ea_') and (lower(file) contains 'pac')) -> 'PC12800'
                case file if((lower(file) contains 'canvassing') and (lower(file) contains 'c3')) -> 'C312800'
                case file if((lower(file) contains 'canvassing') and (lower(file) contains 'c4')) -> 'C412800'
                case file if(((lower(file) contains 'causeworx') or (lower(file) contains 'signia') or (lower(file) contains 'telefund') or (lower(file) contains 'gsi') or (lower(file) contains 'targetsmart') or (lower(file) contains 'sda') or (lower(file) contains 'acd') ) and (lower(file) contains 'c3')) -> 'C312800'
                case file if(((lower(file) contains 'causeworx') or (lower(file) contains 'signia') or (lower(file) contains 'telefund') or (lower(file) contains 'gsi') or (lower(file) contains 'targetsmart') or (lower(file) contains 'sda') or (lower(file) contains 'acd') ) and (lower(file) contains 'c4')) -> 'C412800'
                case file if(((lower(file) contains 'causeworx') or (lower(file) contains 'signia') or (lower(file) contains 'telefund') or (lower(file) contains 'gsi') or (lower(file) contains 'targetsmart') or (lower(file) contains 'sda') or (lower(file) contains 'acd') ) and (lower(file) contains 'pac')) -> 'PC12800'
                else -> (item.deposit_reference default null)
            }),
            


            Import_Source__c: if((item.file_name contains "Soft_Credit") or (item.file_name contains "Tasks") or (item.file_name contains "Sustainer")) "User Upload" else "Vendor",
            //DS-2789
            Vendor_Source__c: (item.file_name) match {
                case file if file contains "Canvassing" -> "Canvassing"
                case file if file contains "Causeworx" -> "Telemarketing"
                case file if file contains "ea_" -> "EveryAction"
                case file if file contains "GSI" -> "GSI"
                case file if file contains "moore" -> "Moore"
                case file if file contains "Moore" -> "Moore"
                case file if file contains "Signia" -> "Signia"
                case file if file contains "ActBlue" -> "ActBlue"
                case file if file contains "america-46954" -> "ActBlue"
                case file if file contains "action-fund-28872" -> "ActBlue"
                case file if file contains "ACD" -> "DRTV"
                case file if file contains "Telematch" -> "Telematch"
                case file if file contains "Telefund" -> "Telefund"
                case file if file contains "AccurateAppend" -> "Telematch"
                case file if file contains "Benevity" -> "TPA"
                case file if file contains "Sustainers" -> "AFFILIATE-SUST"
                else -> null 
            },
            Affiliate__c: item.affiliate default null,
            Batch_Deposit_Date__c: item.batch_deposit_date as DateTime {format: "yyyy-MM-dd HH:mm:ssx"} as DateTime {format: "yyyy-MM-dd'T'HH:mm:ss"}
 default null,
            
            Name: (item.file_name) match {
                case file if file contains 'ActBlue' -> (item.file_name default '') ++ "_" ++ substringAfter((item.transaction_id default ''),'_')
                case file if file contains 'action-fund-28872' -> 'C4_ActBlue_Donation_' ++ ((now() as Date) as String) ++ "_" ++ (substringBefore((substringAfterLast(item.file_name,"-")),"."))
                case file if file contains 'america-46954' -> 'C3_ActBlue_Donation_' ++ ((now() as Date) as String) ++ "_" ++ (substringBefore((substringAfterLast(item.file_name,"-")),"."))
                else -> (item.file_name default '')

            },
           OwnerId: item.batch_owner default null,
           npsp__Post_Process_Implementing_Class__c: "cfg_IntegrationBDIPostProcess",
           (GAU_Deposit_Location__r: {
               GAU_External_Id__c: 
                ((item.file_name) match {
                    case file if((lower(file) contains "moore") and (lower(file) contains "c3")) -> if(lower(item.payment_method) == "eft" or lower(item.payment_method) == "charge card") "C312800" else "C312615"
                    case file if((lower(file) contains "moore") and (lower(file) contains "c4")) -> if(lower(item.payment_method) == "eft" or lower(item.payment_method) == "charge card") "C412800" else "C412625"
                    case file if((lower(file) contains "moore") and (lower(file) contains "votes")) -> if(lower(item.payment_method) == "eft" or lower(item.payment_method) == "charge card") "PV12800" else "PV12640"
                    case file if((lower(file) contains "moore") and (lower(file) contains "pac")) -> if(lower(item.payment_method) == "eft" or lower(item.payment_method) == "charge card") "PC12800" else "PC12630"
                    case file if((lower(file) contains 'ea_') and (lower(file) contains 'c3')) -> 'C312800'
                    case file if((lower(file) contains 'ea_') and (lower(file) contains 'c4')) -> 'C412800'
                    case file if((lower(file) contains 'ea_') and (lower(file) contains 'votes')) -> 'PV12800'
                    case file if((lower(file) contains 'ea_') and (lower(file) contains 'pac')) -> 'PC12800'
                    case file if((lower(file) contains 'canvassing') and (lower(file) contains 'c3')) -> 'C312800'
                    case file if((lower(file) contains 'canvassing') and (lower(file) contains 'c4')) -> 'C412800'
                    case file if(((lower(file) contains 'causeworx') or (lower(file) contains 'signia') or (lower(file) contains 'telefund') or (lower(file) contains 'gsi') or (lower(file) contains 'targetsmart') or (lower(file) contains 'sda') or (lower(file) contains 'acd') ) and (lower(file) contains 'c3')) -> 'C312800'
                    case file if(((lower(file) contains 'causeworx') or (lower(file) contains 'signia') or (lower(file) contains 'telefund') or (lower(file) contains 'gsi') or (lower(file) contains 'targetsmart') or (lower(file) contains 'sda') or (lower(file) contains 'acd')) and (lower(file) contains 'c4')) -> 'C412800'
                    case file if(((lower(file) contains 'causeworx') or (lower(file) contains 'signia') or (lower(file) contains 'telefund') or (lower(file) contains 'gsi') or (lower(file) contains 'targetsmart') or (lower(file) contains 'sda') or (lower(file) contains 'acd')) and (lower(file) contains 'pac')) -> 'PC12800'
                    case file if((lower(file) contains 'acd') and (lower(file) contains 'c3')) -> 'C312800'
                    case file if((lower(file) contains 'actblue') and (lower(file) contains 'wire') and (lower(item.entity) == 'c3')) -> 'C312610'
                    case file if((lower(file) contains 'actblue') and (lower(file) contains 'wire') and (lower(item.entity) == 'c4')) -> 'C412620'
                    else -> (item.deposit_location default null)
                }),
                "type": "npsp__General_Accounting_Unit__c"
                }) if( !((lower(item.file_name) contains 'tpa') or 
                (lower(item.file_name) contains 'planned')  or 
                (lower(item.file_name) contains 'soft_credits')  or
                  (lower(item.file_name) contains 'actblue')) or (lower(item.file_name) contains 'telematch') or (lower(item.file_name) contains 'sustainer') )
        }))