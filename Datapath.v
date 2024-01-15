module Datapath(
input Clock,
input RegDst,
input Branch,
input MemRead,
input MemWrite,
input RegWrite,
input MemToReg,
input ALUSrc,
input [1:0] ALUOp,
output [5:0] opcode
);

 
reg[15:0] pc_initial; // Regjistri PC
wire [15:0] pc_next, pc2, pcbeq;
wire [15:0] instruction;
wire [1:0] mux_regfile;
wire[15:0] readData1, readData2, writeData,
mux_ALU, ALU_Out, Sign_extend , memToMux,
shifter1beq, branchAdderToMux, beqAddress;
wire[3:0] ALUCtrl;
wire zerof, overflow, carryout;
wire andMuxBranch;
wire[1:0] RS;
wire[1:0] RT;
wire[1:0] RD;
wire[7:0] Immediate;
wire[3:0] shamt;

initial
begin
    pc_initial = 16'd10; //inicializimi fillesar i PC ne adresen 10
end

always@(posedge Clock)
begin
    pc_initial <= pc_next; //perditesimi i PC ne cdo teh pozitiv me adresen e ardhshme
   
end

// PC rritet per 2 (ne sistemet 16 biteshe) per te gjitha instruksionet pervec BEQ, BNE
assign pc2 = pc_initial + 2;

// pergatitja e adreses per kercim ne BEQ
assign shifter1beq = {{14{instruction[15]}}, instruction[15:0], 2'b00};

 

//inicializimi i IM (PC adresa hyrje,  instruction- dajle)
InstrMemory IM(pc_initial, instruction);

//Percaktimi nese RD eshte RD (te R-formati) apo RD = RT (te I-formati)
assign mux_regfile = (RegDst == 1'b1) ? RD : RT;

// Sign_extend nga 7 ne 16 bit
assign Sign_extend = {{7{instruction[6]}}, instruction[6:0]};  



assign RS = instruction[11:9];
assign RT = instruction[9:7];
assign RD = instruction[7:5];
assign Funct = instruction[1:0];
assign Immediate = instruction[7:0];



//REGFILE
//inicializimi i RF
registerFile RF(RS, RT, mux_regfile, writeData, readData1, readData2,RegWrite,Clock );

//  Percaktimi nese hyrja e MUX-it para ALU eshte Regjstri 2 i RF apo vlera imediate e instruksionit
assign mux_ALU = (ALUSrc == 1'b1) ? Sign_extend : readData2;

//inicializimi i ALU Control  
ALUControl AC(ALUOp[1:0], Funct, instruction[15:12], ALUCtrl[3:0]);

//inicializimi i ALU 

Alu16bit ALU(readData1, mux_ALU, ALUCtrl[3], ALUCtrl[2:0], zerof, overflow,ALU_Out, carryout);

//inicializimi i Data Memory
DataMemory DM( readData2,Clock,ALU_Out,MemWrite, MemRead,memToMux);

//Teli qe i dergon te dhenat nga MUX ne Regfile
assign writeData = (MemToReg == 1'b1) ? memToMux : ALU_Out;

assign andMuxBranch = zerof & Branch;

// Teli qe mban adresen ne te cilen do te kercej programi kur kushti BEQ plotesohet
assign beqAddress = pc2 + shifter1beq;

//Teli qe del nga Mux  qe kontrollon nese kemi BEQ apo PC+2
assign pcbeq = (andMuxBranch == 1'b1) ? beqAddress : pc2;


//Teli qe i dergohet CU
assign opcode = instruction[15:12];

endmodule