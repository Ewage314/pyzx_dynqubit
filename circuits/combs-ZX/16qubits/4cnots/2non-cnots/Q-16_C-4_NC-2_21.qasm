OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[7];
cx q[14], q[2];
z q[8];
cx q[14], q[9];
cx q[12], q[7];
cx q[5], q[4];
