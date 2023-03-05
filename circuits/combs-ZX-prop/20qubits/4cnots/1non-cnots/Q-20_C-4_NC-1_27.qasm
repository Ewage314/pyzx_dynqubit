OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[16];
x q[15];
cx q[15], q[7];
cx q[9], q[0];
cx q[8], q[0];
