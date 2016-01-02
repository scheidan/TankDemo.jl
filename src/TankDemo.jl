module TankDemo

export Tank, fill_tank!


## define a "Tank" type
type Tank
    level::Float64
    rate::Float64
    tank_up::Union{Array{Tank}, Void}   # upstream tank
end


## modify the "level" of a "tank" based on the upstream tanks
function fill_tank!(tank::Tank)
    if tank.tank_up != nothing          # if upstream tank(s) exist
        for uptank in tank.tank_up
            fill_tank!(uptank)          # fill the upstream tank (recursion)
            Q = tank_Q(uptank)
            uptank.level -= Q
            tank.level += Q
        end
    end
end


## calculate how a tank is emptied
function tank_Q(tank::Tank)
    Q = min(tank.level*tank.rate, tank.level) # avoid negative levels
    return Q
end

end # module
