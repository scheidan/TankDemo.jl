# TankDemo

[![Build Status](https://travis-ci.org/scheidan/TankDemo.jl.svg?branch=master)](https://travis-ci.org/scheidan/TankDemo.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/4tvxobubea2dnosh/branch/master?svg=true)](https://ci.appveyor.com/project/scheidan/tankdemo-jl/branch/master)

# Introduction

This is a toy package to demonstrate how simple a Julia package can be
generated. This package is part of the Eawag UWE talk and it *is of no
use whatsoever!*


# Installation

This package can then be installed with the Julia command `Pkg.clone()`:

```Julia
Pkg.clone("git://github.com/scheidan/TankDemo.jl.git")
```
After that, `TankDemo` behaves like a normal package. For example, it
can be updated with `Pkg.update()`.

# Usage

This is a minimal example how `TankDemo` can be used:

```Julia
using TankDemo

## 1.) define tank network

tanks_31 = [Tank(l, 1.5, nothing) for l in [10.0, 20.0]]
tanks_32 = [Tank(l, 0.2, nothing) for l in [5.0, 5.0, 5.0]]
tanks_2 = [Tank(0.0, 0.8, tanks_31), Tank(0.0, 0.8, tanks_32)]
final_tank = Tank(0.0, 0.0, tanks_2)


## 2.) simulate levels

for t in 1:100
    ## fill all tanks
    fill_tank!(final_tank)
end


println("Level of final tank at t=100: $(final_tank.level)")
println("Level of intermediate tank 1 at t=100: $(final_tank.tank_up[1].level)")
```

# Tests

The tests are automatically executed by the services _Travis CI_ (for Linux and OS X) and _Appveyor_ (for Windows) every
time a new version in pushed to GitHub. To run the tests locally type
`Pkg.test("TankDemo")`.

# How was this package created?

1. Use `Pkg.generate()` to generate the package skeleton
2. Copy the 'application' part of our last version into `src/TankDemo.jl`
3. Copy the 'test' part of our last version into `test/runtests.jl`
4. Modify this `README.md` file
5. Push it to GitHub
