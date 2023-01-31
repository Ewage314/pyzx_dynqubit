OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[2];
cx q[6], q[2];
cx q[6], q[9];
