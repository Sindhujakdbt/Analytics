select *from {{ ref('firststage_employees') }}
where salary <=0