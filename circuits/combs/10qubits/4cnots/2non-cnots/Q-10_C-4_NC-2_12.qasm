OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[2], q[6];
cx q[7], q[3];
x q[3];
x q[9];
cx q[9], q[8];
cx q[7], q[4];
