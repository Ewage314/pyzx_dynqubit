OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[3];
cx q[7], q[14];
x q[4];
x q[4];
cx q[8], q[0];
cx q[4], q[0];
