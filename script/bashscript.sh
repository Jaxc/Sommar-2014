#!/bin/bash
m=$1
t=$2
    mkdir -p design_runs/t$t/m$m 
    echo "Make dir complete"
    bash script/editfilescript.sh $m $t
    echo "Edit Bch.in complete"
    cp sources/* design_runs/t$t/m$m/  
    echo "Copy folder complete"
    cd design_runs/t$t/m$m/
    echo "Change dir complete"
    chmod +x bch_generate
    chmod +x test_vector_generate
    ./bch_generate
    ./test_vector_generate $m $t
    rm bch_generate
    rm test_vector_generate
    rm *.vht
    rm *.in
    echo "Bch.exe complete"

    ncvhdl -messages -linedebug -v93 const.vhd dec.vhd enc.vhd bchio.vhd BCH_TB.vhd sim.vhd  
    ncelab -messages -v93 WORKLIB.BCH_TB:Testbench
    ncsim -gui WORKLIB.BCH_TB:Testbench

    rm in.txt
    rm error.txt

  rc -files super-sim
#    rc -files sim-1.0GHz.s
#    rc -files sim-1.500GHz.s
#    rc -files sim-2.0GHz.s
#    rc -files sim-2.500GHz.s
#    rc -files sim-3.0GHz.s
#    rc -files sim-3.500GHz.s
    pwd
    bash ../../../script/editpower.sh 1 0
    bash ../../../script/editpower.sh 1 500
    bash ../../../script/editpower.sh 2 0
    bash ../../../script/editpower.sh 2 500
    bash ../../../script/editpower.sh 3 0
    bash ../../../script/editpower.sh 3 500
