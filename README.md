# Displaying-Queries
1.   Enhancing Output with Titles and Formats
Use the table orion.employee_payroll to produce a report:
a.   Select only the Employee_ID, Salary, and a new column Tax that is one third of the salary.
b.   Select only rows for which Gender=”M” and marital_status=”S” and employee_term_date is not missing.
c.   Display the Tax and Salary columns using the COMMA10.2 format.
d.   Order the report by Salary in descending order.
e.   Add this title to the report: Single Male Employee Salaries.

2.   Using Formats to Limit the Width of Columns in the Output
Write a query that retrieves the Supplier_Name, Product_Group, and Product_Name columns from the table orion.Product_dim.
a.   Add this title to the report: Australian Clothing Products.
b.   Include only rows where Product_Category = "Clothes" and Supplier_Country = "AU" (Australia).
c.   Assign an appropriate label to the columns Supplier, Group, and Product, respectively.
d.   Order the report by Product_Name.
3.   Enhancing Output with Multiple Techniques
Create a report that displays Customer_ID, the customer’s name written as Customer_LastName, Customer_FirstName, and Gender, as well as the customer’s age as of 31DEC2007. Use the data contained in the orion.Customer table. Include only U.S. customers who were more than 50 years old on 31DEC2007. Present the data ordered by descending age, last name, and first name. Give the report an appropriate title. The Customer_ID values must be displayed with leading zeros. 
4.   Summarizing Data
Create a report that displays the number of employees residing in each city.
a.   Use the City column and the COUNT(*) function.
b.   Use the orion.Employee_Addresses table.
c.   Group the data and order the output by City.
d.   Add this title to the report: Cities Where Employees Live.
5.   Using SAS Functions
Create a report that includes each employee’s age at time of employment.
a.   The report should contain the columns Employee_ID, Birth_Date, Employee_Hire_Date, and Age.
b.   Obtain the data for the report from the orion.Employee_Payroll table. 
c.   Calculate Age as INT((Employee_Hire_Date  Birth_Date)/365.25).
d.   Add this title to the report: Age at Employment.
e.   Display Birth_Date and Employee_Hire_Date values using the MMDDYY10. format.
f.   Label each column appropriately:
For the purpose of this report, an employee’s age when hired can be computed by taking the integer portion of (Employee_Hire_Date  Birth_Date)/365.25.
6.   Summarizing Data
a.   Using data contained in the orion.Customer table, create a report that shows the following statistics for each country:
1)   total number of customers
2)   total number of male customers
3)   total number of female customers
4)   percent of all customers that are male (Percent Male)
b.   Add this title to the report: Customer Demographics: Gender by Country.
c.   Arrange the report by value of Percent Male so that the country with the lowest value is listed first, with the remaining countries following in ascending order.
The Boolean expression (Customer_Gender="M") evaluates as 1 when true and 
0 when false.
7.   Summarizing Data in Groups
Use the orion.Customer table to determine the number of Orion Star customers of each gender in each country. Display columns titled Country, Male Customers, and Female Customers. Display only those countries that have more female customers than male customers. Order the report by descending female customers. Add this title to the report: Countries with more Female than Male Customers.
![image](https://user-images.githubusercontent.com/101452475/230444596-fead3633-c18a-429b-bad7-ba6f5d2d0304.png)
