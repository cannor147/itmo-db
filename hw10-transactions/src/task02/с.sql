start transaction isolation level read committed;

create or replace function IsPassengerValid
    ( in Passenger   Passengers
    , in CurrentTime timestamp
    ) returns boolean as
$$
begin
    return not IsPassengerValid.Passenger.Fake or IsPassengerValid.Passenger.ReservationTime + 3 * interval '1 day' >= CurrentTime;
end;
$$ language plpgsql;

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

select Reserve(:UserId, :Pass, :FlightId,:SeatNo);

commit work;
