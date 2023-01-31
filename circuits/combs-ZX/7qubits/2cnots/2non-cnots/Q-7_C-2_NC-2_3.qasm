OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[4];
z q[3];
cx q[4], q[1];
cx q[5], q[2];
