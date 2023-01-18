OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
x q[7];
x q[3];
cx q[5], q[6];
