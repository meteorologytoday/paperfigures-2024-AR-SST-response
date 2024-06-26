#!/bin/bash

# This is the program to generate the scatter plot of dT/dt

source 00_setup.sh

nproc=2

box_params=(
    "ALL_NPAC"  10 60 100 240
)

 
#    "OPEN_NPAC"  30 40 200 210
#    "ALL_EXTRATROPICAL_NPAC"  30 60 100 240
   
#"OPEN_NPAC"  0 90 100 260

nparams=5
for (( i=0 ; i < $(( ${#box_params[@]} / $nparams )) ; i++ )); do

    box_name="${box_params[$(( i * $nparams + 0 ))]}"
    lat_s="${box_params[$(( i * $nparams + 1 ))]}"
    lat_n="${box_params[$(( i * $nparams + 2 ))]}"
    lon_w="${box_params[$(( i * $nparams + 3 ))]}"
    lon_e="${box_params[$(( i * $nparams + 4 ))]}"


    for suffix in "" ; do

        input_dir=${diagdata_dir}${suffix}/climanom_${yrng_str}
        
        
        eval "python3 $src_dir/plot_dTdt_scatter_by_ARday_frc_nonfrc.py \\
            --input-dir $input_dir \\
            --lat-rng $lat_s $lat_n \\
            --lon-rng $lon_w $lon_e \\
            --output $fig_dir/dTdt_scatter_${box_name}_a.svg \\
            --AR-algo $AR_algo \\
            --title \"(a)\" \\
            --varnames MLG_frc dMLTdt \\
            --no-display \\
            " &

        eval "python3 $src_dir/plot_dTdt_scatter_by_ARday_frc_nonfrc.py \\
            --input-dir $input_dir \\
            --lat-rng $lat_s $lat_n \\
            --lon-rng $lon_w $lon_e \\
            --output $fig_dir/dTdt_scatter_${box_name}_b.svg \\
            --AR-algo $AR_algo \\
            --title \"(b)\" \\
            --varnames MLG_frc MLG_nonfrc \\
            --no-display \\
            " &

        if [ ] ; then
        eval "python3 $src_dir/plot_dTdt_scatter_by_ARday_frc_nonfrc.py \\
            --input-dir $input_dir \\
            --lat-rng $lat_s $lat_n \\
            --lon-rng $lon_w $lon_e \\
            --output $fig_dir/dTdt_scatter_${box_name}_c.svg \\
            --AR-algo $AR_algo \\
            --title \"(c)\" \\
            --varnames MLG_frc dMLDdt \\
            --no-display \\
            " &


        eval "python3 $src_dir/plot_dTdt_scatter_by_ARday_frc_nonfrc.py \\
            --input-dir $input_dir \\
            --lat-rng $lat_s $lat_n \\
            --lon-rng $lon_w $lon_e \\
            --output $fig_dir/dTdt_scatter_${box_name}_d.svg \\
            --AR-algo $AR_algo \\
            --title \"(d)\" \\
            --varnames MLG_frc MLG_vdiff \\
            --no-display \\
            " &


        eval "python3 $src_dir/plot_dTdt_scatter_by_ARday_frc_nonfrc.py \\
            --input-dir $input_dir \\
            --lat-rng $lat_s $lat_n \\
            --lon-rng $lon_w $lon_e \\
            --output $fig_dir/dTdt_scatter_${box_name}_e.svg \\
            --AR-algo $AR_algo \\
            --title \"(e)\" \\
            --varnames MLG_frc MLG_frc_sw \\
            --no-display \\
            " &

        eval "python3 $src_dir/plot_dTdt_scatter_by_ARday_frc_nonfrc.py \\
            --input-dir $input_dir \\
            --lat-rng $lat_s $lat_n \\
            --lon-rng $lon_w $lon_e \\
            --output $fig_dir/dTdt_scatter_${box_name}_f.svg \\
            --AR-algo $AR_algo \\
            --title \"(f)\" \\
            --varnames MLG_frc MLG_ent \\
            --no-display \\
            " &



        fi





        wait

    done


done
