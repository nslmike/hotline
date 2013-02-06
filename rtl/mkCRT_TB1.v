//
// Generated by Bluespec Compiler, version 2013.01.beta5 (build 30325, 2013-01-23)
//
// On Mon Feb  4 13:39:46 EST 2013
//
// Method conflict info:
// (none)
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkCRT_TB1(CLK,
		 RST_N);
  input  CLK;
  input  RST_N;

  // register cycleCount
  reg [15 : 0] cycleCount;
  wire [15 : 0] cycleCount_D_IN;
  wire cycleCount_EN;

  // ports of submodule a4ls
  wire [31 : 0] a4ls_ARADDR, a4ls_AWADDR, a4ls_RDATA, a4ls_WDATA;
  wire [3 : 0] a4ls_WSTRB;
  wire [2 : 0] a4ls_ARPROT, a4ls_AWPROT;
  wire [1 : 0] a4ls_BRESP, a4ls_RRESP;
  wire a4ls_ARREADY,
       a4ls_ARVALID,
       a4ls_AWREADY,
       a4ls_AWVALID,
       a4ls_BREADY,
       a4ls_BVALID,
       a4ls_RREADY,
       a4ls_RVALID,
       a4ls_WREADY,
       a4ls_WVALID;

  // ports of submodule crt2axi
  wire [35 : 0] crt2axi_axiM0_wrData_data;
  wire [34 : 0] crt2axi_axiM0_rdAddr_data, crt2axi_axiM0_wrAddr_data;
  wire [33 : 0] crt2axi_axiM0_rdResp_data_value;
  wire [31 : 0] crt2axi_crtS0_request_put;
  wire [1 : 0] crt2axi_axiM0_wrResp_data_value;
  wire crt2axi_EN_crtS0_request_put,
       crt2axi_EN_crtS0_response_get,
       crt2axi_axiM0_rdAddr_ready_value,
       crt2axi_axiM0_rdAddr_valid,
       crt2axi_axiM0_rdResp_ready,
       crt2axi_axiM0_rdResp_valid_value,
       crt2axi_axiM0_wrAddr_ready_value,
       crt2axi_axiM0_wrAddr_valid,
       crt2axi_axiM0_wrData_ready_value,
       crt2axi_axiM0_wrData_valid,
       crt2axi_axiM0_wrResp_ready,
       crt2axi_axiM0_wrResp_valid_value;

  // rule scheduling signals
  wire CAN_FIRE_RL_a4lm_doAlways,
       CAN_FIRE_RL_advance_cycleCount,
       CAN_FIRE_RL_doAlways,
       CAN_FIRE_RL_terminate,
       WILL_FIRE_RL_a4lm_doAlways,
       WILL_FIRE_RL_advance_cycleCount,
       WILL_FIRE_RL_doAlways,
       WILL_FIRE_RL_terminate;

  // remaining internal signals
  reg [63 : 0] v__h2492;

  // submodule a4ls
  mkA4LS #(.hasDebugLogic(1'd1)) a4ls(.ACLK(CLK),
				      .ARESETN(RST_N),
				      .ARADDR(a4ls_ARADDR),
				      .ARPROT(a4ls_ARPROT),
				      .AWADDR(a4ls_AWADDR),
				      .AWPROT(a4ls_AWPROT),
				      .WDATA(a4ls_WDATA),
				      .WSTRB(a4ls_WSTRB),
				      .AWVALID(a4ls_AWVALID),
				      .WVALID(a4ls_WVALID),
				      .BREADY(a4ls_BREADY),
				      .ARVALID(a4ls_ARVALID),
				      .RREADY(a4ls_RREADY),
				      .AWREADY(a4ls_AWREADY),
				      .WREADY(a4ls_WREADY),
				      .BVALID(a4ls_BVALID),
				      .BRESP(a4ls_BRESP),
				      .ARREADY(a4ls_ARREADY),
				      .RVALID(a4ls_RVALID),
				      .RDATA(a4ls_RDATA),
				      .RRESP(a4ls_RRESP));

  // submodule crt2axi
  mkCRTServToA4LM crt2axi(.CLK(CLK),
			  .RST_N(RST_N),
			  .axiM0_rdAddr_ready_value(crt2axi_axiM0_rdAddr_ready_value),
			  .axiM0_rdResp_data_value(crt2axi_axiM0_rdResp_data_value),
			  .axiM0_rdResp_valid_value(crt2axi_axiM0_rdResp_valid_value),
			  .axiM0_wrAddr_ready_value(crt2axi_axiM0_wrAddr_ready_value),
			  .axiM0_wrData_ready_value(crt2axi_axiM0_wrData_ready_value),
			  .axiM0_wrResp_data_value(crt2axi_axiM0_wrResp_data_value),
			  .axiM0_wrResp_valid_value(crt2axi_axiM0_wrResp_valid_value),
			  .crtS0_request_put(crt2axi_crtS0_request_put),
			  .EN_crtS0_request_put(crt2axi_EN_crtS0_request_put),
			  .EN_crtS0_response_get(crt2axi_EN_crtS0_response_get),
			  .RDY_crtS0_request_put(),
			  .crtS0_response_get(),
			  .RDY_crtS0_response_get(),
			  .axiM0_wrAddr_data(crt2axi_axiM0_wrAddr_data),
			  .axiM0_wrAddr_valid(crt2axi_axiM0_wrAddr_valid),
			  .axiM0_wrData_data(crt2axi_axiM0_wrData_data),
			  .axiM0_wrData_valid(crt2axi_axiM0_wrData_valid),
			  .axiM0_wrResp_ready(crt2axi_axiM0_wrResp_ready),
			  .axiM0_rdAddr_data(crt2axi_axiM0_rdAddr_data),
			  .axiM0_rdAddr_valid(crt2axi_axiM0_rdAddr_valid),
			  .axiM0_rdResp_ready(crt2axi_axiM0_rdResp_ready));

  // rule RL_doAlways
  assign CAN_FIRE_RL_doAlways = 1'd1 ;
  assign WILL_FIRE_RL_doAlways = 1'd1 ;

  // rule RL_terminate
  assign CAN_FIRE_RL_terminate = cycleCount == 16'd200 ;
  assign WILL_FIRE_RL_terminate = CAN_FIRE_RL_terminate ;

  // rule RL_advance_cycleCount
  assign CAN_FIRE_RL_advance_cycleCount = 1'd1 ;
  assign WILL_FIRE_RL_advance_cycleCount = 1'd1 ;

  // rule RL_a4lm_doAlways
  assign CAN_FIRE_RL_a4lm_doAlways = 1'd1 ;
  assign WILL_FIRE_RL_a4lm_doAlways = 1'd1 ;

  // register cycleCount
  assign cycleCount_D_IN = cycleCount + 16'd1 ;
  assign cycleCount_EN = 1'd1 ;

  // submodule a4ls
  assign a4ls_ARADDR = crt2axi_axiM0_rdAddr_data[31:0] ;
  assign a4ls_ARPROT = crt2axi_axiM0_rdAddr_data[34:32] ;
  assign a4ls_AWADDR = crt2axi_axiM0_wrAddr_data[31:0] ;
  assign a4ls_AWPROT = crt2axi_axiM0_wrAddr_data[34:32] ;
  assign a4ls_WDATA = crt2axi_axiM0_wrData_data[31:0] ;
  assign a4ls_WSTRB = crt2axi_axiM0_wrData_data[35:32] ;
  assign a4ls_AWVALID = crt2axi_axiM0_wrAddr_valid ;
  assign a4ls_WVALID = crt2axi_axiM0_wrData_valid ;
  assign a4ls_BREADY = crt2axi_axiM0_wrResp_ready ;
  assign a4ls_ARVALID = crt2axi_axiM0_rdAddr_valid ;
  assign a4ls_RREADY = crt2axi_axiM0_rdResp_ready ;

  // submodule crt2axi
  assign crt2axi_axiM0_rdAddr_ready_value = a4ls_ARREADY ;
  assign crt2axi_axiM0_rdResp_data_value = { a4ls_RRESP, a4ls_RDATA } ;
  assign crt2axi_axiM0_rdResp_valid_value = a4ls_RVALID ;
  assign crt2axi_axiM0_wrAddr_ready_value = a4ls_AWREADY ;
  assign crt2axi_axiM0_wrData_ready_value = a4ls_WREADY ;
  assign crt2axi_axiM0_wrResp_data_value = a4ls_BRESP ;
  assign crt2axi_axiM0_wrResp_valid_value = a4ls_BVALID ;
  assign crt2axi_crtS0_request_put = 32'h0 ;
  assign crt2axi_EN_crtS0_request_put = 1'b0 ;
  assign crt2axi_EN_crtS0_response_get = 1'b0 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cycleCount <= `BSV_ASSIGNMENT_DELAY 16'd0;
      end
    else
      begin
        if (cycleCount_EN)
	  cycleCount <= `BSV_ASSIGNMENT_DELAY cycleCount_D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cycleCount = 16'hAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_terminate)
	begin
	  v__h2492 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_terminate)
	$display("[%0d]: %m: Terminate rule fired in cycle:%0d",
		 v__h2492,
		 $unsigned(cycleCount));
    if (RST_N != `BSV_RESET_VALUE) if (WILL_FIRE_RL_terminate) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkCRT_TB1
