OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[5];
cx q[7], q[3];
x q[5];
cx q[5], q[3];
cx q[0], q[7];
cx q[9], q[5];
