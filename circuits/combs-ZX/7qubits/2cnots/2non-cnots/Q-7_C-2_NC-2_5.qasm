OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[2];
x q[1];
cx q[2], q[6];
cx q[2], q[4];
