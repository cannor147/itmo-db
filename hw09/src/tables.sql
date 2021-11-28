-- | Table of flights.
create table Flights
    ( FlightId   integer   not null
    , FlightTime timestamp not null
    , PlaneId    integer   not null
    );

-- | Table of seats.
create table Seats
    ( PlaneId integer    not null
    , SeatNo  varchar(4) not null
    );

-- | Table of registered users in the system.
create table Users
    ( UserId   integer     not null
    , Pass     varchar(50) not null
    , UserName varchar(255)
    );

-- | Table of passengers. Fake field is necessary to differ reserved seats and bought.
-- Bought seats are marked as not fake and it's easy to select passengers with such seats.
create table Passengers
    ( UserId          integer
    , FlightId        integer    not null
    , SeatNo          varchar(4) not null
    , ReservationTime timestamp  not null
    , Fake            boolean    not null
    );
