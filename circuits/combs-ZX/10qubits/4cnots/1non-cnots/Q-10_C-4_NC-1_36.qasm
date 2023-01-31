OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[3], q[0];
cx q[5], q[1];
cx q[4], q[2];
x q[8];
cx q[8], q[1];
