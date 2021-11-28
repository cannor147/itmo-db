-- | Tries to reserve seat if it's free for reservation.
create or replace function Reserve
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
    if not HasUser(Reserve.UserId, Reserve.Pass) then
        return false;
    end if;
    if not HasAvailableSeat(Reserve.FlightId, Reserve.SeatNo, CurrentTime) then
        return false;
    end if;
    if exists(select Passengers.SeatNo
              from Passengers
              where Passengers.FlightId = Reserve.FlightId
                and Passengers.SeatNo = Reserve.SeatNo
                and IsPassengerValid(Passengers, CurrentTime)) then
        return false;
    end if;

    insert into Passengers (UserId, FlightId, SeatNo, ReservationTime, Fake)
    values (Reserve.UserId, Reserve.FlightId, Reserve.SeatNo, CurrentTime, true);
    return true;
end;
$$ language plpgsql;

select Reserve(4, 'denis', 1,'A2');
