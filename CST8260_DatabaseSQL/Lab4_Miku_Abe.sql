# Student Name: Miku Abe
# Student Number: 041047851
# Course Section: 302

# USE lab4;
# DESCRIBE PF;

# 1. Write a SQL query that extracts the PFdate, destIP and sourceIP of the machines trying to access destination port 31337
SELECT PFDate, DestIP, SourceIP
FROM PF
WHERE DestPort = 31337;

# 2. Write a SQL query that extracts the PFdate, destIP and sourceIP of the machines trying to access destination port 6699
# or port 137 or port 53
SELECT PFDate, DestIP, SourceIP
FROM PF
WHERE DestPort = 6699 OR DestPort = 137 OR DestPort = 53;

# 3. Rewrite Question 2 using one SELECT statement only and the IN operator.
SELECT PFDate, DestIP, SourceIP
FROM PF
WHERE DestPort IN (6699, 137, 53);

# 4. Write a query that lists all unique/distinct SourceIP.
SELECT DISTINCT SourceIP
FROM PF;

# 5. Write a SQL query that extracts the number of times DestPort 139 was accessed.
SELECT count(*)
FROM PF
WHERE DestPort = 139;

# 6. Write a SQL query that extracts the number of TCP (protocol field) entries.
SELECT count(*)
FROM PF
WHERE Protocol = 'Tcp';

# 7. Write a SQL query that extracts the number of UDP (protocol field) entries.
SELECT count(*)
FROM PF
WHERE Protocol = 'Udp';

# 8. Write a SQL query that displays a listing of all distinct sourceIP starting with '24.'
SELECT DISTINCT SourceIP
FROM PF
WHERE SourceIP LIKE '24%';
