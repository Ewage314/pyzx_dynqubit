OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[5], q[3];
x q[3];
x q[1];
x q[1];
x q[6];
cx q[7], q[4];
