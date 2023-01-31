OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[4];
z q[9];
cx q[9], q[7];
