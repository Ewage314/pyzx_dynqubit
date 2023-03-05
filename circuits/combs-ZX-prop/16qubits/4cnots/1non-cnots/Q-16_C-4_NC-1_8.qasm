OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[1];
x q[1];
cx q[12], q[5];
cx q[14], q[9];
cx q[3], q[7];
