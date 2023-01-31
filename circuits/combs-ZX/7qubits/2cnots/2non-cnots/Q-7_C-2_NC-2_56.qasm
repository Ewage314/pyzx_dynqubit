OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[5], q[1];
x q[3];
z q[1];
cx q[4], q[2];
