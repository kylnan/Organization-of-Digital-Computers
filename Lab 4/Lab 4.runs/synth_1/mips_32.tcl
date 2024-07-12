# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7k70tfbv676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {E:/GINGINEERING/EECS 112L/Lab 4/Lab 4.cache/wt} [current_project]
set_property parent.project_path {E:/GINGINEERING/EECS 112L/Lab 4/Lab 4.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {e:/GINGINEERING/EECS 112L/Lab 4/Lab 4.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/ALU.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/ALUControl.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/EX_Forwarding_unit.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/EX_pipe_stage.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/Hazard_detection.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/ID_pipe_stage.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/IF_pipe_stage.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/control.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/data_memory.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/instruction_mem.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/mux.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/mux4.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/pipe_reg.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/pipe_reg_en.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/register_file.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/sign_extend.v}
  {E:/GINGINEERING/EECS 112L/Lab 4/Lab4_files/Lab4_file_uploaded 3/mips_32.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{E:/GINGINEERING/EECS 112L/Lab 4/Lab 4.srcs/constrs_1/new/constraints.xdc}}
set_property used_in_implementation false [get_files {{E:/GINGINEERING/EECS 112L/Lab 4/Lab 4.srcs/constrs_1/new/constraints.xdc}}]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top mips_32 -part xc7k70tfbv676-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef mips_32.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file mips_32_utilization_synth.rpt -pb mips_32_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
