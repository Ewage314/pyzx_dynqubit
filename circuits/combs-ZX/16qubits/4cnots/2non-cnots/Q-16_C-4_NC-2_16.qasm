OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[0];
x q[5];
z q[9];
cx q[7], q[0];
cx q[14], q[6];
cx q[10], q[14];
