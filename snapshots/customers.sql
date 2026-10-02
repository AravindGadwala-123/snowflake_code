{% snapshot customers %}
    {{
        config(
            target_schema='snapshot',
            unique_key='CUSTOMER_ID',
            strategy='timestamp',
            invalidate_hard_deletes= true,
            updated_at='UPDATED_AT'
        )
    }}

    select * from {{ source('datafeed_shared_schema', 'CUSTOMERS') }}
 {% endsnapshot %}