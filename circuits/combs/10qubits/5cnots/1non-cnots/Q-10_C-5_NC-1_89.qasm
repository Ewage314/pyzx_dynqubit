OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
cx q[6], q[7];
cx q[2], q[0];
cx q[1], q[2];
cx q[7], q[8];
cx q[6], q[5];
