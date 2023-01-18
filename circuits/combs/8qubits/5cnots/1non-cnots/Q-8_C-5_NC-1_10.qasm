OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[0], q[7];
cx q[4], q[2];
cx q[2], q[4];
x q[1];
cx q[1], q[2];
cx q[2], q[0];
