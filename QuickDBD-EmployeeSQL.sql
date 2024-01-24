-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/c3rCkk
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Dept_Emp] (
    [emp_no] INT  NOT NULL ,
    [dept_no] VARCHAR(8)  NOT NULL ,
    [from_date] DATE,  NOT NULL ,
    [to_date] DATE  NOT NULL 
)

CREATE TABLE [Employees] (
    [emp_no] INT  NOT NULL ,
    [birth_date] DATE,  NOT NULL ,
    [first_name] VARCHAR(35),  NOT NULL ,
    [last_name] VARCHAR(35),  NOT NULL ,
    [gender] VARCHAR(1),  NOT NULL ,
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Salaries] (
    [emp_no] INT  NOT NULL ,
    [salary] INT  NOT NULL ,
    [from_date] DATE  NOT NULL ,
    [to_date] DATE  NOT NULL 
)

CREATE TABLE [Departments] (
    [dept_no] VARCHAR(8)  NOT NULL ,
    [dept_name] VARCHAR(40)  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Dept_Manager] (
    [dept_no] VARCHAR(8)  NOT NULL ,
    [emp_no] INT  NOT NULL ,
    [from_date] DATE  NOT NULL ,
    [to_date] DATE  NOT NULL 
)

CREATE TABLE [Titles] (
    [emp_no] INT  NOT NULL ,
    [title] VARCHAR(40),  NOT NULL ,
    [from_date] DATE,  NOT NULL ,
    [to_date] DATE  NOT NULL 
)

ALTER TABLE [Dept_Emp] WITH CHECK ADD CONSTRAINT [FK_Dept_Emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Dept_Emp] CHECK CONSTRAINT [FK_Dept_Emp_emp_no]

ALTER TABLE [Dept_Emp] WITH CHECK ADD CONSTRAINT [FK_Dept_Emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Dept_Emp] CHECK CONSTRAINT [FK_Dept_Emp_dept_no]

ALTER TABLE [Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Dept_Manager] ([emp_no])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_emp_no]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

ALTER TABLE [Dept_Manager] WITH CHECK ADD CONSTRAINT [FK_Dept_Manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Dept_Manager] CHECK CONSTRAINT [FK_Dept_Manager_dept_no]

ALTER TABLE [Titles] WITH CHECK ADD CONSTRAINT [FK_Titles_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Titles] CHECK CONSTRAINT [FK_Titles_emp_no]

COMMIT TRANSACTION QUICKDBD