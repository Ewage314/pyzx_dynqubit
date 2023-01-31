OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[2];
cx q[0], q[3];
cx q[6], q[9];
z q[0];
cx q[5], q[4];
