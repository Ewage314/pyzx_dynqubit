OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[7];
cx q[9], q[6];
x q[9];
cx q[8], q[2];
cx q[1], q[7];
