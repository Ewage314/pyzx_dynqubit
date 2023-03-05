OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[12];
cx q[5], q[6];
cx q[5], q[14];
x q[11];
z q[3];
cx q[9], q[11];
