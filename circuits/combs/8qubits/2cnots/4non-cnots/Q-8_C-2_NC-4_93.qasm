OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[0], q[5];
x q[6];
x q[4];
x q[3];
x q[6];
cx q[6], q[7];
