OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[4], q[2];
x q[7];
cx q[1], q[3];
cx q[4], q[5];
x q[1];
cx q[0], q[4];
