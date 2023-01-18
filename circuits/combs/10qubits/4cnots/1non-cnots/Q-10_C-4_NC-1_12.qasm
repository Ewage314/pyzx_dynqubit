OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[3];
cx q[8], q[3];
cx q[6], q[9];
cx q[4], q[5];
cx q[8], q[0];
