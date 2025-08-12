-- Q1. Retrieve all successful bookings:
create view Successfully_bookings as 
select * from bookings 
where booking_status = 'Success';

-- view created to retrieve all successful bookings, now to to type the long quries again.
select * from Successfully_bookings; 


-- Q2. Find the average ride distance for each vehicle type:
create view average_ride_distance_for_each_vehicle as 
select vehicle_type, round(avg(ride_distance), 2) as avg_distance from bookings
group by vehicle_type;

select * from average_ride_distance_for_each_vehicle;


-- Q3. Get the total number of cancelled rides by customers:
create view canceled_ride_by_customer as	
select count(*) as canceled_ride_by_customer from bookings
where booking_status = 'Canceled by Customer';

select * from canceled_ride_by_customer;


-- Q4. List the top 5 customers who booked the highest number of rides:
create view top_five_customers as 
select customer_id, count(booking_id) as total_rides from bookings
group by customer_id
order by total_rides DESC
limit 5;

select * from top_five_customers;


-- Q5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view canceled_rides_by_driver as 
select count(canceled_rides_by_driver) as canceled_rides_by_drivers from bookings
where canceled_rides_by_driver = 'Personal & Car related issue';


select * from canceled_rides_by_driver;


-- Q6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view maximum_and_minimum_driver_ratings_for_prime_sedan as 
select min(driver_ratings), max(driver_ratings) from bookings
where vehicle_type = 'Prime Sedan';

select * from maximum_and_minimum_driver_ratings_for_prime_sedan;


-- Q7. Retrieve all rides where payment was made using UPI:
create view rides_with_upi as 
select * from bookings 
where payment_method = 'UPI';

select * from rides_with_upi;



-- Q8. Find the average customer rating per vehicle type:
create view avg_customer_rating_by_vehicle as
select vehicle_type, round(avg(customer_rating), 2) as avg_customer_rating from bookings
group by vehicle_type;

select * from avg_customer_rating_by_vehicle


-- Q9. Calculate the total booking value of rides completed successfully:

create view totol_booking_value_of_success_rides as
select sum(booking_value) as booking_value_sum from bookings
where booking_status = 'Success';

select * from totol_booking_value_of_success_rides;



-- Q10. List all incomplete rides along with the reason:

create view incomplete_rides_with_resons as
select booking_id, incomplete_rides_reason from bookings 
where incomplete_rides = 'Yes';

select * from incomplete_rides_with_resons;