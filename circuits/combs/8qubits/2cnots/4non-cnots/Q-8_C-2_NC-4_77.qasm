OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[6];
x q[7];
x q[2];
cx q[0], q[3];
x q[2];
cx q[1], q[4];
