OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[11];
cx q[16], q[11];
x q[6];
cx q[9], q[15];
cx q[13], q[17];
