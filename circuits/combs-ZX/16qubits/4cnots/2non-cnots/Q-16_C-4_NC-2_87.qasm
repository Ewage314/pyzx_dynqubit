OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[14];
cx q[5], q[13];
x q[5];
z q[13];
cx q[15], q[4];
cx q[0], q[3];
