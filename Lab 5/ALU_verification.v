module ALU_verification(c_out, result, a, b, select);
    parameter size = 1;
    
    // Inputs
    input [size-1:0]            a, b;
    input [2:0]                 select;
    
    // Outputs
    output reg                  c_out;
    output reg [size-1:0]       result;

    always @ (a, b, select)
        case (select)
            3'b001:     begin
                            result <= a;
                            c_out <= 1'b0;
                        end
            3'b000:     begin
                            result <= ~a;
                            c_out <= 1'b0;
                        end
            3'b100:     begin
                            result <= a & b;
                            c_out <= 1'b0;
                        end
            3'b011:     begin
                            result <= a | b;
                            c_out <= 1'b0;
                        end
            3'b110:     begin
                            {c_out, result} <= a - b;
                        end
            3'b101:     begin
                            {c_out, result} <= a + b;
                        end
            3'b111:     begin
                            result <= (a < b) ? 1 : 0;
                            c_out <= 1'b0;
                        end
        endcase
endmodule