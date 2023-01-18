OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[1];
cx q[4], q[2];
x q[0];
x q[4];
cx q[6], q[4];
cx q[4], q[8];
