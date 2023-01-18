OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[6];
cx q[2], q[7];
cx q[5], q[7];
cx q[6], q[5];
x q[7];
cx q[5], q[7];
