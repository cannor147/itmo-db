start transaction isolation level read uncommitted;

create or replace function IsPassengerValid
    ( in Passenger   Passengers
    , in CurrentTime timestamp
    ) returns boolean as
$$
begin
    return not IsPassengerValid.Passenger.Fake or IsPassengerValid.Passenger.ReservationTime + 3 * interval '1 day' >= CurrentTime;
end;
$$ language plpgsql;

create or replace function ValidFlightPassengers
    ( in FlightId integer
    , in CurrentTime     timestamp
    ) returns setof Passengers as
$$
begin
    return query select Passengers.UserId
                      , Passengers.FlightId
                      , Passengers.SeatNo
                      , Passengers.ReservationTime
                      , Passengers.Fake
                 from Passengers
                 where Passengers.FlightId = ValidFlightPassengers.FlightId
                   and IsPassengerValid(Passengers, CurrentTime);
end;
$$ language plpgsql;

create or replace function FreeSeats
    ( in FlightId integer
    ) returns setof varchar(4) as
    $$
declare
    CurrentTime timestamp;
begin
    CurrentTime = now()::timestamp;
    return query
        select Seats.SeatNo
        from Seats
                 natural join Flights
        where Flights.FlightId = FreeSeats.FlightId
          and Flights.FlightTime > CurrentTime
        except
        select ValidFlightPassengers.SeatNo
        from ValidFlightPassengers(FreeSeats.FlightId, CurrentTime) as ValidFlightPassengers;
end;
$$ language plpgsql;

select FreeSeats(:FlightId);

commit work;
