OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[5];
cx q[9], q[4];
cx q[5], q[6];
x q[2];
cx q[2], q[7];
cx q[5], q[7];
