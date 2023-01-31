OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[6];
z q[8];
z q[3];
cx q[2], q[8];
z q[7];
cx q[3], q[0];
