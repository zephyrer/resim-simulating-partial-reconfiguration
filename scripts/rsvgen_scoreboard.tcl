set str "[rsv_print_license]
`ifndef [string toupper ${scb_}]_SVH
`define [string toupper ${scb_}]_SVH

class ${scb_}#(int NUM_RR = 1) extends rsv_scoreboard#(NUM_RR);

	// configuration table and parameters
	`ovm_component_param_utils_begin(${scb_}#(NUM_RR))
	`ovm_component_utils_end

	// coverage group for partial reconfiguration
[rsv_print_fpga $vf_ rr \n _cvsig]

	covergroup cvg_${vf_}_drp;
		option.per_instance = 1;
[rsv_print_fpga $vf_ rr \n _cvp]
	
		// TODO: add cross coverage here. For example,
		// cross coverage for reconfiguring one region while others are running:
		
[rsv_print_fpga $vf_ rr \  _cvcfg]
	endgroup
	
	// new - constructor
	function new (string name, ovm_component parent);
		super.new(name, parent);
		cvg_${vf_}_drp = new;
	endfunction : new

	// Define your own tasks to perform coverage analysis
	// You should not change the name or the prototype of these tasks

	extern virtual protected task initialize_coverage();
	extern virtual protected task collect_coverage(rsv_trans tr);

endclass : ${scb_}

task ${scb_}::initialize_coverage();
	// TODO: Implement your own initialize_coverage() task here
	// It should initialize the scoreboard

endtask : ${scb_}::initialize_coverage

task ${scb_}::collect_coverage(rsv_trans tr);
	// TODO: Implement your own collect_coverage() task here
	// It should triggers/samples functional coverage group

	rsv_cfg_trans cfg_tr;
	
	if (\$cast(cfg_tr,tr)) begin
		
[rsv_print_fpga $vf_ rr \n _cvspl]
		
		cvg_${vf_}_drp.sample();
	end

endtask : ${scb_}::collect_coverage

`endif // [string toupper ${scb_}]_SVH


"
