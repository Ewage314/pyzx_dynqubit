OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[9];
x q[6];
x q[9];
x q[4];
x q[7];
cx q[9], q[0];
