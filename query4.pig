student = LOAD 'students.csv' USING PigStorage(',') as (id:int, name:chararray);
STORE student INTO 'hdfs://daniel837:5993/output/' USING PigStorage(',');
-- hdfs dfs -ls 'hdfs://daniel837:5993/output/'
dump student; -- print the students
-- (1,daniel)
-- (2,biden)
-- (3,aymeric)
-- (4,jhon)
-- (5,aymeric)
describe student; -- describe the relation
-- student :{(id: int, name:chararray)}
explain student; -- display mapreduce logical and physical plan
group_data = GROUP student by name -- you can group all using by All instead of by name
dump group_data;
-- (daniel, {(1, daniel)})
--...
-- (aymeric, {(3, aymeric), (5, aymeric)}
--...

player = LOAD 'students.csv' USING PigStorage(',') as (id:int, name:chararray);
dump player
-- (1, julian)
-- (2, daniel)
cogroup_data = COGROUP student by id, players by id; -- COGROUP group different datasets


-- join the datasets
student_player = JOIN student BY id, player BY id ;

-- cross product
cross_data = CROSS player, student;

-- split
SPLIT student into students_1 if id < 3, students_2 if (3<id and id<=4);


-- filter
student_name = FILTER student BY (name='daniel');

-- foreach
foreach_data = FOREACH student GENERATE name;
dump foreachdata
-- (daniel)
-- (biden)
-- (aymeric)
-- ...

-- order by
sorted = ORDER player BY name ASC;

-- limit
limit_data = LIMIT sorted 2; 

