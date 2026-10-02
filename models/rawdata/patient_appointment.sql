{{ 
    config 
    ( 
     materialized='table',
     transient=false 

    )

    }}

    select P.*,A.APPOINTMENT_ID,A.PROVIDER_ID,A.APPOINTMENT_DATE,
    A.DIAGNOSIS from {{ source('datafeed_shared_schema', 'PATIENTS') }} P
    join
    {{ source('datafeed_shared_schema', 'APPOINTMENTS') }} A 
    on P.PATIENT_ID=A.PATIENT_ID;
    
    
    
    
    
    