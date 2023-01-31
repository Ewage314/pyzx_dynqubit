OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[5];
z q[3];
cx q[5], q[7];
cx q[5], q[7];
