OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[7];
cx q[18], q[8];
x q[4];
x q[14];
cx q[0], q[12];
cx q[10], q[16];
