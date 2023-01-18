OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[7];
x q[2];
cx q[3], q[7];
