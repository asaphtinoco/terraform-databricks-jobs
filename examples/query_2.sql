-- Databricks notebook source
create or replace table table_5 as

with table_6 as (
    select
        col_1.col_2 AS col_3,
        regexp_extract(trim(col_4.col_5), '([0-9]+)') as col_6,
        regexp_extract(trim(col_4.col_7), '([0-9]+)') as col_8,
        case
            when LENGTH(col_9.col_10) = 7 then LEFT(col_9.col_10, 2) || '/' || RIGHT(col_9.col_10, 2)
            when LENGTH(col_9.col_10) = 6 then '0' || LEFT(col_9.col_10, 1) || '/' || RIGHT(col_9.col_10, 2)
            else REPLACE(col_9.col_10, '-', '/')
        end as col_11,
        col_9.col_12 AS col_13,
        col_1.col_14 as col_15,
        col_1.col_16,
        col_1.col_17
    from table_7 col_1
    join table_8 col_9 
        on col_1.col_2 = col_9.col_18
    join table_9 col_4 
        on col_9.col_19 = col_4.col_20 and col_4.col_5 = LEFT(col_9.col_21, 6) and col_4.col_7 = RIGHT(col_9.col_21, 4)
    where col_4.col_5 is not null
        and col_4.col_7 is not null
        and col_9.col_10 is not null
    group by all
),

table_user_data AS (
    select
        CAST(SUBSTRING(col_up.entity_reference_id, 3) AS STRING) as user_id,
        col_up.is_enabled,
        col_up.deactivation_reason_id
    from table_user_profile_data col_up
    group by all
)

select
    table_card_data.user_id,
    CONCAT(table_card_data.bin, '******', table_card_data.last_digits, ' ', table_card_data.expiry_date) AS card_number_expiry,
    'card_number_expiry' AS identifier_type,
    linked_table.user_id AS linked_from_user_id,
    table_card_data.transaction_number,
    table_card_data.sender_name,
    table_card_data.date_of_birth,
    country_table.country_name AS sender_sign_up_send_country,
    case
        when user_profile.deactivation_reason_id = 2 then 'COMPLIANCE'
        when user_profile.deactivation_reason_id = 5 then 'FRAUD'
    end as reason
from table_cards_data table_card_data
join linked_table linked_table
    on table_card_data.bin = linked_table.bin and table_card_data.last_digits = linked_table.last_digits and linked_table.expiry_date=linked_table.expiry_date 
left join country_table country_table 
   on sender_country_code= country_code;
