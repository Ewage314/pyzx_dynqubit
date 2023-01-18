OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[3], q[6];
x q[9];
x q[1];
cx q[9], q[0];
