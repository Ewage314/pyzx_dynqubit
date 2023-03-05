OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[5];
x q[3];
cx q[14], q[13];
cx q[1], q[4];
cx q[4], q[7];
