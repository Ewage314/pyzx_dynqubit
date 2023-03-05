OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[12];
x q[1];
cx q[4], q[9];
cx q[8], q[0];
cx q[8], q[3];
