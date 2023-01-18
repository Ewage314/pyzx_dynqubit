OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
cx q[3], q[2];
x q[0];
x q[4];
cx q[0], q[1];
