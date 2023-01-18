OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[1];
cx q[9], q[5];
x q[6];
cx q[4], q[7];
