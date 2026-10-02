{{ 
      config
      ( 
        materialized='table',
        transient=false
      )
    
}}

SELECT
    P.PATIENT_ID,
    P.PATIENT_NAME,
    P.GENDER,
    A.APPOINTMENT_ID,
    A.APPOINTMENT_DATE,
    A.DIAGNOSIS,
    PR.PROVIDER_NAME,
    I.INSURANCE_PROVIDER,
    C.CLAIM_AMOUNT,
    C.CLAIM_STATUS,
    PY.PAYMENT_AMOUNT
    FROM {{source('datafeed_shared_schema','PATIENTS')}}  P join 
    {{source('datafeed_shared_schema','APPOINTMENTS')}} A
    on P.PATIENT_ID=A.PATIENT_ID
    JOIN
    {{source('datafeed_shared_schema','CLAIMS')}} C
    ON A.APPOINTMENT_ID=C.APPOINTMENT_ID
    JOIN 
    {{source('datafeed_shared_schema','PROVIDERS')}} PR
    ON A.PROVIDER_ID=PR.PROVIDER_ID
    JOIN 
     {{source('datafeed_shared_schema','INSURANCE')}} I
     ON I.INSURANCE_ID=C.INSURANCE_ID
     JOIN 
     {{source('datafeed_shared_schema','PAYMENTS')}} PY 
     ON
     PY.CLAIM_ID=C.CLAIM_ID;


