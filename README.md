# assignment-7-sql

## 1. What is PostgreSQL?

এটি একটি রিলেশনাল ডাটাবেজ। যেটাতে একটি টেবিল অন্্য এক বা একাধিক টেবিলের সাথে সম্পর্ক তৈরি করতে পারে। এটাতে জেসন কুয়েরিও সাপোর্ট করে। 


## 2. What is the purpose of a database schema in PostgreSQL?
স্কিমা হচ্ছে একটি নেমস্পেস যেটি ডাটাবেজ অবজেক্ট গুলোকে অর্গানাইজ করতে সাহায্্য  করে। একটি রিলেটেড গ্রুপের অবজেক্টের মধে্্য এটি কনটেইনার হিসেবে কাজ করে। 

**উদ্দেশ্্য: **
১। যদি আমরা স্কিমা ইউজ করি, তাহলে ২ টি ভিন্ন স্কিমাতে একি নামের টেবিল তৈরি করলে কোন কনফ্লিক্ট করবে না।
২। আমরা স্কিমা হিসেবে রোল এসাইন করতে পারি।
৩। ডেভেলপমেন্ট, প্রোডাকশন, টেস্টিং এর জন্্য আলাদা স্কিমা তৈরি করে টেস্টিং করতে পারি।