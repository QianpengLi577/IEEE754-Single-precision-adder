iverilog -o "add_tb.vvp" add_tb.v add.v

vvp -n "add_tb.vvp"

gtkwave add_tb.vcd

python count_loss.py

pause