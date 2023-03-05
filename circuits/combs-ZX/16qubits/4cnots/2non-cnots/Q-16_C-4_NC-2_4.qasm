OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[4];
cx q[4], q[2];
z q[9];
cx q[5], q[3];
x q[12];
cx q[5], q[0];
