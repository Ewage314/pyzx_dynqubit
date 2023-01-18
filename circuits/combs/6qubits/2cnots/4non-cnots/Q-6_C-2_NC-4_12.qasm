OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
cx q[4], q[0];
x q[4];
x q[2];
x q[2];
x q[1];
cx q[1], q[3];
