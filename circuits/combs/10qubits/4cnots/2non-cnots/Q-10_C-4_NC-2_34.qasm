OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[8];
x q[9];
cx q[7], q[2];
x q[3];
cx q[3], q[1];
cx q[3], q[2];
