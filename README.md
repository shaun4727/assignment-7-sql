# assignment-7-sql

## 1. What is PostgreSQL?

এটি একটি রিলেশনাল ডাটাবেজ। যেটাতে একটি টেবিল অন্্য এক বা একাধিক টেবিলের সাথে সম্পর্ক তৈরি করতে পারে। এটাতে জেসন কুয়েরিও সাপোর্ট করে। 


## 2. What is the purpose of a database schema in PostgreSQL?
স্কিমা হচ্ছে একটি নেমস্পেস যেটি ডাটাবেজ অবজেক্ট গুলোকে অর্গানাইজ করতে সাহায্্য  করে। একটি রিলেটেড গ্রুপের অবজেক্টের মধ্যে এটি কনটেইনার হিসেবে কাজ করে। 

উদ্দেশ্য :

১। যদি আমরা স্কিমা ইউজ করি, তাহলে ২ টি ভিন্ন স্কিমাতে একি নামের টেবিল তৈরি করলে কোন কনফ্লিক্ট করবে না।

২। আমরা স্কিমা হিসেবে রোল এসাইন করতে পারি।

৩। ডেভেলপমেন্ট, প্রোডাকশন, টেস্টিং এর জন্য আলাদা স্কিমা তৈরি করে টেস্টিং করতে পারি।

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

টেবিলে এক বা একাধিক কলামের সমন্বয়ে যদি ইউনিক কিছু তৈরি করা যায় যেটা দিয়ে কোন রেকর্ড আলাদা ভাবে শনাক্ত করা যায়, তবে তাকে প্রাইমারি কি বলে। একটি টেবিলে প্রাইমারি কি একটাই থাকে।

যদি এক টেবিলের প্রাইমারি কি আরেক টেবিলে সম্পর্ক তৈরি করার জন্য ব্যবহার করা হয়, তবে তাকে ফরেন কি বলে।

একটি টেবিলে প্রাইমারি কি একটাই থাকে কিন্তু ফরেন কি একাধিক থাকতে পারে ।

## 4. What is the difference between the VARCHAR and CHAR data types?

ডেটার বিভিন্ন ধরনের হয় । char তাদের মধ্যে একটা । char একটি ভেরিয়েবল যা ফিক্সড লেংথের ক্যারেকটার রাখতে পারে । এটা যে ডেটা রাখে সেটা মূলত সিঙ্গেল বাইট বা মাল্টি বাইটের স্ট্রিং , লেটার , নাম্বার হতে পারে । এটা স্ট্যাটিক মেমোরি লোকেশান ব্যবহার করে । 

অন্যদিকে varchar ও একটি ডেটা টাইপ যেটা বিভিন্ন লেংথের ক্যারেক্টার রাখতে পারে। এই টাইপের ভ্যারিয়েবল সর্বোচ্চ ২৫৫ বাইট ডেটা রাখতে পারে। এই ডেটা লেটার, নাম্বার , সিম্বল যে কোন কিছুই হতে পারে। 

## 5. Explain the purpose of the WHERE clause in a SELECT statement.

সিলেক্ট স্টেটমেন্টের মাধ্যমে আমরা একটি টেবিলের বিভিন্ন কলামের ডেটা দেখাতে পারি। যদি এই ডেটা গুলোর মধ্যে কোন কন্ডিশনের উপর বেজ করে ডেটা আনতে হয় , তবে where clause ব্যবহার করতে হয় । 

```sql

select name,title,price,stock from books where stock>0;
```

## 6. What are the LIMIT and OFFSET clauses used for?

limit clause এর মাধ্যমে আমরা কতগুলো ডেটা দেখাতে হবে সেটা নির্ধারণ করতে পারি। 

```sql
select * from books limit 5;
```

আর offset clause এর মাধ্যমে আমারা প্রথমদিক থেকে যতগুলো প্রয়োজন row বাদ দিতে পারি।  

```sql
select * from books limit 5 offset 3;
```

## 7. How can you modify data using UPDATE statements?

আমরা update statement ব্যবহার করে একটি টেবিলের যে কোন কলামের ডেটা পরিবর্তন করতে পারি । এই জন্য where clause ব্যবহার করতে পারি, যাতে কন্ডিশনের উপর বেজ করে কলামের ভ্যালু পরিবর্তন করা যায়।  

```sql

update books set price = price*1.1 where published_year < 2000; 
```

## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

postgresql একটি রিলেশনাল ডাটাবেজ ।  একটি টেবিল থেকে আরেকটি টেবিলের মধ্যে রিলেশন তৈরি হয় ফরেন কি ব্যবহার করে । এই রিলেশন কাজে লাগাতে ২ টি বা আরও বেশি  টেবিলে একসাথে করা লাগে।  যদি join clause ব্যবহার না করি তাহলে টেবিলগুলো একসাথে করা যাবে না এবং postgresql কে রিলেশনাল ডাটাবেজ বলার কোন অর্থ থাকবে না। 

জয়েন বিভিন্ন ধরনের হয়। left join, right join, inner join ইত্যাদি । যে টেবিল গুলো আমরা join করতে চাই ঐগুলোর প্রাইমারি key এবং ফরেন key ব্যবহার করে join করতে হবে । 

যেমনঃ 

```sql
-- inner join
select p.id from post p inner join "user" u on p.user_id == u.id;

-- right join
select c.id from orders o right join customers c 
on c.id = o.customer_id where o.quantity is null

-- left join
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
```

## 9. Explain the GROUP BY clause and its role in aggregation operations.

group by clause এর মাধ্যমে সবগুলো row কে আমরা কলাম ভ্যালুর ভিত্তিতে গ্রুপ করতে পারি। এর প্রধান উদ্দেশ্য হচ্ছে ডাটা aggregation এ সাহায্য করা। ডাটা aggregation এর বিভিন্ন funciton গুলো হলো COUNT , SUM , AVG , MIN , MAX ইত্যাদি ।  

## 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

COUNT , SUM , AVG এর মতো aggregation function গুলো চালানো যাবে যেকোন টেবিলের উপর।  COUNT দিয়ে row সংখ্যা বের করা যায়। SUM দিয়ে কোন একটা কলামের value যোগ করা যায়। AVG দিয়ে কোন কলামের value গুলোর গড় মান নির্ণয় করা যায়। 

উদাহরণঃ 
```sql
-- use of count

select "name", count(*) total_orders from orders o left join customers c on c.id = o.customer_id group by "name";

-- use of sum

select sum(price*quantity) total_revenue  from books b right join orders o on b.id = o.book_id;


-- use of avg
select avg(price) from books;

```

