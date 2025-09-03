CREATE TABLE bookings (
    Date TEXT,
    Time TEXT,
    Booking_ID TEXT,
    Booking_Status TEXT,
    Customer_ID TEXT,
    Vehicle_Type TEXT,
    Pickup_Location TEXT,
    Drop_Location TEXT,
    V_TAT TEXT,
    C_TAT TEXT,
    Canceled_Rides_by_Customer TEXT,
    Canceled_Rides_by_Driver TEXT,
    Incomplete_Rides TEXT,
    Incomplete_Rides_Reason TEXT,
    Booking_Value TEXT,
    Payment_Method TEXT,
    Ride_Distance TEXT,
    Driver_Ratings TEXT,
    Customer_Rating TEXT,
    Vehicle_Images TEXT
);
-- All coulmns data types are set to TEXT because while importing csv file in pgadmin4 it's showing errors.

-- For data consistency, we will alter the columns to appropriate data types.
ALTER TABLE bookings
    ALTER COLUMN Date TYPE TIMESTAMP
        USING TO_TIMESTAMP(NULLIF(Date, 'null'), 'DD-MM-YYYY HH24:MI'),
    ALTER COLUMN Time TYPE TIME
        USING NULLIF(Time, 'null')::TIME,
    ALTER COLUMN V_TAT TYPE NUMERIC
        USING NULLIF(NULLIF(V_TAT, ''), 'null')::NUMERIC,
    ALTER COLUMN C_TAT TYPE NUMERIC
        USING NULLIF(NULLIF(C_TAT, ''), 'null')::NUMERIC,
    ALTER COLUMN Booking_Value TYPE NUMERIC
        USING NULLIF(NULLIF(Booking_Value, ''), 'null')::NUMERIC,
    ALTER COLUMN Ride_Distance TYPE NUMERIC
        USING NULLIF(NULLIF(Ride_Distance, ''), 'null')::NUMERIC,
    ALTER COLUMN Driver_Ratings TYPE NUMERIC(3,1)
        USING NULLIF(NULLIF(Driver_Ratings, ''), 'null')::NUMERIC,
    ALTER COLUMN Customer_Rating TYPE NUMERIC(3,1)
        USING NULLIF(NULLIF(Customer_Rating, ''), 'null')::NUMERIC;

