OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[0];
x q[3];
cx q[3], q[2];
z q[0];
cx q[2], q[7];
cx q[8], q[1];
