OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[4], q[7];
x q[1];
cx q[3], q[5];
z q[0];
cx q[5], q[3];
cx q[1], q[0];
