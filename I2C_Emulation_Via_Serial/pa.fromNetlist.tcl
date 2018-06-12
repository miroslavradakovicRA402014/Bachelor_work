
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name I2C_Emulation_Via_Serial -dir "D:/BSc_workspace/Bachelor_work/I2C_Emulation_Via_Serial/planAhead_run_2" -part xc6slx45fgg676-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/BSc_workspace/Bachelor_work/I2C_Emulation_Via_Serial/i2c_via_uart.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/BSc_workspace/Bachelor_work/I2C_Emulation_Via_Serial} }
set_property target_constrs_file "system_pins.ucf" [current_fileset -constrset]
add_files [list {system_pins.ucf}] -fileset [get_property constrset [current_run]]
link_design
