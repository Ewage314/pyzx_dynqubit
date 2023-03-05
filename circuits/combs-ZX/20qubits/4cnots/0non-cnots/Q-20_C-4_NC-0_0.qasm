OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[14];
cx q[16], q[7];
cx q[8], q[16];
cx q[15], q[8];
