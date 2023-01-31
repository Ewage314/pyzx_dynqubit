OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[5], q[6];
cx q[4], q[2];
x q[3];
z q[6];
cx q[0], q[4];
cx q[3], q[7];
