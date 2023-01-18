OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[0];
cx q[9], q[3];
cx q[8], q[1];
cx q[1], q[9];
cx q[8], q[9];
