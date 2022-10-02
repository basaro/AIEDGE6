#start_gui
open_project ./vitis/riscv_ex/riscv_ex.xpr
update_compile_order -fileset sources_1
import_files -norecurse {./VexRiscv/riscv_example.sv ./VexRiscv/VexRiscv.v}
update_compile_order -fileset sources_1
source -notrace ./vitis/riscv_ex/imports/package_kernel.tcl
# Packaging project
package_project ./vitis/riscv_ex/riscv fpga.co.jp kernel riscv
package_xo  -xo_path ./vitis/riscv_ex/exports/riscv.xo -kernel_name riscv -ip_directory ./vitis/riscv_ex/riscv -kernel_xml ./vitis/riscv_ex/imports/kernel.xml
# Complete: RTL Kernel Packaging of Sources
# --------------------------------------------
close_project
exit
