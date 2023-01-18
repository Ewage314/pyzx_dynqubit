OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[2];
x q[7];
cx q[9], q[5];
