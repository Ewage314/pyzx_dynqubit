OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[3];
z q[7];
cx q[1], q[0];
cx q[15], q[16];
z q[1];
cx q[14], q[11];
