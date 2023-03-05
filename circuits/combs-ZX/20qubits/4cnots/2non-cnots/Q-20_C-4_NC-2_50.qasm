OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[3];
cx q[3], q[13];
cx q[13], q[9];
z q[1];
z q[17];
cx q[12], q[7];
