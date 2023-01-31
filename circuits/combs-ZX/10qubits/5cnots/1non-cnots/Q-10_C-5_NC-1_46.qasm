OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[2];
cx q[5], q[6];
cx q[2], q[3];
cx q[6], q[7];
z q[8];
cx q[3], q[9];
