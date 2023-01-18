OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[6];
x q[7];
cx q[0], q[6];
x q[6];
x q[4];
cx q[0], q[5];
