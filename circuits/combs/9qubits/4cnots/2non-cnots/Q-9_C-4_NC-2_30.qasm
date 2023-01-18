OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[7];
cx q[2], q[6];
x q[0];
cx q[8], q[7];
cx q[6], q[5];
cx q[5], q[3];
