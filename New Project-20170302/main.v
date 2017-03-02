/*==============================MEMORY================================
Modulo para simlar una memori de 256byte. La misma
posee los siguientes valores de I/O:
Input:
    1: DataIn[31:0]     - bus de entrada 
    2: Address[8]       - bus para indicar direccion en memoria,
                          el 8 es log(size)
    3: RW               - 1:= read operation
                          0:= write operation
    4: Mov              - memory operation valid
                          1:= proceed with operations (R/W)
                          0:= no operation (R/W)
    5. ws[1:0]          - word size, cuantos byte se van a write
                          00:= 1byte
                          01:= 2byte
                          10:= 4byte
                          11:= 8byte

Output:
    1: DataOut[31:0]    - data out bus
    2: Moc              - memory operation completed
                          1:= completed
                          2:= not-completed
Data necesaria a saber:
1. Data Type:
    byte (8bit) | halfword (2byte) | word (4byte) | doubleword (8byte)
2. Endianess
    BigEndian
3. Memory direction
    se acceden direcciones menores a mayores
=======================================================================
*/
module ram256x8(output reg [31:0] DataOut, output reg Moc, input [31:0] DataIn, input [7:0] Address, input [1:0] ws, input RW, Mov);
//parametros
parameter byte           = 2'b00;
parameter halfword       = 2'b01;
parameter word           = 2'b10;
parameter doubleword     = 2'b11;
integer   doubleWordFlag = 0;

//Declaracion de memoria
reg [7:0] tempAdd;
reg [7:0] memory[0:255];            //256 localizaciones de memoria de 8bits

always @ (Mov, RW)
    if(Mov)                         //solo se ejecutan las cosas si mov == 1
     begin
        Moc = 1'b0;
        if(RW)                      //read operations
         begin    
            DataOut = memory[Address];
            Moc     = 1'b1;
         end
        else                        //write operations
            case (ws)
                byte:           memory[Address]     = DataIn[7:0];
                halfword:   begin
                                memory[Address]     = DataIn[7:0];
                                memory[Address+1]   = DataIn[15:8];
                            end
                word:       begin
                                memory[Address]     = DataIn[31:0];
                            end
                doubleword: begin
                                if(!doubleWordFlag)
                                    begin
                                        memory[Address] = DataIn[31:0];
                                        doubleWordFlag  = 1;
                                    end
                                else
                                    begin
                                        memory[Address+1] = DataIn[31:0];
                                        doubleWordFlag    = 0;
                                    end
                            end
            endcase
     end
endmodule

//past write algorithm
 /* //este bloque no funciona por que es un HDL language y no s epueden poner variables dinamica dentro de indexing
            //tempAdd     = Address;
            //startPos    = ((ws+1)*8) - 1; 
            //finalPos    = startPos - 7;
            //for (i = ws; i >=0; i = i -1)
            // begin
            //    startPos    = ((i+1)*8) - 1; 
            //    finalPos    = startPos - 7;
            //    memory[tempAdd] = DataIn[startPos:finalPos];
            //    tempAdd     = tempAdd + 1;          //se adjusta proxima direccion
            // end
             */