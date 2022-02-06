-- | Returns list of seat numbers that are free to buy or reserve.
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

-- | Example of usage.
select FreeSeats(1);
