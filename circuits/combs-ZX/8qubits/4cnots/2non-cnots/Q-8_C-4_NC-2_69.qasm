OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[4], q[6];
x q[2];
cx q[4], q[0];
cx q[2], q[4];
z q[5];
cx q[3], q[5];
