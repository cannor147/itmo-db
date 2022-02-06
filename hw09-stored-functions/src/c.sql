-- | Tries to extend reservation for seat.
create or replace function ExtendReservation
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
    if not HasUser(ExtendReservation.UserId, ExtendReservation.Pass) then
        return false;
    end if;
    if not HasFakePassenger(ExtendReservation.FlightId, ExtendReservation.SeatNo, ExtendReservation.UserId, CurrentTime) then
        return false;
    end if;

    update Passengers
    set ReservationTime = CurrentTime
    where Passengers.FlightId = ExtendReservation.FlightId
      and Passengers.SeatNo = ExtendReservation.SeatNo
      and Passengers.UserId = ExtendReservation.UserId
      and Passengers.Fake;
    return true;
end;
$$ language plpgsql;

select ExtendReservation(4, 'denis', 1, 'A2');
