
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name UART_communication -dir "/home/rtrk/Workspace/BSc_workspace/Bachelor_work/UART_communication/planAhead_run_1" -part xc6slx45fgg676-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/rtrk/Workspace/BSc_workspace/Bachelor_work/UART_communication/uart_verification_return.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/rtrk/Workspace/BSc_workspace/Bachelor_work/UART_communication} }
set_property target_constrs_file "uart_pins.ucf" [current_fileset -constrset]
add_files [list {uart_pins.ucf}] -fileset [get_property constrset [current_run]]
link_design
