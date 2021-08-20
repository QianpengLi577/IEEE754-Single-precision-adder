`timescale 1ns/1ps

module add_tb;
	reg clk;
	initial clk = 0;
	always #5 clk=~clk;
	
	reg [31:0] rnd1mem [0:999];
	reg [31:0] rnd2mem [0:999];
	reg [10:0] addr;
	wire [31:0] data_o;
	wire [31:0] a,b;
	//mul m1(clk,rnd1mem[addr],data);
	reg [3:0] clk_10;
	reg flag;

	
	initial begin
       $readmemh("E:/CASIA/SNN_RL-co/code_part/generate_mul_data/rnd1hex.txt",rnd1mem);
		 $readmemh("E:/CASIA/SNN_RL-co/code_part/generate_mul_data/rnd2hex.txt",rnd2mem);
       addr = 0;
		 clk_10 = 0;
		 flag = 0;
	end
	integer file1;
	initial begin
	file1 = $fopen("E:/CASIA/SNN_RL-co/code_part/generate_mul_data/add_result.txt","w");
	end
	always @(posedge clk ) begin
		$fwrite(file1,"%h\n",data_o);
		if (addr >= 999) begin
		$fclose(file1);
		$stop;
		end
		else  begin addr = addr + 1;
		
		end
	end
	
	initial
        begin            
            $dumpfile("add_tb.vcd");
            $dumpvars(0,add_tb);
        end


	/*always @(posedge clk) begin
		clk_10 <= clk_10 + 1;
		if (clk_10 == 8)
		flag <= 1;
		else if (clk_10 > 9) begin
		flag <= 0;
		clk_10 <= 0;
		end
		else 
		flag <= 0;
	end
*/
	assign a =rnd1mem[addr];
	assign b =rnd2mem[addr];
	add a1(.MAIN_CLK(clk),.a(a),.b(b),.ab(data_o));
endmodule 
	
	