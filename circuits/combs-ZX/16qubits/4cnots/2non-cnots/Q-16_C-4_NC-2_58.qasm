OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[6];
z q[5];
cx q[14], q[9];
x q[8];
cx q[0], q[13];
cx q[9], q[6];
