OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[4];
cx q[6], q[11];
cx q[3], q[9];
z q[4];
cx q[12], q[1];
