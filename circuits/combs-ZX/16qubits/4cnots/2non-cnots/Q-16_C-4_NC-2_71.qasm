OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[11];
cx q[14], q[5];
z q[9];
x q[12];
cx q[12], q[7];
cx q[11], q[1];
