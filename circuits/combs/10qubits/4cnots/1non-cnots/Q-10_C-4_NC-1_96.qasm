OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
cx q[2], q[7];
cx q[5], q[4];
cx q[9], q[0];
cx q[5], q[8];
