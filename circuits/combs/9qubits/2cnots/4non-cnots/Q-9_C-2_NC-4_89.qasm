OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[3];
x q[6];
x q[6];
x q[0];
cx q[6], q[2];
cx q[4], q[7];
