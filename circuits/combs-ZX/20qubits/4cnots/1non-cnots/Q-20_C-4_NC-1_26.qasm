OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[6];
cx q[13], q[12];
cx q[16], q[7];
cx q[17], q[1];
cx q[1], q[17];
