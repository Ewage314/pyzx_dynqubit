OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[2];
x q[4];
cx q[9], q[3];
cx q[7], q[8];
