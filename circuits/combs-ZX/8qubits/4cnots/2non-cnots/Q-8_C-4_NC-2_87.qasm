OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[1], q[6];
cx q[0], q[7];
cx q[1], q[7];
z q[4];
x q[0];
cx q[3], q[0];
