-- using aggregate functions(sum,avg,min,max,count)

use library_database_management_system;

-- using count 

select count(*) from book;
select * from book;

select count(*) from loan where return_date is null;
select * from loan; 

-- using sum

select sum(copies) from book;
select * from book;

-- using average

select avg(copies) from book;
select * from book;

-- using min,max

select min(copies),max(copies) from book;
select * from book;

-- all in one query

select count(book_id),min(book_id),max(book_id),avg(book_id) from book;


-- using group by and using aliasing

select author_id,count(*) from book group by author_id;


select author_id,count(*) as total_books from book group by author_id;


select count(book_id) as total_count,min(book_id) as min_book_id,max(book_id) as max_book_id,avg(book_id) as avg_book_id;


select load_id,count(*) as total_loans from loan group by load_id;

-- using having ->filter groups after aggregation

select author_id,count(*) as total_books
from book group by author_id
having count(*) > 1;

-- practise
-- 1. Count total number of books in the library

select count(*) as total_number_of_books from book;
select * from book;

-- 2. Count how many authors are registered 

select count(*) as count_of_registered_authors from author;

-- 3. Find the total number of copies available (all books combined)

select sum(copies) as  total_number_of_copies_available from book; 

-- Find the average publication year of all books

select avg(year) as average_publication_year from book;

-- 5. Find the earliest and latest published books-- 

select title as earliest_published_book from book
order by year asc
limit 1;
select title as latest_published_book from book
order by year desc
limit 1;
select * from book;

-- 6. Count how many books each author has written

select author_id,count(*) as count_of_books from book
group by author_id 
; 

-- 7. Count how many loans each member has made

select member_id ,count(load_id) as totalloans 
from loan
group by member_id;

-- 8. Find authors who have written more than 1 book

select author_id ,count(*) as book_count
from book
group by author_id
having count(*) > 1;
select * from author;


-- 9. Find members who have borrowed at least 2 books

select member_id ,count(*) as count
from loan
group by member_id
having count(load_id) >=2 ;

-- 10. Find the average number of copies per author (total copies of their books ÷ books count)

select avg(copies) as avg_copies_per_book,author_id
from book
group by author_id ;




