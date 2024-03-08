output application/json

fun numericDataFormat(data) = (
 (data 
 replace /[()]*/ with ""
 replace /^[$\s]*/ with ""
 replace /\s*$/ with ""
  ) as Number {format: "#.00" }
)

fun formatCloseDate(data) = (
    if (data matches /\d{1,2}(\/|-)\d{1,2}(\/|-)\d{2}/) 
         data as Date {format: 'M/dd/yyyy'} as Date {format: 'yyyy-MM-dd'}

    else if (data matches /\d{1,2}(\/|-)\d{1,2}(\/|-)\d{4}/) 
        data as Date {format: 'M/d/yyyy'} as Date {format: 'yyyy-MM-dd'}

    else if (data matches /\d{4}(\/|-)\d{1,2}(\/|-)\d{2,4}/) 
        data as Date {format: "yyyy-MM-dd"}
    else 
        null
)


---
payload map (item,index) -> ({
	transaction_id: item.transaction_id default (correlationId ++ "_" ++ item.file_name ++ "_" ++ (item.wire)),
	rownumber: item.rownumber default (index + 1),
	status: "Data parsed into Staging Table",
	last_modified_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	upload_date: now() as DateTime {format: "yyyy-MM-dd HH:mm:ss.SSS"},
	file_name: item.file_name default null,
	payment_net_giving_amount: numericDataFormat(item.net_amount default null) ,
	giving_close_date: formatCloseDate(item.disbursement_date)  , //default null, 
	payment_deposit_date: formatCloseDate(item.disbursement_date) default null,
	giving_comments: "Contributions = " ++ (numericDataFormat(item.contributions) as String default '') ++ "| Fees = " ++ (item.fee as String default '') ++ "| Net Amount = " ++ ( numericDataFormat(item.net_amount) as String default ''), 
	payment_wire: ("AB" ++ (item.wire as String default '')) default null,
	payment_check_number: ("AB" ++ (item.wire as String default '')) default null,
	payment_refunds: numericDataFormat(item.refunds) default null,
	affiliate_name: item.account default null,
	vendor_name: 'ActBlue',
	vendor_type: 'TPA',
	giving_tax_entity: if(item.account == 'PPFA') 'C3' else if(item.account == 'PPAF') 'C4' else null,
	//account_1_id: ((vars.cache).npsp_account_id) default '0011700001cyBCFAA2',
	batch_upload_account_matched: ((vars.cache).npsp_account_id) default '0011700001cyBCFAA2',	
	giving_gau_credit_code: if(item.account == 'PPFA') 'C312610' else if(item.account == 'PPAF') 'C412620' else null,
	giving_name: (item.file_name as String default '') ++ ":" ++ ("AB" ++ (item.wire as String default '')),
	donation_name: (item.file_name as String default '') ++ "_" ++ ("AB" ++ (item.wire as String default '')),
	giving_primary_campaign_source: if(item.account == 'PPFA') '3NLDUEGXWXABN1' else if (item.account == 'PPAF') '4NLDUEGXWXABN1' else null,
	payment_method: "Wire Transfer",
	opportunity_affiliate_number_override: true,
	giving_gau_debit_code: if(item.account == 'PPFA') 'C312610' 
						   else if(item.account == 'PPAF') 'C412620'
						   else null
})