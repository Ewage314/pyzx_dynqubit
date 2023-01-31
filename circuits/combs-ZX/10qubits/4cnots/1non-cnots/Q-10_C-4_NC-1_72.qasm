OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[6];
x q[0];
cx q[2], q[1];
cx q[5], q[1];
cx q[0], q[7];
