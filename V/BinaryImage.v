module BinaryImage(
        iCLK,
        iRST,
        iDVAL,
        iDATA,
        oDATA,
        oDVAL,
        );

parameter threshold = 10'd190;
  
input      iCLK;
input      iRST;
input      iDVAL;
input[9:0] iDATA;
output reg[9:0] oDATA;
output reg oDVAL;


always@(posedge iCLK or negedge iRST)
begin
  if(!iRST)
    begin
      oDVAL <= 1'b0;
      oDATA <= 10'b0000000000;
    end
  else
    begin
      oDVAL <= iDVAL;
      if(iDVAL)
        begin
          if(iDATA > threshold)
            oDATA <= 10'b1111111111;
          else
            oDATA <= 10'b0;
        end
      else
          oDATA <= 10'b0000000000;
    end
end
endmodule 
