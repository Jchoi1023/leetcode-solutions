# Write your MySQL query statement below
SELECT p.firstName, p.lastName, a.city, a.state FROM Person p
Left Join Address a on p.personId = a.personId;