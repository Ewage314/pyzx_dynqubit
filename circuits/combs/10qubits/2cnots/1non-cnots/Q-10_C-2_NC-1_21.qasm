OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[2];
cx q[8], q[0];
cx q[3], q[5];
