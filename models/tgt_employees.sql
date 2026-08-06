{{
    config(materialized= 'incremental',
    incremental_strategy= 'insert_overwrite',
    unique_key= 'Employee_id',
    partition_by = {'field': 'Load_time', 'data_type': 'timestamp'})
    }}

    select 
EMPLOYEE_ID,
FIRST_NAME,
LAST_NAME,
EMAIL,
PHONE_NUMBER,
HIRE_DATE,
JOB_ID,
SALARY,
COMMISSION_PCT,
MANAGER_ID,
DEPARTMENT_ID,
current_timestamp() LOAD_TIME
from ods.hr.src_employees as src

{% if is_incremental() %}
where src.load_time > dateadd(day, -7, current_timestamp)
{% endif %}