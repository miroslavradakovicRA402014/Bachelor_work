
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name LCD_controller -dir "/home/rtrk/Workspace/BSc_workspace/Bachelor_work/LCD_controller/planAhead_run_2" -part xc6slx45fgg676-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/rtrk/Workspace/BSc_workspace/Bachelor_work/LCD_controller/lcd_driver.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/rtrk/Workspace/BSc_workspace/Bachelor_work/LCD_controller} }
set_property target_constrs_file "lcd_pins.ucf" [current_fileset -constrset]
add_files [list {lcd_pins.ucf}] -fileset [get_property constrset [current_run]]
link_design
