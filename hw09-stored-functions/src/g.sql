-- | Calculated statistics for user about the flight.
create or replace function FlightStat
    ( in UserId   integer
    , in Pass     varchar(50)
    , in FlightId integer
    ) returns table
    ( CanReserve    boolean -- If the user can reserve at least one seat.
    , CanBuy        boolean -- If the user can buy at least one seat.
    , FreeSeats     integer -- Count all free seats of flight.
    , ReservedSeats integer -- Count all reserved seats of flight.
    , BoughtSeats   integer -- Count all bought seats of flight.
    ) as
$$
declare
    CurrentTime        timestamp;
    HasUser            boolean;
    HasAvailableFlight boolean;
    HasReservations    boolean;
    SeatCount          integer;
    ReservedSeatCount  integer;
    BoughtSeatsCount   integer;
    FreeSeatsCount     integer;
begin
    CurrentTime = now();
    HasUser = HasUser(FlightsStat.UserId, FlightsStat.Pass);
    HasAvailableFlight = exists(select Flights.FlightId
                                 from Flights
                                 where Flights.FlightId = FlightsStat.FlightId
                                   and Flights.FlightTime >= CurrentTime);
    HasReservations = exists(select Passengers.SeatNo
                              from Passengers
                              where Passengers.FlightId = FlightsStat.FlightId
                                and Passengers.UserId = FlightsStat.UserId
                                and Passengers.Fake);

    select count(Seats.SeatNo)
    into SeatCount
    from Seats
             natural join Flights
    where Flights.FlightId = FlightsStat.FlightId
      and FlightTime >= CurrentTime;

    select count(case when ValidFlightPassengers.Fake then ValidFlightPassengers.SeatNo end)
         , count(case when not ValidFlightPassengers.Fake then ValidFlightPassengers.SeatNo end)
    into ReservedSeatCount
        , BoughtSeatsCount
    from ValidFlightPassengers(FlightsStat.FlightId, CurrentTime) as ValidFlightPassengers;
    FreeSeatsCount = FreeSeatCount(SeatCount, ReservedSeatCount, BoughtSeatsCount);

    return query
        select HasUser and HasAvailableFlight and FreeSeatsCount > 0                      as CanReserve
             , HasUser and HasAvailableFlight and (FreeSeatsCount > 0 or HasReservations) as CanBuy
             , FreeSeatsCount                                                             as FreeSeats
             , ReservedSeatCount                                                          as ReservedSeats
             , BoughtSeatsCount                                                           as BoughtSeats;
end;
$$ language plpgsql;

select *
from FlightStat(3, 'kgeorgiy', 1);
