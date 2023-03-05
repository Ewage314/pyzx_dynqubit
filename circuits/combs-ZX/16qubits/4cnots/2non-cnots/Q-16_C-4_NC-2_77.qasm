OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[3];
cx q[9], q[5];
x q[14];
cx q[15], q[11];
cx q[4], q[11];
cx q[8], q[11];
