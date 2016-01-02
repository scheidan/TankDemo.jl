using TankDemo
using Base.Test


tank = Tank(0.0, 0.0, [Tank(100, 0.1, nothing), Tank(50, 0.2, nothing)])
fill_tank!(tank)

@test tank.level == 100*0.1 + 50*0.2
@test tank.tank_up[1].level == 100 - 10
@test tank.tank_up[2].level == 50 - 10


tank = Tank(100.0, 0.05, nothing)       # tank with no upstream tanks
fill_tank!(tank)

@test tank.level == 100                 # nothing should change
