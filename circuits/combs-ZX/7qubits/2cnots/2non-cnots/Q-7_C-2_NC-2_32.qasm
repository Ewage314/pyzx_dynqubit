OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[5], q[3];
x q[3];
z q[0];
cx q[1], q[2];
