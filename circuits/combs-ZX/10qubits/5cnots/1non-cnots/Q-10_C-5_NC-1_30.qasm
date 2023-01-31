OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[6];
cx q[0], q[7];
cx q[6], q[8];
cx q[1], q[2];
x q[9];
cx q[6], q[0];
