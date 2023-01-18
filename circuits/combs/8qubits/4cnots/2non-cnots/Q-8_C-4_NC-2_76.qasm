OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[1], q[2];
cx q[6], q[1];
x q[0];
cx q[1], q[5];
x q[4];
cx q[1], q[6];
