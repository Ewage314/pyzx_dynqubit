OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[4];
x q[7];
cx q[6], q[5];
cx q[4], q[7];
cx q[8], q[3];
cx q[8], q[0];
