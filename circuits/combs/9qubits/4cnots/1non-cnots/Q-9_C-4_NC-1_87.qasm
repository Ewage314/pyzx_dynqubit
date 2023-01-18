OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[5];
x q[6];
cx q[5], q[1];
cx q[0], q[7];
cx q[1], q[3];
