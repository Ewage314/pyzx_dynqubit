OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[12];
cx q[0], q[7];
cx q[0], q[8];
x q[13];
cx q[1], q[0];
cx q[0], q[9];
