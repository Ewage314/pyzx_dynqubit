OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[6];
cx q[16], q[14];
cx q[10], q[7];
z q[11];
cx q[2], q[9];
