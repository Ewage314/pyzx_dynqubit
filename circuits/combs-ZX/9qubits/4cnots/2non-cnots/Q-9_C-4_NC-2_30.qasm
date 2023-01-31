OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[6];
cx q[0], q[6];
cx q[1], q[5];
z q[1];
cx q[8], q[2];
cx q[1], q[3];
