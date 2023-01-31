OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[2], q[5];
cx q[3], q[2];
z q[4];
cx q[0], q[5];
cx q[4], q[0];
