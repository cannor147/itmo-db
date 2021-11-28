-- | Returns true if passenger bought or reserved the seat, otherwise false.
create or replace function IsPassengerValid
    ( in _Passenger Passengers
    , in _Time      timestamp
    ) returns boolean as
$$
begin
    return not _Passenger.Fake or _Passenger.ReservationTime + 3 * interval '1 day' >= _Time;
end;
$$ language plpgsql;

-- | Returns list of valid passengers of flight.
create or replace function ValidFlightPassengers
    ( in _FlightId integer
    , in _Time     timestamp
    ) returns setof Passengers as
$$
begin
    return query select Passengers.UserId
                      , Passengers.FlightId
                      , Passengers.SeatNo
                      , Passengers.ReservationTime
                      , Passengers.Fake
                 from Passengers
                 where Passengers.FlightId = _FlightId
                   and IsPassengerValid(Passengers, _Time);
end;
$$ language plpgsql;

-- | Returns true if there is a reservation for user and seat on flight, otherwise false.
create or replace function HasFakePassenger
    ( in _FlightId integer
    , in _SeatNo   varchar(4)
    , in _UserId   integer
    , in _Time     timestamp
    ) returns boolean as
$$
begin
    return exists(select Passengers.SeatNo
                  from Passengers
                  where Passengers.FlightId = _FlightId
                    and Passengers.SeatNo = _SeatNo
                    and Passengers.UserId = _UserId
                    and Passengers.Fake
                    and IsPassengerValid(Passengers, _Time));
end;
$$ language plpgsql;

create extension pgcrypto;

-- | Validates user id and password.
create or replace function HasUser
    ( in UserId integer
    , in Pass   varchar(50)
    ) returns boolean as
$$
begin
    return exists(select Users.UserId
                  from Users
                  where Users.UserId = HasUser.UserId
                    and Users.Pass = crypt(HasUser.Pass, Users.Pass));
end;
$$ language plpgsql;

-- | Checks if there is available seat for future flight.
create or replace function HasAvailableSeat
    ( in FlightId    integer
    , in SeatNo      varchar(4)
    , in CurrentTime timestamp
    ) returns boolean as
$$
begin
    return exists(select Seats.SeatNo
                  from Seats
                           natural join Flights
                  where Flights.FlightId = HasAvailableSeat.FlightId
                    and Seats.SeatNo = HasAvailableSeat.SeatNo
                    and Flights.FlightTime > HasAvailableSeat.CurrentTime);
end;
$$ language plpgsql;

-- | Calculates number of free seats.
create or replace function FreeSeatCount
    ( in Seats    bigint
    , in Reserved bigint
    , in Bought   bigint
    ) returns bigint as
$$
begin
    return greatest(coalesce(FreeSeatCount.Seats, 0) - coalesce(FreeSeatCount.Reserved + FreeSeatCount.Bought, 0), 0);
end;
$$ language plpgsql;
