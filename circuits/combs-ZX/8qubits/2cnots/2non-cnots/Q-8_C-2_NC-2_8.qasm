OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[2];
x q[2];
cx q[3], q[6];
cx q[0], q[7];
