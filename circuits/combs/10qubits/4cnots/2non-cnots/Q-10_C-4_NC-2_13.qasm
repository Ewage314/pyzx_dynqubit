OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[9];
cx q[7], q[6];
cx q[7], q[0];
x q[2];
x q[7];
cx q[4], q[2];
