OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[1];
z q[5];
x q[0];
cx q[5], q[1];
z q[1];
cx q[4], q[2];
