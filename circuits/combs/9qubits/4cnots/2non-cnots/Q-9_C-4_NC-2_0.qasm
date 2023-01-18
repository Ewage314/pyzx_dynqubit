OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[5];
cx q[8], q[2];
x q[8];
cx q[5], q[0];
x q[7];
cx q[5], q[8];
