OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[17];
cx q[3], q[9];
cx q[5], q[14];
x q[5];
cx q[6], q[15];
