select * from Invoice i join InvoiceLine il on il.invoiceId = i.invoiceId where il.UnitPrice > 0.99;
select i.InvoiceDate, c.FirstName, c.LastName, i.Total from Invoice i join Customer c on i.CustomerId = c.CustomerId;
select c.FirstName, c.LastName, e.FirstName, e.LastName from Customer c join Employee e on c.SupportRepId = e.EmployeeId;
select al.title, ar.name from Album al join Artist ar on al.ArtistId = ar.ArtistID;
select pt.trackid from PlaylistTrack pt join Playlist pl on pl.playlistid = pt.playlistid where pl.name = "Music";
select t.name from Track t join PlaylistTrack pt on t.trackid = pt.trackid where pt.playlistId = 5;
select t.name, p.name from Track t join playlisttrack pt on pt.trackid = t.trackid join playlist p on p.playlistid = pt.playlistid;
select t.name, a.title from Track t join Album a on t.albumid = a.albumid join genre g on t.genreid = g.genreid where g.name = "Alternative";

select * from Invoice where InvoiceID In (select invoiceid from invoiceline where unitprice > 0.99);
select * from PlaylistTrack where playlistId in (select playlistid from playlist where name = "Music");
select name from Track where trackid in (select trackid from playlisttrack where playlistid = 5);
select * from Track where genreid in (select genreid from genre where name = "Comedy");
select * from Track where albumid in (select albumid from album where title = "Fireball");
select * from Track where albumid in (select albumid from album where artistid in (select artistid from artist where name = 'Queen'));

update Customer set fax = null where fax is not null;
update customer set company = "Self" where company is null;
update customer set lastname = "Thompson" where firstname = "Julia" and lastname = "Barnett";
update customer set supportrepid = 4 where email = "luisrojas@yahoo.cl";
update track set composer = "The darkness around us" where genreid (select genreid from genre where name = "Metal") and composer is null;

select count(*), genre.name from track t join genre on genre.genreid = track.genreid; group by genre.name;
select count(*), g.name from track t join genre g on t.trackid = g.trackid where g.name = "Pop" or g.name = "Rock"; group by g.name;
select count(*), a.name from artist a join album al on al.artistid = a.artistid; group by al.artistid;

select distinct composer from track;
select distinct billingpostalcode from invoice;
select distinct company from customer;

delete from practice_delete where type = "bronze";
delete from practice_delete where type = "silver";
delete from practice_delete where value = 150;

CREATE TABLE if not exists users (userid serial primary key, name text, email text);
create table if not exists products (productid serial primary key, name text, price integer);
create table if not exists orders (orderid serial primary key, product_id integer references products(productid));

insert into users (name, email) values ('John', 'John@gmail.com'), ('Josh', 'Josh@gmail.com'), ('Eric', 'Erick@gmail.com');
insert into products (name, price) values ('Vacuum', 10), ('Broom', 5), ('Toaster', 12);
insert into orders (product_id) values (1), (2), (3);

select product_id from orders;
select * from orders;
select sum(p.price) from products p join orders o on p.productid = o.product_id;

alter table users add column order_id  int REFERENCES orders(orderid);

update users set order_id = 1 where userid = 1;
update users set order_id = 2 where userid = 2;
update users set order_id = 3 where userid = 3;

select * from orders;
select count(*) from users group by users.name;