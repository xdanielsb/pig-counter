-- Load records from the webdam-books.txt file (tab separated)
books = load ’webdam-books.txt’
as (year: int, title: chararray, author: chararray) ;
group_auth = group books by title;
authors = for each group_auth generate group, COUNT(books.author);
dump authors;
