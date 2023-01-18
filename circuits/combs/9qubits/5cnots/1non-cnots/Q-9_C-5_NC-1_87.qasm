OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[8];
cx q[7], q[5];
cx q[6], q[5];
cx q[1], q[0];
x q[2];
cx q[1], q[4];
