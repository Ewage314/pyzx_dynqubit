OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[2];
x q[0];
x q[3];
cx q[0], q[7];
