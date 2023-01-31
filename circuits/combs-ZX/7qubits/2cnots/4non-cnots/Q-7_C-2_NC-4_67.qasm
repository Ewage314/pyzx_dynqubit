OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[0];
x q[4];
z q[3];
x q[2];
cx q[3], q[6];
cx q[5], q[4];
