OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[5];
z q[1];
x q[7];
z q[7];
cx q[8], q[4];
cx q[7], q[5];
