-- Databricks notebook source
create or replace table table_email_links_closed as

with email_profile_data as (
    select
        CAST(SUBSTRING(email_user.entity_reference_id, 3) AS STRING) as user_id,
        email_user.deactivation_reason_id
    from email_user_profile email_user 
)

select 
email.user_id
