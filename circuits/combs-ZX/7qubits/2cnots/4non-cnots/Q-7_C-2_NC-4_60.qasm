OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[4];
z q[0];
z q[1];
z q[2];
cx q[0], q[5];
cx q[6], q[2];
