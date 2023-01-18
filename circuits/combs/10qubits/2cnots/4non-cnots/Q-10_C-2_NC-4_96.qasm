OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[5];
x q[4];
x q[9];
x q[7];
x q[6];
cx q[5], q[2];
