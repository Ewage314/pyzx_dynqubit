OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[7];
z q[4];
z q[3];
z q[7];
z q[8];
cx q[7], q[4];
