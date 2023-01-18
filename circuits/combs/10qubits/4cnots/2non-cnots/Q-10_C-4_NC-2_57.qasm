OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[4];
cx q[5], q[8];
cx q[4], q[8];
x q[6];
cx q[4], q[0];
cx q[1], q[3];
