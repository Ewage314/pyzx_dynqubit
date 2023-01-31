OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[7];
cx q[7], q[5];
cx q[1], q[9];
x q[3];
cx q[1], q[7];
