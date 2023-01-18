OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[3];
x q[7];
cx q[3], q[9];
cx q[6], q[7];
cx q[1], q[9];
cx q[2], q[6];
