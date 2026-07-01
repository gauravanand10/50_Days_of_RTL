module switch_level_inverter(

    input a_in,
    output a_out

);

    supply1 vdd;
    supply0 gnd;

    pmos p1(a_out, vdd, a_in);
    nmos n1(a_out, gnd, a_in);

endmodule
