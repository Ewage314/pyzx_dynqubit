OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[14];
cx q[9], q[19];
cx q[1], q[6];
x q[19];
z q[8];
cx q[4], q[7];
