book = load 'webdam-books.txt' USING PigStorage(',') as (year: int, title: chararray, author: chararray) ;
resul = foreach book generate title, author;
