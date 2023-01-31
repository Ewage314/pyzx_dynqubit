OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[1];
cx q[9], q[4];
x q[0];
cx q[7], q[1];
