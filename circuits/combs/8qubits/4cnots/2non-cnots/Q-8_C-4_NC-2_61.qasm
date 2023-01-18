OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[1], q[5];
x q[1];
x q[4];
cx q[7], q[6];
cx q[5], q[4];
cx q[3], q[1];
