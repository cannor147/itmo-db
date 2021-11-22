-- | Tries to reserve seat if it's free for reservation.
create or replace function BuyFree
    ( in FlightId integer
    , in SeatNo   varchar(4)
    ) returns boolean as
$$
declare
    CurrentTime timestamp;
begin
    CurrentTime = now();
    if not HasAvailableSeat(BuyFree.FlightId, BuyFree.SeatNo, CurrentTime) then
        return false;
    end if;
    if exists(select Passengers.UserId
              from Passengers
              where Passengers.FlightId = BuyFree.FlightId
                and Passengers.SeatNo = BuyFree.SeatNo
                and IsPassengerValid(Passengers, CurrentTime)) then
        return false;
    end if;

    insert into Passengers (UserId, FlightId, SeatNo, ReservationTime, Fake)
    values (null, BuyFree.FlightId, BuyFree.SeatNo, CurrentTime, false);
    return true;
end;
$$ language plpgsql;

select BuyFree(3, 'C1');
