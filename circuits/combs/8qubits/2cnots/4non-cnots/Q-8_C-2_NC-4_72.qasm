OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[7];
cx q[1], q[0];
x q[0];
x q[3];
x q[4];
cx q[3], q[7];
