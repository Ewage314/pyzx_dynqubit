OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[6];
cx q[1], q[3];
cx q[0], q[4];
