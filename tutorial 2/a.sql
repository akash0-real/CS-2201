create database class;
use class;

create table student_marks(
	student_name varchar(50),
    age int,
    subject_name varchar(50),
    cie1 int,
    cie2 int,
    cie3 int
);

insert into student_marks values
("akash", 19, "DBMS", 15, 25, 25),
("justin", 19, "DBMS", 5, 5, 25),
("abinad", 19, "DBMS", 12, 15, 25),
("neel", 19, "DBMS", 15, 10, 22),
("kosal", 19, "DBMS", 12, 2, 20),
("suzain", 19, "DBMS", 5, 5, 5),
("bhat", 19, "DBMS", 2, 13, 17),
("john", 19, "DBMS", 15, 25, 0),
("sarah", 19, "DBMS", 4, 25, 12),
("rosal", 19, "DBMS", 1, 25, 5);

select * from student_marks;

alter table student_marks
	add total_marks int,
    add avg_marks int,
    add percentage int;
    
alter table student_marks
		add result varchar(20);
        
update student_marks
set total_marks = cie1 + cie2 + cie3;

update student_marks
set avg_marks = total_marks / 3;

update student_marks
set percentage = (total_marks / 70.0) * 100;

update student_marks
set result = 'pass' where total_marks >= 28;

update student_marks
set result = 'fail' where total_marks < 28;

select * from student_marks;

/*
# student_name, age, subject_name, cie1, cie2, cie3, total_marks, avg_marks, percentage, result
'akash', '19', 'DBMS', '15', '25', '25', '65', '22', '93', 'pass'
'justin', '19', 'DBMS', '5', '5', '25', '35', '12', '50', 'pass'
'abinad', '19', 'DBMS', '12', '15', '25', '52', '17', '74', 'pass'
'neel', '19', 'DBMS', '15', '10', '22', '47', '16', '67', 'pass'
'kosal', '19', 'DBMS', '12', '2', '20', '34', '11', '49', 'pass'
'suzain', '19', 'DBMS', '5', '5', '5', '15', '5', '21', 'fail'
'bhat', '19', 'DBMS', '2', '13', '17', '32', '11', '46', 'pass'
'john', '19', 'DBMS', '15', '25', '0', '40', '13', '57', 'pass'
'sarah', '19', 'DBMS', '4', '25', '12', '41', '14', '59', 'pass'
'rosal', '19', 'DBMS', '1', '25', '5', '31', '10', '44', 'pass'

*/
