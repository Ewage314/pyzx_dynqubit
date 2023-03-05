OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[0];
z q[6];
cx q[7], q[4];
cx q[11], q[1];
cx q[2], q[14];
cx q[15], q[1];
