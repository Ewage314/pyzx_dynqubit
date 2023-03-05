OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[9];
z q[1];
cx q[2], q[17];
cx q[0], q[2];
cx q[19], q[8];
