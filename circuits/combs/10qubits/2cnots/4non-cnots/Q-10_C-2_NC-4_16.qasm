OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[5];
x q[6];
x q[3];
x q[0];
x q[8];
cx q[7], q[3];
