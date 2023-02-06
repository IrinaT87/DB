create table if not exists Department (
	id SERIAL primary key,
	name VARCHAR (80) not null
);


create table if not exists Employee (
	id SERIAL primary key,
	name VARCHAR(60) not null,
	superior_id INTEGER not null references Employee(id),
	department_id INTEGER not null references Department(id)
);




