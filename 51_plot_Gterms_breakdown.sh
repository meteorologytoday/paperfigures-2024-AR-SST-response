#!/bin/bash

source 00_setup.sh

for suffix in "" ; do

    wm_str="Oct-Nov Dec-Jan Feb-Mar"
    count=1

    input_dir=${diagdata_dir}${suffix}/climanom_${yrng_str}/${AR_algo}${algo_suffix}

    eval "python3 $src_dir/plot_G_terms_map.py \\
        --input-dir $input_dir \\
        --varnames dMLTdt BLANK SFCWIND MLD \\
        --output $fig_dir/G_terms_atmocn${suffix}_${count}.svg \\
        --time $wm_str \\
        --no-display" &

    eval "python3 $src_dir/plot_G_terms_map.py \\
        --input-dir $input_dir \\
        --varnames MLG_frc MLG_frc_sw MLG_frc_lw MLG_frc_sh MLG_frc_lh MLG_frc_dilu \\
        --output $fig_dir/G_terms_atm${suffix}_${count}.svg \\
        --time $wm_str \\
        --no-display" &

    eval "python3 $src_dir/plot_G_terms_map.py \\
        --input-dir $input_dir \\
        --varnames MLG_nonfrc MLG_adv MLG_vmix MLG_ent_wen MLG_hdiff \\
        --output $fig_dir/G_terms_ocn${suffix}_${count}.svg \\
        --time $wm_str \\
        --no-display" &

    wait
    
    wm_str="Oct-Mar"

    count=$(( count + 1 ))
    echo "Plotting time: $wm_str"

    eval "python3 $src_dir/plot_G_terms_map.py \\
        --input-dir $input_dir \\
        --varnames dMLTdt MLG_nonfrc MLG_adv MLG_vmix MLG_ent_wen \\
        --output $fig_dir/G_terms_atmocn-ocn${suffix}_${count}.svg \\
        --time $wm_str \\
        --add-thumbnail-title \\
        --no-display" &
#        --mark-box strong_marine_warming \\


    eval "python3 $src_dir/plot_G_terms_map.py \\
        --input-dir $input_dir \\
        --varnames MLG_frc MLG_frc_sw MLG_frc_lw MLG_frc_sh MLG_frc_lh \\
        --output $fig_dir/G_terms_atm${suffix}_${count}.svg \\
        --time $wm_str \\
        --add-thumbnail-title \\
        --thumbnail-offset 5\\
        --no-display" &


    wait

done
