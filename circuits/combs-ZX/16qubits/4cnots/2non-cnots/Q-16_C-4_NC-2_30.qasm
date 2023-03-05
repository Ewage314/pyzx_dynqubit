OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[7];
x q[2];
cx q[12], q[15];
cx q[8], q[15];
cx q[9], q[6];
cx q[10], q[11];
