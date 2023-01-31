OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[5], q[6];
cx q[7], q[1];
cx q[0], q[4];
x q[4];
z q[0];
cx q[1], q[4];
