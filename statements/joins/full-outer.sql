select
  employee_name,
  department_name
from
  employees e
full outer join departments d
  on d.department_id = e.department_id
--where department_name is null or employee_name is null;
