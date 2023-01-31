OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[6];
cx q[6], q[3];
cx q[1], q[5];
z q[1];
cx q[3], q[7];
cx q[2], q[4];
