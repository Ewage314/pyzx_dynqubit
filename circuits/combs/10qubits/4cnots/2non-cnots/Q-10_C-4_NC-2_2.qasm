OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[0];
cx q[6], q[8];
x q[9];
cx q[1], q[2];
x q[7];
cx q[6], q[4];
