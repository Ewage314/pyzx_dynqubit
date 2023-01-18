OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[0];
x q[9];
x q[0];
cx q[4], q[1];
cx q[0], q[7];
cx q[8], q[2];
