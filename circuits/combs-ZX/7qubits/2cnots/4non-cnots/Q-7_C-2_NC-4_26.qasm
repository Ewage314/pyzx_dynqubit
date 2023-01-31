OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[2];
cx q[0], q[6];
z q[4];
x q[4];
x q[0];
cx q[3], q[1];
