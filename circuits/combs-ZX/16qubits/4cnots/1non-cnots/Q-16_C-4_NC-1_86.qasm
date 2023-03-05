OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[14];
cx q[12], q[4];
cx q[15], q[6];
x q[8];
cx q[3], q[5];
