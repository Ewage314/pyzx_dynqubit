OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[6];
x q[8];
x q[9];
x q[7];
x q[3];
cx q[4], q[7];
