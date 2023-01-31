OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[1];
cx q[6], q[5];
z q[5];
cx q[0], q[8];
cx q[1], q[8];
cx q[6], q[7];
