OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[9];
cx q[9], q[2];
cx q[9], q[1];
cx q[5], q[0];
cx q[6], q[1];
cx q[8], q[1];
