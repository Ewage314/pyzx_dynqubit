OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[2];
x q[1];
cx q[7], q[9];
x q[3];
x q[8];
cx q[9], q[0];
