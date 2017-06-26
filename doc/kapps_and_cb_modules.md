## Usefull kapps
```
"braintree",
"cccp",
"hotornot",
"konami",
"jonny5",
"onbill",
"spyvsspy",
"frontier",
"kazoo_call",
"tasks"
```

## Usefull Crossbar modules

```
"cb_acls",
"cb_allotments",
"cb_braintree",
"cb_cccps",
"cb_recordings",
"cb_periodic_fees",
"cb_lists",
"cb_access_lists",
"cb_dialplans",
"cb_queues",
"cb_tasks"
```

## Onbill Crossbar modules

```
"cb_onbills",
"cb_onbill_carriers",
"cb_onbill_variables",
"cb_onbill_transactions",
"cb_onbill_service_plans",
"cb_promised_payment",
"cb_onbill_e911",
"cb_onbill_pvt_limits",
"cb_onbill_trial",
"cb_onbill_proforma",
```

## Some DB flags to consider

```
sup kapps_config set_boolean topup enable true

sup ecallmgr_maintenance enable_authz
sup kapps_config set ecallmgr authz_default_action deny
sup kapps_config set_boolean ecallmgr authz_dry_run false
sup kapps_config set_boolean ecallmgr outbound_rate_required true
sup kapps_config set_boolean ecallmgr inbound_rate_required false
sup kapps_config set_boolean ecallmgr should_detect_inband_dtmf false
sup kapps_config set_boolean ecallmgr use_kazoo_dptools true
sup kapps_config set_boolean ecallmgr restrict_channel_state_publisher true

sup kapps_config set_boolean kazoo_endpoint should_add_diversion_header true

sup kapps_config set_boolean hotornot filter_by_resource_id true
sup kapps_config set_boolean hotornot use_trie true

sup kapps_config set_boolean trunkstore ensure_valid_caller_id true
sup kapps_config set_boolean trunkstore honor_diversions_by_cid_validation true

sup kapps_config set_boolean number_manager unauthorized_numbers_lookup true
sup kapps_config set_boolean number_manager should_age true

sup kapps_config set_boolean media store_recordings true
sup kapps_config set_integer media record_min_sec 3
sup kapps_config set_integer media max_recording_time_limit 7200

sup kapps_config set_boolean fax ensure_valid_caller_id true

sup kapps_config set_boolean callflow ensure_valid_caller_id true

sup kapps_config set_integer crossbar pagination_page_size 1000
sup kapps_config set_integer crossbar token_auth_expiry 21600
sup kapps_config set_integer crossbar.braintree max_account_credit 700
sup kapps_config set_boolean crossbar.channels system_wide_channels_list true
sup kapps_config set_json token_buckets crossbar {\"max_bucket_tokens\":2000\,\"tokens_fill_rate\":10\,\"tokens_fill_time\":\"second\"}
```
```
sup kapps_config set_boolean services sync_services true
sup kapps_config set_string services master_account_bookkeeper kz_bookkeeper_onbill
```
```
sup kapps_config set number_manager default_country RU
sup kapps_config set crossbar.phone_numbers default_country RU
```

```
sup notify_maintenance configure_smtp_relay my.relay.com
sup notify_maintenance configure_smtp_username username
sup notify_maintenance configure_smtp_password password
sup notify_maintenance configure_smtp_auth always
sup notify_maintenance configure_smtp_port 25

```
### Edit manually
```
dialplans - obsoleted style dialpan management

frontier -> rate_limits

jonny5 -> default_promised_payment
jonny5 -> default_allotments

metaflows -> patterns

number_manager:
      carrier_modules
      available_module_name
number_manager.*

services -> master_account_bookkeeper
services -> modules -> add kz_service_periodic_fees
```
