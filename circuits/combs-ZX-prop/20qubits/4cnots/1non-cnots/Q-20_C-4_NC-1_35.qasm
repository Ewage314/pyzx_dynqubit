OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[2];
cx q[9], q[16];
cx q[19], q[11];
cx q[4], q[1];
cx q[15], q[17];
