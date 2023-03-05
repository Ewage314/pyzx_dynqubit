OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[2];
cx q[10], q[7];
cx q[12], q[4];
cx q[5], q[9];
cx q[3], q[0];
