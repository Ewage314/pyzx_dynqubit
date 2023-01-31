OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[2];
cx q[0], q[1];
cx q[5], q[1];
cx q[7], q[0];
cx q[8], q[9];
