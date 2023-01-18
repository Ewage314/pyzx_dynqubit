OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[0];
cx q[0], q[6];
x q[7];
cx q[8], q[2];
