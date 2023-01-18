OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[4];
cx q[8], q[0];
cx q[7], q[9];
cx q[7], q[2];
cx q[7], q[2];
