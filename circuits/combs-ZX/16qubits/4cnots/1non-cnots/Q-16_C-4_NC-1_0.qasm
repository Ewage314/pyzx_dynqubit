OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[15];
x q[15];
cx q[9], q[5];
cx q[4], q[8];
cx q[10], q[0];
