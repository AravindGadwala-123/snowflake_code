{{
    config( 

        materialized='table',
        transient=false
    )
}}

select P1.PATIENT_ID,
P1.PATIENT_NAME,
P1.GENDER,
P2.PHONE,
P2.EMAIL,
P2.BLOOD_GROUP from {{source('datafeed_shared_schema','PATIENTS')}} P1
join 
{{ ref('patient_details') }} P2 
on P1.PATIENT_ID=P2.PATIENT_ID;