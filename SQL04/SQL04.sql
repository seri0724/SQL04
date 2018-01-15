--����1
--��� �޿����� ���� �޿��� �޴� ������ �� ���̳� �ֽ��ϱ�? //56��
select count(salary)
from employees
where salary < (select avg(salary)
                from employees);

--����2
--�� �μ����� �ְ��� �޿��� �޴� ����� ������ȣ(employee_id), ��(last_name)�� �޿�(salary)
--�μ���ȣ(department_id)�� ��ȸ�ϼ���. �� ��ȸ����� �޿��� ������������ ���ĵǾ� ��Ÿ���� �մϴ�. //11��
select employee_id, last_name, salary
from employees
where (department_id, salary) in(select department_id, max(salary)
                                 from employees
                                 group by department_id)
order by salary desc;

--����3
--�� ����(job) ���� ����(salary)�� ������ ���ϰ��� �մϴ�. ���� ������ ���� ���� �������� ������(job_title)�� ���� ������ ��ȸ�Ͻÿ�. //19�μ�
select job_title, sum(salary)
from employees e, (select job_id, job_title
                   from jobs) s
where e.job_id = s.job_id
group by job_title
order by sum(salary) desc;

--����4
--�ڽ��� �μ� ��� �޿����� ����(salary)�� ���� ������ ������ȣ(employee_id), ��(last_name)�� �޿�(salary)�� ��ȸ�ϼ���. //38��
select e.employee_id, e.last_name, e.salary
from employees e, (select department_id, avg(salary) salary
                from employees
                group by department_id) s
where e.department_id = s.department_id
and e.salary > s.salary;