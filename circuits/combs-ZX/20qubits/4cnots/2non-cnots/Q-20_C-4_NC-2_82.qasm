OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[12];
cx q[15], q[14];
z q[12];
x q[4];
cx q[8], q[5];
cx q[1], q[9];
