OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[3];
z q[11];
cx q[1], q[9];
cx q[0], q[1];
cx q[17], q[6];
