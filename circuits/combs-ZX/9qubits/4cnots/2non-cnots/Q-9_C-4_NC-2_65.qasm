OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[5];
cx q[8], q[5];
cx q[8], q[4];
cx q[2], q[5];
z q[0];
cx q[7], q[1];
