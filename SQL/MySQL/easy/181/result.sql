SELECT
    employee.name as Employee
FROM Employee employee
INNER JOIN Employee manager ON manager.id = employee.managerId
WHERE employee.salary > manager.salary;