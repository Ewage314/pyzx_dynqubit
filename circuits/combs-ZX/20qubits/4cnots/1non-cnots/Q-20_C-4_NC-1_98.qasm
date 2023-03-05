OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[7];
cx q[5], q[13];
cx q[2], q[18];
cx q[5], q[7];
cx q[1], q[5];
