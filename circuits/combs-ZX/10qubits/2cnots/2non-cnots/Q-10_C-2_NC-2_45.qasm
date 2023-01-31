OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[7];
x q[2];
cx q[3], q[9];
cx q[7], q[4];
