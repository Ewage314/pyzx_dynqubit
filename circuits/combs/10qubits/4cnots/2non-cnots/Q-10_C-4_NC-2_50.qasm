OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[5];
cx q[1], q[7];
x q[2];
x q[4];
cx q[7], q[5];
cx q[8], q[2];
