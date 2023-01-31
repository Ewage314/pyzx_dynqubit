OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[7];
z q[3];
cx q[0], q[5];
z q[3];
cx q[0], q[9];
cx q[7], q[1];
