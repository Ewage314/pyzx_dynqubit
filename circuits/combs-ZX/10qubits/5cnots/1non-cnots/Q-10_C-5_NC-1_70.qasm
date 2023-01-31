OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[7];
cx q[9], q[5];
cx q[2], q[7];
cx q[5], q[8];
x q[8];
cx q[7], q[5];
