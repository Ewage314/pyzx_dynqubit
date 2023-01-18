OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[3];
x q[3];
cx q[8], q[5];
