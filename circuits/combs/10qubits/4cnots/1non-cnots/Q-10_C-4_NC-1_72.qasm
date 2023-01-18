OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[8];
cx q[2], q[5];
cx q[5], q[6];
cx q[5], q[3];
cx q[0], q[7];
