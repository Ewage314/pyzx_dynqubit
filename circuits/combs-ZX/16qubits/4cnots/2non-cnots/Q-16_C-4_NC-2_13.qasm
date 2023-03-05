OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[7];
x q[5];
cx q[3], q[1];
x q[15];
cx q[12], q[4];
cx q[9], q[11];
