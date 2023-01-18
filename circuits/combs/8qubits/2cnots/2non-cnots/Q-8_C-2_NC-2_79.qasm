OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[1], q[3];
x q[0];
x q[6];
cx q[3], q[2];
