OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[7];
cx q[1], q[4];
x q[1];
cx q[0], q[3];
cx q[7], q[5];
