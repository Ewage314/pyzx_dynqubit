OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[4], q[3];
z q[0];
cx q[4], q[2];
x q[0];
cx q[5], q[0];
cx q[5], q[1];
