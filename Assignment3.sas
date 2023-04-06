libname Orion "/home/u61762417/my_shared_file_links/jhshows0/STA5067/SAS Data/orion";
run;

proc contents data= orion.order_fact position; run; 


/*Question 1 part A */
proc sql; 

select avg(Quantity) as AvgQuantity

from orion.order_fact

;
quit;




/*Question 1 part B */
Title "Employees whose Average Quantity Items Sold Exceeds the Company's Average Items Sold";
proc sql; 

select Employee_ID, AVG(Quantity) as MeanQuantity

from orion.order_fact

group by Employee_ID

having avg(Quantity)>
		(select avg(Quantity) as AvgQuantity

from orion.order_fact)
; 
quit;

proc contents data= orion.employee_payroll position; run;
proc contents data= orion.employee_Addresses position; run;


quit;

/*Question 2 part A */
Title 'Employee IDs for February Anniversaries';
proc sql; 

select Employee_ID, Employee_name

from orion.Employee_Addresses

where employee_Id In

	(select employee_Id
	
	from orion.employee_payroll
	
	where month(birth_date)=2)
; 
quit;


/*Question 2 part  */
Title 'Employees with February Anniversaries';
proc sql; 

select employee_Name, 

	scan(Employee_name, 2) as First_Name,
	scan(Employee_Name, 1) as Last_Name
	

from orion.Employee_Addresses

where employee_Id in

	(select employee_Id
	
	from orion.employee_payroll
	
	where month(birth_date)=2)
; 
quit;


proc contents data= orion.staff position; run;

Proc sql;
select *
from orion.staff
;quit;



/*Question 3 */
Title 'Level 1 or 2 Purchasing Agents who are older than ALL Purchasing Agent Ills';
Proc sql; 
select 	
	employee_ID,
	
	Job_title, 
	
	Birth_date,
	
	-INT((Birth_date -'24Nov2007'd)/365.25) as Age
	
	

from orion.staff

where job_title In ('Purchasing Agent I','Purchasing Agent II')
	
	and birth_date < all 
	
	(select birth_date from orion.staff where job_title= 'Purchasing Agent III')

; quit;



Proc contents data= orion.order_fact position; run;



/*Question 4 Part A */

Title 'Employee with the Highest';
proc sql; 

select Employee_ID, 
	sum(Total_retail_price*Quantity) as total_sales
	
	
from orion.order_fact

group by employee_Id

having employee_Id NOT = 99999999 
	
and
		calculated total_sales >= all
	
	(select sum(total_retail_price*Quantity) from orion.order_fact 
	
	group by employee_id 
	
	having employee_Id NOT = 99999999)
 
order by total_sales asc
; 
quit;


/*Question 4 Part B */	
proc sql; 

select Employee_ID, 
		employee_name
	
	
from orion.employee_addresses

group by employee_Id

having employee_Id NOT = 99999999 
	
and
		employee_ID  In (select employee_ID from orion.order_fact group by employee_iD
		
having 
		 sum(total_retail_price*Quantity)>= all
	
	(select sum(total_retail_price*Quantity) from orion.order_fact
	
	group by employee_id 
	
	having employee_Id NOT = 99999999))

; 
quit;



/*Question 4 Part C */	
Title 'Name of Employee with the Highest Sales';

proc sql; 

select distinct e.Employee_ID, 
		employee_name,
		sum(Total_retail_price*Quantity) as total_sales
	
	
from orion.employee_addresses as s, 
	orion.order_fact as e

where s.employee_id = e.employee_Id

group by e.employee_Id

having e.employee_Id NOT = 99999999 
	
and
		e.employee_ID  In (select employee_ID from orion.order_fact group by employee_iD
		
having 
		 sum(total_retail_price*Quantity)>= all
	
	(select sum(total_retail_price*Quantity) from orion.order_fact
	
	group by employee_id 
	
	having employee_Id NOT = 99999999))
	

; 
quit;



/* Question 5 */

Proc sql; 

select 
	employee_Id, 
	month(Birth_date) as birth_month
	
from orion.employee_payroll as e

where 'AU' = 

(select country from orion.employee_addresses as A 

where a.employee_Id=e.employee_Id)

order by 2 asc

;
quit;



/*Question 6 */
Title 'Employees with Donations > 0.002 of their salary';

proc sql; 

select employee_ID,
		
		Employee_gender,
		
		Marital_status
		
from
	orion.employee_payroll as s 
	
having .002*salary <

	(select sum(qtr1,qtr2,qtr3,qtr4) from orion.employee_donations as a
	
	where s.employee_Id=a.employee_Id)
	
; quit;
	






























