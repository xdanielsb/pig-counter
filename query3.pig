books = load 'webdam-books.txt' USING PigStorage(',') as (year: int, title: chararray, author: chararray) ;
vianu = filter books by author == 'Vianu';
-- (1995,Foundations of Databases,Vianu)
publishers = load 'web-dampublisher.txt' USING PigStorage(',') as ( title : chararray, publisher: chararray) ;
joined = join vianu by title, publishers by title ;
-- (1995,Fundations of Databases,Vianu,Fundations of Databases,Vuibert France)
-- (1995,Fundations of Databases,Vianu,Fundations of Databases,Addison-Wesley USA)
grouped = group joined by vianu::author;
-- (Vianu,{(1995,Fundations of Databases,Vianu,Fundations of Databases,Addison-Wesley USA),(1995,Fundations of Databases,Vianu,Fundation
s of Databases,Vuibert France)})
