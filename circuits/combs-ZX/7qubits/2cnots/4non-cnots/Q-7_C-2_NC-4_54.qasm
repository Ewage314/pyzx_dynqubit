OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[5];
cx q[3], q[0];
z q[2];
x q[3];
z q[1];
cx q[5], q[2];
