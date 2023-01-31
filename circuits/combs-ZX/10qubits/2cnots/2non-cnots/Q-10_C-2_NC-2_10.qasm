OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[9];
cx q[6], q[0];
z q[7];
cx q[5], q[0];
