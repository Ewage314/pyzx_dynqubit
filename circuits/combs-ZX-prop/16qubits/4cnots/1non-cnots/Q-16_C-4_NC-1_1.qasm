OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[4];
cx q[1], q[9];
cx q[14], q[6];
x q[3];
cx q[8], q[10];
