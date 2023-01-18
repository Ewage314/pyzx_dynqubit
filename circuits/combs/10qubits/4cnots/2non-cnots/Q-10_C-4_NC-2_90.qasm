OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[1];
cx q[1], q[0];
x q[9];
cx q[0], q[5];
x q[5];
cx q[5], q[7];
