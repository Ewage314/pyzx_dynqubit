OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[12];
cx q[14], q[17];
cx q[7], q[9];
cx q[16], q[5];
cx q[14], q[19];
