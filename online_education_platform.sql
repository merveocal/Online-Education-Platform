select * from pg_catalog.pg_tables

-- 1. Veritabanı Şeması Tasarımı

create table Members(
	memeber_id int primary key,
	name_ varchar(50),
	surname_ varchar(50),
	user_name varchar(50) unique,
	email varchar(100) unique,
	password varchar(255),
	recorded_date timestamp
)
alter table Members rename column memeber_id to member_id -- kolon adını sonradan düzeltme

alter table Members 
	alter column user_name set not null


alter table Members
	alter column email set not null

alter table Members
	alter column password set not null


select * from Members
-----------------------------------------------------------------------------

create table education(
	education_id int primary key,
	name_ varchar(200),
	text_ text,
	start_date date,
	end_date date,
	instructor_info varchar(100)
)
alter table education rename column text_ to description

alter table education
	alter column name_ set not null

alter table education
	alter column start_date set not null

alter table education
	alter column end_date set not null


alter table education
	alter column created_at type date 

alter table education
	alter column created_at set default current_date

alter table education 
	add column category_id int, add constraint fk_category foreign key(category_id) references Categories(category_id)

select * from education
---------------------------------------------------------------------------------------------------------

create table Categories(
	category_id serial primary key,
	category_name varchar(100) unique not null
)
select * from categories

---------------------------------------------------------------------------------------------------------

create table Enrollments(
	enrollments_id serial primary key,
	member_id int not null,
	category_id int not null,
	enroll_date timestamp default current_timestamp,
	foreign key(member_id) references Members(member_id),
	foreign key (category_id) references education(education_id)
)
select * from enrollments

----------------------------------------------------------------------------------------------------

create  table Certificates(
	certificate_id serial primary key,
	certificate_code varchar(100) unique not null,
	issue_date date default current_date not null
)
select * from Certificates

----------------------------------------------------------------------------------------------------

create table CertificateAssignments(
	certificateAssignments_id serial primary key,
	member_id int not null,
	certificate_id int not null,
	assignment_date date default current_date,
	foreign key(member_id) references Members(member_id),
	foreign key(certificate_id) references Certificates(certificate_id)	
)
select * from CertificateAssignments

-------------------------------------------------------------------------------------------------------------


create table BlogPosts(
	blog_posts_id serial primary key,
	title varchar(255) not null,
	content_ text not null,
	published_date timestamp default current_timestamp,
	author_id int not null,
	foreign key(author_id) references Members(member_id)
)
	select * from BlogPosts


-------------------------------------------------------------------------------------------------------------
select * from pg_catalog.pg_tables

	-- INSERT İŞLEMİ
insert into Members(member_id,name_, surname_, user_name, email, password, recorded_date) 
	values(1,'Eda', 'Ece', 'edaEce', 'eda2ece@gmail.com','eda2ece789', '27.04.2025')

insert into Members(member_id,name_, surname_, user_name, email, password, recorded_date) 
	values(2,'Ali', 'Asaf', 'aliAS', 'ali3asaf@gmail.com','ali3asaf789', '11.05.2019'),
			(3,'Eren','Bülbül','erenblb','eren2@gmail.com','eren4blbb','11.08.2017'),
			(4,'Özgecan','Kılıç','ozgcanasl','ozgeca@gmail.com', 'ozgasl789', '11.02.2015'),
			(5,'İkbal', 'Kısa', 'ikblks','ikbal@gmail.com', 'ikb147', '04.10.2024'),
			(6,'Ayşen', 'Hilal','aysehll', 'aysenur@gmail.com', 'ayshll','04.10.2024')


select * from members
---------------------------------------------------------------------
select * from education

delete from education where education_id = 1

insert into education values(2, 'Cyber Security', 'Cyber security protects computers, networks, and data from cyber attacks.
It prevents unauthorized access, data theft, and system damage.', '01.01.2024', '05.06.2024', 'İlayda Aytaş', '27.04.2025',2 )

insert into education values
(1, 'Artificial İntelligence', 'Artificial Intelligence (AI) is the ability of machines to perform tasks that normally require human intelligence.', '02.06.2022','04.08.2022','Ayşegül Çetin','27.04.2024',1)

insert into education(education_id, name_, description, start_date, end_date, instructor_info, category_id) values
(3, 'Block Chain', 'Blockchain is a decentralized digital ledger that securely records transactions across many computers.', '04.08.2021', '12.09.2021','Eda Ece', 3)

insert into education(education_id, name_, description, start_date, end_date, instructor_info, category_id) values
(4, 'Frontend Developer', 'A front-end developer builds the parts of a website or application that users see and interact with directly.', '07.12.2020', '07.03.2021', 'Nazlı Kozan',4)


insert into education(education_id, name_, description, start_date, end_date, instructor_info, category_id) values
(5, 'Database Administration', 'Database administration involves managing and maintaining databases to ensure their performance, security, and availability.', '03.01.2025','31.01.2025', 'Merve Öcal',5)

-------------------------------------------------------------------------------------------------------------------

insert into categories(category_name)
	values('Artificial Intelligence'),
		('Cyber Security'),
		('Block Chain'),
		('Frontend Developer'),
		('Database Administration')
-------------------------------------------------------------------------------------------------------------------
select * from enrollments
select * from education

select * from members
insert into enrollments(member_id, category_id, enroll_date)
	values(1,2, '27.05.2025')

insert into enrollments(member_id, category_id, enroll_date)
	values(2,1,'04.08.2022'),
		(3,4, '07.12.2020'),
		(4,5,'03.01.2025'),
		(5,2, '01.01.2004'),
		(6,1,'02.06.2022')
-------------------------------------------------------------------------------------------------------------------
select * from education

select * from certificates

insert into certificates(certificate_code, issue_date)
	values('A34582KL', '15.04.2022'),
		('002TM69B', '20.06.2024'),
		('714PD36A','18.09.2021'),
		('ZE48853Y2','15.03.2021'),
		('OPC14745','05.02.2025')

-------------------------------------------------------------------------------------------------------------------
select * from pg_catalog.pg_tables

SELECT * from certificateassignments

select * from members

select * from education

select * from enrollments

select * from categories

select * from certificates

select * from certificateassignments

insert into certificateassignments(member_id, certificate_id, assignment_date)
	values(1,2,'20.06.2024'),
		(2,1,'15.04.2022'),
		(3,4,'15.03.2021'),
		(4,5,'05.02.2025'),
		(5,2,'20.06.2024'),
		(6,1,'15.04.2022')
------------------------------------------------------------------------------------

select * from members

select * from enrollments

select * from categories

select * from education

select * from BlogPosts

select * from certificateassignments

insert into BlogPosts(title, content_, published_date, author_id)
	VALUES('Cybersecurity in the Age of IoT: Challenges and Solutions', 
'As the Internet of Things (IoT) devices become more integrated into daily life, securing these interconnected devices against vulnerabilities, unauthorized access, and potential attacks has become a major challenge in cybersecurity. It''s an ongoing battle.',
'2022-04-20', 1);

insert into BlogPosts(title, content_, published_date, author_id)
	values('Ethical Implications of Artificial Intelligence in Society', 'The ethical implications of artificial intelligence in society involve the challenges of ensuring fairness, transparency, accountability, and privacy while preventing bias, discrimination, and the potential misuse of AI technologies','20.04.2022',2)

insert into BlogPosts(title, content_, published_date, author_id)
	values('The Future of Frontend Development: Trends and Technologies', 'Frontend development is rapidly evolving with modern JavaScript frameworks, responsive design, and cutting-edge user experience (UX) practices to build faster, more interactive, and mobile-friendly websites.', '10.02.2025',3)

insert into BlogPosts(title, content_, published_date, author_id)
	values('Best Practices in Database Administration for Scalability and Performance', 'Database administration involves optimizing data storage, ensuring security, managing backups, and improving performance to handle large-scale operations efficiently while ensuring system reliability and uptime.', '10.02.2025',4)


insert into BlogPosts(title, content_, published_date, author_id)
	values('Securing the Future: Cybersecurity in the Digital Age', 'Cybersecurity protects critical systems and data from cyber threats, ensuring privacy and integrity in an increasingly connected world','25.06.2024', 5)
	
insert into BlogPosts(title, content_, published_date, author_id)
	values('AI in Healthcare: Revolutionizing Diagnosis and Treatment', 'AI is transforming healthcare by enabling faster, more accurate diagnoses, personalized treatment plans, and predictive analytics to improve patient outcomes and streamline medical processes.', '20.04.2022',6)

