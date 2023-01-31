OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[7];
z q[4];
cx q[0], q[5];
