OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[9];
cx q[7], q[8];
z q[5];
z q[1];
cx q[3], q[0];
cx q[0], q[8];
