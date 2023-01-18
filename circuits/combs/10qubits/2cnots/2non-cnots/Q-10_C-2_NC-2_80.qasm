OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[7];
x q[2];
x q[1];
cx q[8], q[4];
