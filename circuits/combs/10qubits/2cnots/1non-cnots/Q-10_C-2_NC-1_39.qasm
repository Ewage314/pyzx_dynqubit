OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[5];
cx q[9], q[3];
cx q[1], q[7];
