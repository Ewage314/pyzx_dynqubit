OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[3];
cx q[4], q[10];
cx q[8], q[4];
cx q[15], q[7];
cx q[7], q[5];
