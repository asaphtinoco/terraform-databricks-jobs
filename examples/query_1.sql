-- Databricks notebook source

create or replace table table_1 as

with table_4 as (
    select
        CAST(SUBSTRING(col_17.col_4, 3) as col_8) as col_34,
        col_17.col_16
    from table_2 col_17
    group by all
)

select
    col_24.col_34,
    col_24.col_29 as col_25,
    col_24.col_9,
    explode(split(col_24.col_11, ',')) as col_30,
    col_24.col_20,
    col_24.col_12,
    col_24.col_28,
    col_24.col_13,
    case
        when col_1.col_16 = 2 then 'col_22'
        when col_1.col_16 = 5 then 'col_23'
    end as col_35
from table_3 col_24
left join table_4 col_1
    on col_24.col_34 = col_1.col_34
where col_24.col_21 = 'false'
    and col_1.col_16 IN (2, 5);

