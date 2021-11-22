-- | Tries to buy the reserved seat.
create or replace function BuyReserved
    ( in UserId   integer
    , in Pass     varchar(50)
    , in FlightId integer
    , in SeatNo   varchar(4)
    ) returns boolean as
$$
declare
    CurrentTime timestamp;
begin
    CurrentTime = now();
    if not HasUser(BuyReserved.UserId, BuyReserved.Pass) then
        return false;
    end if;
    if not HasFakePassenger(BuyReserved.FlightId, BuyReserved.SeatNo, BuyReserved.UserId, CurrentTime) then
        return false;
    end if;

    update Passengers
    set Fake = false
    where Passengers.FlightId = BuyReserved.FlightId
      and Passengers.SeatNo = BuyReserved.SeatNo
      and Passengers.UserId = BuyReserved.UserId;
    return true;
end;
$$ language plpgsql;

select BuyReserved(4, 'denis', 1, 'A2');
