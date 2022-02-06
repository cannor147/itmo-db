-- | Calculated statistics for user about all flights.
create or replace function FlightsStatistics
    ( in UserId integer
    , in Pass   varchar(50)
    ) returns table
    ( FlightId      integer -- Identifier of flight.
    , CanReserve    boolean -- If the user can reserve at least one seat.
    , CanBuy        boolean -- If the user can buy at least one seat.
    , FreeSeats     bigint  -- Count all free seats of flight.
    , ReservedSeats bigint  -- Count all reserved seats of flight.
    , BoughtSeats   bigint  -- Count all bought seats of flight.
    ) as
$$
declare
    CurrentTime timestamp;
    HasUser     boolean;
begin
    CurrentTime = now();
    HasUser = HasUser(FlightsStatistics.UserId, FlightsStatistics.Pass);
    return query
        select Flights.FlightId                                                                                                         as FlightId
             , HasUser and FlightTime >= CurrentTime
           and FreeSeatCount(PlainStats.Seats, PassengerStats.ReservedSeats, PassengerStats.BoughtSeats) > 0                            as CanReserve
             , HasUser and FlightTime >= CurrentTime
           and (UserReservedSeats > 0 or FreeSeatCount(PlainStats.Seats, PassengerStats.ReservedSeats, PassengerStats.BoughtSeats) > 0) as CanBuy
             , case when FlightTime < CurrentTime then 0
          else FreeSeatCount(PlainStats.Seats, PassengerStats.ReservedSeats, PassengerStats.BoughtSeats) end                            as FreeSeats
             , coalesce(PassengerStats.ReservedSeats, 0)                                                                                as ReservedSeats
             , coalesce(PassengerStats.BoughtSeats, 0)                                                                                  as BoughtSeats
        from Flights
                 natural left join (select Seats.PlaneId
                                         , count(SeatNo) as Seats
                                    from Seats
                                    group by Seats.PlaneId) as PlainStats
                 natural left join (select Passengers.FlightId
                                         , count(case when Fake then SeatNo end)                                                  as ReservedSeats
                                         , count(case when not Fake then SeatNo end)                                              as BoughtSeats
                                         , count(case when Fake and Passengers.UserId = FlightsStatistics.UserId then SeatNo end) as UserReservedSeats
                                    from Passengers
                                    group by Passengers.FlightId) as PassengerStats;
end;
$$ language plpgsql;

select *
from FlightsStatistics(3, 'kgeorgiy');
