﻿CREATE TABLE nyc_taxi_data (
    VendorID INT NOT NULL,
    lpep_pickup_datetime TIMESTAMP,
    lpep_dropoff_datetime TIMESTAMP,
    store_and_fwd_flag Varchar NOT NULL,
    RatecodeID INT NOT NULL,
    PULocationID INT NOT NULL,
    DOLocationID INT NOT NULL,
    passenger_count INT NOT NULL,
    trip_distance Float NOT NULL,
    fare_amount Float NOT NULL,
    extra Float NOT NULL,
    mta_tax Float NOT NULL,
    tip_amount Float NOT NULL,
    tolls_amount Float NOT NULL,
    improvement_surcharge Float NOT NULL,
    total_amount Float NOT NULL,
    payment_type INT NOT NULL,
    trip_type INT NOT NULL,
    congestion_surcharge Float NOT NULL
)