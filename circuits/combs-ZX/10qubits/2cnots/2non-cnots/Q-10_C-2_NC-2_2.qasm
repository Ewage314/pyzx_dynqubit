OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[9];
cx q[6], q[0];
x q[6];
cx q[8], q[7];
